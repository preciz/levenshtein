defmodule LevenshteinTest do
  use ExUnit.Case
  doctest Levenshtein

  test "distance" do
    assert Levenshtein.distance("", "") == 0
    assert Levenshtein.distance("a", "a") == 0
    assert Levenshtein.distance("a", "b") == 1
    assert Levenshtein.distance("alma", "korte") == 5

    # With empty strings
    assert Levenshtein.distance("", "") == 0
    assert Levenshtein.distance("a", "") == 1
    assert Levenshtein.distance("", "a") == 1
    assert Levenshtein.distance("abc", "") == 3
    assert Levenshtein.distance("", "abc") == 3
    # With equal strings
    assert Levenshtein.distance("a", "a") == 0
    assert Levenshtein.distance("abc", "abc") == 0
    assert Levenshtein.distance("", "a") == 1
    # Only with inserts
    assert Levenshtein.distance("a", "ab") == 1
    assert Levenshtein.distance("b", "ab") == 1
    assert Levenshtein.distance("ac", "abc") == 1
    assert Levenshtein.distance("abcdefg", "xabxcdxxefxgx") == 6
    # Only with deletions
    assert Levenshtein.distance("a", "") == 1
    assert Levenshtein.distance("ab", "a") == 1
    assert Levenshtein.distance("ab", "b") == 1
    assert Levenshtein.distance("abc", "ac") == 1
    assert Levenshtein.distance("xabxcdxxefxgx", "abcdefg") == 6
    # Only with substitutions
    assert Levenshtein.distance("a", "b") == 1
    assert Levenshtein.distance("ab", "ac") == 1
    assert Levenshtein.distance("ac", "bc") == 1
    assert Levenshtein.distance("abc", "axc") == 1
    assert Levenshtein.distance("xabxcdxxefxgx", "1ab2cd34ef5g6") == 6
    # With different operations
    assert Levenshtein.distance("example", "samples") == 3
    assert Levenshtein.distance("sturgeon", "urgently") == 6
    assert Levenshtein.distance("levenshtein", "frankenstein") == 6
    assert Levenshtein.distance("distance", "difference") == 5
    assert Levenshtein.distance("erlang was neat", "elixir is great") == 9
  end
end
