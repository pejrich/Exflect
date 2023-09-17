defmodule ExflectTest do
  use ExUnit.Case
  doctest Exflect

  @data File.read!("test/test_data.tsv")
        |> String.split("\n")
        |> Enum.map(&(String.split(&1, "\t") |> List.to_tuple()))

  test "match_style: false" do
    assert(equal?(Exflect.pluralize("zoo"), "zoos"))
    assert(equal?(Exflect.pluralize("CAT"), "cats"))
    assert(equal?(Exflect.singularize("leaves"), "leaf"))
    assert(equal?(Exflect.singularize("we"), "I"))
  end

  test "inflect" do
    assert(equal?(Exflect.inflect("man", 0), "men"))
    assert(equal?(Exflect.inflect("man", 1), "man"))
    assert(equal?(Exflect.inflect("man", 2), "men"))
  end

  test "match_style: true" do
    assert(Exflect.singularize("  Things  ", match_style: true) == "  Thing  ")
    assert(Exflect.singularize("\tthieves\t", match_style: true) == "\tthief\t")
    assert(Exflect.pluralize("BOY", match_style: true) == "BOYS")
    assert(Exflect.pluralize("thing   ", match_style: true) == "things   ")
  end

  @tag :benchmark
  test "benchmark" do
    %{
      exflect: fn ->
        Enum.each(@data, fn {sg, _} -> Exflect.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Exflect.singularize(pl) end)
      end,
      exflect_match_style: fn ->
        (Enum.map(@data, fn {sg, pl} -> Exflect.pluralize(sg, match_style: true) == pl end) ++
           Enum.map(@data, fn {sg, pl} -> Exflect.singularize(pl, match_style: true) == sg end))
        |> score()
      end,
      inflex: fn ->
        Enum.each(@data, fn {sg, _} -> Inflex.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Inflex.singularize(pl) end)
      end
    }
    |> Benchee.run(memory_time: 2, reduction_time: 2)
    |> IO.inspect()
  end

  test "compare accuracy" do
    %{
      exflect: fn ->
        (Enum.map(@data, fn {sg, pl} -> equal?(Exflect.pluralize(sg), pl) end) ++
           Enum.map(@data, fn {sg, pl} -> equal?(Exflect.singularize(pl), sg) end))
        |> score()
      end,
      inflex: fn ->
        (Enum.map(@data, fn {sg, pl} -> equal?(Inflex.pluralize(sg), pl) end) ++
           Enum.map(@data, fn {sg, pl} -> equal?(Inflex.singularize(pl), sg) end))
        |> score()
      end
    }
    |> Enum.map(fn {k, v} -> {k, v.()} end)
    |> IO.inspect()
  end

  defp equal?(text, text), do: true
  defp equal?(text, text2), do: String.downcase(text) == String.downcase(text2)

  defp score(list), do: Enum.count(list, & &1) / length(list)
end
