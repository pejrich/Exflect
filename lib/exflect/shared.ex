defmodule Exflect.Shared do
  @exception_path :code.priv_dir(:exflect) |> Path.join("exceptions.tsv")
  @external_resource @exception_path
  @uncountable_path :code.priv_dir(:exflect) |> Path.join("uncountable.tsv")
  @external_resource @uncountable_path
  @endings_path :code.priv_dir(:exflect) |> Path.join("endings.tsv")
  @external_resource @endings_path
  @const ~w(b c d f g h j k l m n p q r s t v w x z)
  @exceptions @exception_path
              |> File.read!()
              |> String.trim()
              |> String.split("\n")
              |> Enum.map(&String.split(&1, "\t"))
  @sg_pl_exceptions Enum.map(@exceptions, fn [a, b] ->
                      {a, String.split(b, "|") |> List.first()}
                    end)
                    |> Enum.into(%{})

  @pl_sg_exceptions Enum.flat_map(@exceptions, fn [a, b] ->
                      String.split(b, "|")
                      |> Enum.map(&{&1, a})
                    end)
                    |> Enum.into(%{})
  def exceptions(:pluralize), do: @sg_pl_exceptions
  def exceptions(:singularize), do: @pl_sg_exceptions

  @uncountables @uncountable_path
                |> File.read!()
                |> String.trim()
                |> String.split("\n")
                |> MapSet.new()
  def uncountable?(word), do: MapSet.member?(@uncountables, word) && word

  @endings @endings_path
           |> File.read!()
           |> String.trim()
           |> String.split("\n")
           |> Enum.map(&String.split(&1, "\t"))
           |> Enum.map(&List.to_tuple/1)

  @uncountable_ends Enum.map(["y" | @const], &{"#{&1}ese", "#{&1}ese"})

  @shared_endings @uncountable_ends ++ @endings

  def shared_endings(:pluralize), do: @shared_endings |> Enum.uniq_by(fn {a, _} -> a end)

  def shared_endings(:singularize),
    do: Enum.map(@shared_endings, fn {a, b} -> {b, a} end) |> Enum.uniq_by(fn {a, _} -> a end)
end
