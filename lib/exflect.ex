defmodule Exflect do
  alias Exflect.{Singularize, Pluralize, Word}

  @spec singular?(String.t()) :: boolean()
  @doc """
  Returns true is the word is singular, else false.
  """
  def singular?(string), do: Exflect.Detect.singular?(string)

  @spec plural?(String.t()) :: boolean()
  @doc """
  Returns true is the word is plural, else false.
  """
  def plural?(string), do: Exflect.Detect.plural?(string)

  @spec singularize(String.t(), keyword()) :: String.t()
  @doc """
  Singlarizes an English word.

  ```elixir
  iex> Exflect.singularize("leaves")
  "leaf"
  ```

  Takes two options:
  `check`: `boolean` | default: `false`
  `match_style`: `boolean` | default: `false`

  Use the option `check`, if you're not sure about the form of the word you're passing in.
  For performance reasons, to avoid a bunch of expensive regex call, by default the input is not checked to see if it's already singular.
  This incurs about a 30x performance hit. ~40k ips vs ~1.2m ips unchecked.
  ```
  iex> Exflect.singularize("bus")
  "bu"
  iex> Exflect.singularize("bus", check: true)
  "bus"
  ```

  Use the option `match_style` if you want it to maintain the current whitespace/case.
  ```elixir
  iex> Exflect.singularize("  LEAVES  ", match_style: true)
  "  LEAF  "
  ```
  """
  def singularize(text, opts \\ [match_style: false, check: false])

  def singularize("" <> text, opts) do
    check = Keyword.get(opts, :check, false)
    match_style = Keyword.get(opts, :match_style, false)

    cond do
      check && Exflect.Detect.singular?(text) -> text
      true -> unchecked_singularize(text, match_style)
    end
  end

  def singularize(val, opts), do: val |> to_string() |> singularize(opts)

  defp unchecked_singularize("" <> text, true) do
    word = Word.new(text)

    %{word | text: do_singularize(word.text)}
    |> to_string()
  end

  defp unchecked_singularize("" <> text, _) do
    text2 = downcase(text)
    do_singularize({text, text2})
  end

  @spec pluralize(String.t(), keyword()) :: String.t()
  @doc """
  Pluralizes an English word.

  ```elixir
  iex> Exflect.pluralize("leaf")
  "leaves"
  ```

  Takes two options:
  `check`: `boolean` | default: `false`
  `match_style`: `boolean` | default: `false`

  Use the option `check`, if you're not sure about the form of the word you're passing in.
  For performance reasons, to avoid a bunch of expensive regex call, by default the input is not checked to see if it's already plural.
  This incurs about a 30x performance hit. ~40k ips vs ~1.2m ips unchecked.
  ```
  iex> Exflect.pluralize("men")
  "mens"
  iex> Exflect.pluralize("men", check: true)
  "men"
  ```

  Use the option `match_style` if you want it to maintain the current whitespace/case.
  ```elixir
  iex> Exflect.pluralize("  LEAF  ", match_style: true)
  "  LEAVES  "
  ```
  """
  def pluralize(word, opts \\ [match_style: false, check: false])

  def pluralize("" <> text, opts) do
    check = Keyword.get(opts, :check, false)
    match_style = Keyword.get(opts, :match_style, false)

    cond do
      check && Exflect.Detect.plural?(text) -> text
      true -> unchecked_pluralize(text, match_style)
    end
  end

  def pluralize(word, opts), do: word |> to_string() |> pluralize(opts)

  defp unchecked_pluralize("" <> text, true) do
    word = Word.new(text)

    %{word | text: do_pluralize(word.text)}
    |> to_string()
  end

  defp unchecked_pluralize("" <> text, _) do
    text2 = downcase(text)
    do_pluralize({text, text2})
  end

  @spec inflect(String.t(), pos_integer(), keyword()) :: String.t()
  @doc """
  Inflects the input word based on the the integer given.

  ```elixir
  iex> Exflect.inflect("leaf", 0)
  "leaves"
  iex> Exflect.inflect("leaf", 1)
  "leaf"
  iex> Exflect.inflect("leaf", 2)
  "leaves"
  ```
  Also accepts the `match_style` option
  """
  def inflect(word, n, opts \\ [match_style: false])
  def inflect(word, n, opts) when n == 1, do: singularize(word, opts)
  def inflect(word, n, opts) when is_number(n), do: pluralize(word, opts)

  # The reason for tagging the match type is to always pick the highest quality one
  ###
  # If the input is "French", then for pluralization the responses would be
  # "french" -> {:default, "frenches"}
  # "French" -> {:exception, "French"}
  # Even though the exception text is identical to the input, it's actually the better choice because it comes from a more refined, specific match
  # The ordering is: exception > match > default
  ###
  # Exception: means there's a specific, custom rules for that word
  # Match: means the word hit a match pattern
  # Default: means the word got all the way to the end and the default rule is being applied(during pluralization the default is appending an "s").
  defp do_singularize("" <> text), do: Singularize.match!(text)

  defp do_singularize({text, text}), do: Singularize.match!(text)

  defp do_singularize({text, text2}) do
    case {Singularize.match(text), Singularize.match(text2)} do
      {{_, text}, {_, text}} -> text
      {{:exception, text}, _} -> text
      {_, {:exception, text}} -> text
      {{:uncountable, text}, _} -> text
      {_, {:uncountable, text}} -> text
      {{:match, text}, _} -> text
      {_, {:match, text}} -> text
      {{:default, text}, _} -> text
      {_, {:default, text}} -> text
      {{_, text}, {_, text2}} -> text || text2
    end
  end

  defp do_pluralize("" <> text), do: Pluralize.match!(text)
  defp do_pluralize({text, text}), do: Pluralize.match!(text)

  defp do_pluralize({text, text2}) do
    case {Pluralize.match(text), Pluralize.match(text2)} do
      {{_, text}, {_, text}} -> text
      {{:exception, text}, _} -> text
      {_, {:exception, text}} -> text
      {{:uncountable, text}, _} -> text
      {_, {:uncountable, text}} -> text
      {{:match, text}, _} -> text
      {_, {:match, text}} -> text
      {{:default, text}, _} -> text
      {_, {:default, text}} -> text
      {{_, text}, {_, text2}} -> text || text2
    end
  end

  # defp uncountable?({text, text}), do: Shared.uncountable?(text)
  # defp uncountable?({text, text2}), do: Shared.uncountable?(text) || Shared.uncountable?(text2)
  # defp uncountable?("" <> text), do: Shared.uncountable?(text)

  defp downcase(<<a, _::binary>> = string) when a in ?A..?Z,
    do: String.downcase(string)

  defp downcase(string), do: string
end
