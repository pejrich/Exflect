defmodule Exflect.Singularize do
  @moduledoc false
  @exceptions Exflect.Shared.exceptions(:singularize)
  @shared_endings Exflect.Shared.shared_endings(:singularize)

  @rules (@shared_endings ++
            [
              {"women", "woman"},
              {"seamen", "seaman"},
              {"ss", ""},
              {"tives", "tive"},
              {"erves", "erve"},
              {"oes", "o"}
            ])
         |> Enum.sort_by(fn {k, _} -> -byte_size(k) end)

  @longest List.first(@rules) |> elem(0) |> byte_size()

  def match!(input) do
    case match(input) do
      {_, text} -> text
      err -> raise("Invalid match result #{inspect(err)}")
    end
  end

  def match("" <> text),
    do: exception?(text) || match(skip_text(text, byte_size(text) - @longest))

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

  defp exception?(text) do
    case Map.get(@exceptions, text) do
      nil -> nil
      text -> {:exception, text}
    end
  end
end
