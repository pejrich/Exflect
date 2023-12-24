defmodule ExflectTest do
  use ExUnit.Case
  doctest Exflect

  @data File.read!("test/test_data.tsv")
        |> String.split("\n")
        |> Enum.map(&(String.split(&1, "\t") |> List.to_tuple()))

  test "singular?/1 / plural?/1" do
    assert(Exflect.singular?("boy"))
    refute(Exflect.singular?("boys"))
    assert(Exflect.plural?("boys"))
    refute(Exflect.plural?("boy"))
    assert(Exflect.singular?("knife"))
    refute(Exflect.singular?("knives"))
    assert(Exflect.plural?("knives"))
    refute(Exflect.plural?("knife"))
  end

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

  test "check: true" do
    assert(equal?(Exflect.pluralize("men"), "mens"))
    assert(equal?(Exflect.pluralize("men", check: true), "men"))
    assert(equal?(Exflect.singularize("bus"), "bu"))
    assert(equal?(Exflect.singularize("bus", check: true), "bus"))
  end

  @tag :benchmark
  test "benchmark" do
    %{
      exflect: fn ->
        Enum.each(@data, fn {sg, _} -> Exflect.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Exflect.singularize(pl) end)
      end,
      exflect_check: fn ->
        Enum.each(@data, fn {sg, _} -> Exflect.pluralize(sg, check: true) end)
        Enum.each(@data, fn {_, pl} -> Exflect.singularize(pl, check: true) end)
      end,
      exflect_match_style: fn ->
        (Enum.map(@data, fn {sg, pl} ->
           Exflect.pluralize(sg, match_style: true) == pl
         end) ++
           Enum.map(@data, fn {sg, pl} ->
             Exflect.singularize(pl, match_style: true) == sg
           end))
        |> score()
      end,
      inflex: fn ->
        Enum.each(@data, fn {sg, _} -> Inflex.pluralize(sg) end)
        Enum.each(@data, fn {_, pl} -> Inflex.singularize(pl) end)
      end
    }
    |> Benchee.run(memory_time: 1, reduction_time: 1)
    |> IO.inspect()
  end

  @core_test %{
    "star" => "stars",
    "bus" => "buses",
    "fish" => "fish",
    "mouse" => "mice",
    "query" => "queries",
    "ability" => "abilities",
    "agency" => "agencies",
    "movie" => "movies",
    "archive" => "archives",
    "wife" => "wives",
    "half" => "halves",
    "move" => "moves",
    "salesperson" => "salespeople",
    "person" => "people",
    "spokesman" => "spokesmen",
    "man" => "men",
    "woman" => "women",
    "basis" => "bases",
    "diagnosis" => "diagnoses",
    "diagnosis_a" => "diagnosis_as",
    "datum" => "data",
    "stadium" => "stadiums",
    "analysis" => "analyses",
    "node_child" => "node_children",
    "child" => "children",
    "experience" => "experiences",
    "day" => "days",
    "comment" => "comments",
    "foobar" => "foobars",
    "newsletter" => "newsletters",
    "old_news" => "old_news",
    "news" => "news",
    "series" => "series",
    "species" => "species",
    "quiz" => "quizzes",
    "perspective" => "perspectives",
    "ox" => "oxen",
    "photo" => "photos",
    "buffalo" => "buffaloes",
    "tomato" => "tomatoes",
    "dwarf" => "dwarves",
    "elf" => "elves",
    "information" => "information",
    "equipment" => "equipment",
    "criterion" => "criteria",
    "foot" => "feet",
    "goose" => "geese",
    "moose" => "moose",
    "tooth" => "teeth",
    "milk" => "milk",
    "salt" => "salt",
    "water" => "water",
    "music" => "music",
    "help" => "help",
    "luck" => "luck",
    "progress" => "progress",
    "rain" => "rain",
    "research" => "research",
    "shopping" => "shopping",
    "software" => "software",
    "traffic" => "traffic",
    "zombie" => "zombies",
    "campus" => "campuses",
    "harddrive" => "harddrives",
    "drive" => "drives",
    "leaf" => "leaves"
  }
  test "compare accuracy" do
    %{
      exflect: fn ->
        (Enum.map(@core_test, fn {sg, pl} -> equal?(Exflect.pluralize(sg), pl) end) ++
           Enum.map(@core_test, fn {sg, pl} -> equal?(Exflect.singularize(pl), sg) end))
        |> score()
      end,
      inflex: fn ->
        (Enum.map(@core_test, fn {sg, pl} -> equal?(Inflex.pluralize(sg), pl) end) ++
           Enum.map(@core_test, fn {sg, pl} -> equal?(Inflex.singularize(pl), sg) end))
        |> score()
      end
    }
    |> Enum.map(fn {k, v} -> {k, v.()} end)
    |> IO.inspect(label: "Core")

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
    |> IO.inspect(label: "Full")
  end

  defp equal?(text, text), do: true
  defp equal?(text, text2), do: String.downcase(text) == String.downcase(text2)

  defp score(list), do: Enum.count(list, & &1) / length(list)
end
