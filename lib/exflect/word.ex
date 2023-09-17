defmodule Exflect.Word do
  @moduledoc false
  defstruct [:case, :leading, :trailing, :text]

  @whitespace_ranges [
    {9, 13},
    {32, 32},
    {133, 133},
    {160, 160},
    {5760, 5760},
    {8192, 8202},
    {8232, 8233},
    {8239, 8239},
    {8287, 8287},
    {12288, 12288}
  ]
  @whitespace_codepoints Enum.flat_map(@whitespace_ranges, fn {a, b} ->
                           Enum.to_list(a..b)
                         end)

  def new(word) do
    {leading, text, trailing} = parse_whitespace(word)
    kase = get_case(text)

    text =
      case downcase(text) do
        ^text -> text
        downcase -> {downcase, text}
      end

    %__MODULE__{case: kase, text: text, leading: leading, trailing: trailing}
  end

  def text(%{text: "" <> text}), do: text
  def text(%{text: {_, text}}), do: text

  def fix_case(string, :uppercase), do: String.upcase(string)
  def fix_case(string, :lowercase), do: String.downcase(string)
  def fix_case(string, :titlecase), do: String.capitalize(string)
  def fix_case(string, nil), do: string

  def downcase(<<a, _::binary>> = string) when a in ?A..?Z, do: String.downcase(string)
  def downcase(string), do: string

  defp get_case(string) do
    last = :binary.part(string, byte_size(string) - 1, 1)

    case {case_char(string), case_char(last)} do
      {:uppercase, :uppercase} -> :uppercase
      {:lowercase, :lowercase} -> :lowercase
      {:uppercase, :lowercase} -> :titlecase
      {:lowercase, :uppercase} -> nil
    end
  end

  defp case_char(str) do
    gc = :unicode_util.gc(str)

    cond do
      :unicode_util.uppercase(str) == gc -> :uppercase
      true -> :lowercase
    end
  end

  defp leading_whitespace(string), do: :string.take(string, @whitespace_codepoints)

  def trailing_whitespace(string) do
    size = byte_size(string)
    trimmed = String.trim_trailing(string)
    trimmed_size = byte_size(trimmed)
    {trimmed, :binary.part(string, trimmed_size, size - trimmed_size)}
  end

  defp parse_whitespace(string) do
    {leading, rem} = leading_whitespace(string)
    {rem, trailing} = trailing_whitespace(rem)
    {leading, rem, trailing}
  end

  defimpl String.Chars do
    def to_string(%{leading: leading, trailing: trailing, case: kase} = word) do
      text = Exflect.Word.text(word)
      "#{leading}#{Exflect.Word.fix_case(text, kase)}#{trailing}"
    end
  end
end
