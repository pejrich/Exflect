defmodule Exflect.Ordinalize do
  @moduledoc false
  def ordinalize(number) when is_integer(number) do
    cond do
      rem(number, 100) in 11..13 ->
        Integer.to_string(number) <> "th"

      true ->
        Integer.to_string(number) <>
          case rem(number, 10) do
            1 -> "st"
            2 -> "nd"
            3 -> "rd"
            _ -> "th"
          end
    end
  end
end
