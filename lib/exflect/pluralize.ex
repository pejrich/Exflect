defmodule Exflect.Pluralize do
  @moduledoc false
  @exceptions Exflect.Shared.exceptions(:pluralize)
  @shared_endings Exflect.Shared.shared_endings(:pluralize)
  @rules (@shared_endings ++
            [
              {"sis", "ses"},
              {"man", "men"},
              {"quiz", "quizes"},
              {"scurf", "scurfs"},
              {"scarf", "scarfs"},
              {"axis", "axes"},
              {"testis", "testes"},
              {"s", "s"}
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

  def match({"", text}), do: {:default, text <> "s"}

  Enum.each(@rules, fn {k, v} ->
    def match({unquote(k), text}), do: {:match, text <> unquote(v)}
  end)

  def match({<<h::binary-1, t::binary>>, acc}), do: match({t, acc <> h})

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
