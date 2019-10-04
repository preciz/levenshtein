defmodule LevenshteinTest do
  use ExUnit.Case
  doctest Levenshtein

  test "distance" do
    assert Levenshtein.distance("", "") == 0
    assert Levenshtein.distance("a", "a") == 0
    assert Levenshtein.distance("a", "b") == 1
    assert Levenshtein.distance("alma", "korte") == 5
  end

  test "distance_cached" do
    assert Levenshtein.distance_cached("", "") == 0
    assert Levenshtein.distance_cached("a", "a") == 0
    assert Levenshtein.distance_cached("a", "b") == 1
    assert Levenshtein.distance_cached("alma", "korte") == 5
  end
end
