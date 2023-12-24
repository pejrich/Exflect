defmodule Exflect.Shared do
  @moduledoc false
  import Exflect.Support.TSV
  priv_path(:exception_path, "exceptions.tsv")
  priv_path(:uncountable_path, "uncountable.tsv")
  priv_path(:endings_path, "endings.tsv")
  @const ~w(b c d f g h j k l m n p q r s t v w x z)
  @exceptions parse_file(@exception_path)
  @sg_pl_exceptions Enum.map(@exceptions, fn [a, b] ->
                      {a, String.split(b, "|") |> List.first()}
                    end)
                    |> Enum.into(%{})

  @pl_sg_exceptions Enum.flat_map(@exceptions, fn [a, b] ->
                      String.split(b, "|") |> Enum.map(&{&1, a})
                    end)
                    |> Enum.into(%{})
  def exceptions(:pluralize), do: @sg_pl_exceptions
  def exceptions(:singularize), do: @pl_sg_exceptions

  @uncountables parse_file(@uncountable_path)
                |> List.flatten()
                |> MapSet.new()
  def uncountable?(word), do: MapSet.member?(@uncountables, word) && word

  @endings parse_file(@endings_path)
           |> Enum.map(&List.to_tuple/1)

  @uncountable_ends Enum.map(["y" | @const], &{"#{&1}ese", "#{&1}ese"})

  @shared_endings @uncountable_ends ++ @endings

  def shared_endings(:pluralize), do: unquote(Enum.uniq_by(@shared_endings, fn {a, _} -> a end))

  def shared_endings(:singularize),
    do:
      unquote(
        Enum.map(@shared_endings, fn {a, b} -> {b, a} end)
        |> Enum.uniq_by(fn {a, _} -> a end)
      )
end
