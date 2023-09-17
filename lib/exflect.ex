defmodule Exflect do
  alias Exflect.{Singularize, Pluralize, Shared, Word}

  @spec singularize(String.t(), keyword()) :: String.t()
  @doc """
  Singlarizes an English word.

  ```elixir
  iex> Exflect.singularize("leaves")
  "leaf"
  ```

  Takes the option `match_style` if you want it to maintain the current whitespace/case.
  ```elixir
  iex> Exflect.singularize("  LEAVES  ", match_style: true)
  "  LEAF  "
  ```
  """
  def singularize(text, opts \\ [match_style: false])

  def singularize("" <> text, match_style: true) do
    word = Word.new(text)

    %{word | text: uncountable?(word.text) || do_singularize(word.text)}
    |> to_string()
  end

  def singularize("" <> text, _) do
    text2 = downcase(text)
    uncountable?({text2, text}) || do_singularize({text2, text})
  end

  def singularize(val, opts), do: val |> to_string() |> singularize(opts)

  @spec pluralize(String.t(), keyword()) :: String.t()
  @doc """
  Pluralizes an English word.

  ```elixir
  iex> Exflect.pluralize("leaf")
  "leaves"
  ```

  Takes the option `match_style` if you want it to maintain the current whitespace/case.
  ```elixir
  iex> Exflect.pluralize("  LEAF  ", match_style: true)
  "  LEAVES  "
  ```
  """
  def pluralize(word, opts \\ [match_style: false])

  def pluralize("" <> text, match_style: true) do
    word = Word.new(text)

    %{word | text: uncountable?(word.text) || do_pluralize(word.text)}
    |> to_string()
  end

  def pluralize("" <> text, _) do
    text2 = downcase(text)
    uncountable?({text2, text}) || do_pluralize({text2, text})
  end

  def pluralize(word, opts), do: word |> to_string() |> pluralize(opts)

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
      {{:match, text}, _} -> text
      {_, {:match, text}} -> text
      {{:default, text}, _} -> text
      {_, {:default, text}} -> text
      {{_, text}, {_, text2}} -> text || text2
    end
  end

  defp uncountable?({text, text}), do: Shared.uncountable?(text)
  defp uncountable?({text, text2}), do: Shared.uncountable?(text) || Shared.uncountable?(text2)
  defp uncountable?("" <> text), do: Shared.uncountable?(text)

  defp downcase(<<a, _::binary>> = string) when a in ?A..?Z,
    do: String.downcase(string)

  defp downcase(string), do: string
end
