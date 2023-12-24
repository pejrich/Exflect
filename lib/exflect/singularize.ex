defmodule Exflect.Singularize do
  @moduledoc false
  @exceptions Exflect.Shared.exceptions(:singularize)
  @shared_endings Exflect.Shared.shared_endings(:singularize)

  @rules Enum.sort_by(@shared_endings, fn {k, _} -> -byte_size(k) end)

  @longest List.first(@rules) |> elem(0) |> byte_size()

  def match!(input) do
    case match(input) do
      {_, text} -> text
      err -> raise("Invalid match result #{inspect(err)}")
    end
  end

  def match("" <> text),
    do:
      exception?(text) || uncountable?(text) || match(skip_text(text, byte_size(text) - @longest))

  def match({"s", text}), do: {:default, text}
  def match({"", text}), do: {:default, text}

  Enum.each(@rules, fn {k, v} ->
    def match({unquote(k), text}), do: {:match, text <> unquote(v)}
  end)

  def match({<<h::binary-1, t::binary>>, acc}), do: match({t, acc <> h})

  def exc, do: @exceptions

  # Skips any leading characters longer than the longest suffix match
  defp skip_text(text, diff) when diff > 0 do
    <<h::binary-size(diff), t::binary>> = text
    {t, h}
  end

  defp skip_text(text, _), do: {text, ""}

  defp uncountable?(text) do
    case Exflect.Shared.uncountable?(text) do
      "" <> text -> {:uncountable, text}
      _ -> nil
    end
  end

  defp exception?(text) do
    case Map.get(@exceptions, text) do
      nil -> nil
      text -> {:exception, text}
    end
  end
end
