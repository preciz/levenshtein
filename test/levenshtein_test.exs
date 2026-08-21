defmodule LevenshteinTest do
  use ExUnit.Case
  doctest Levenshtein

  describe "distance/2" do
    test "identical strings" do
      assert Levenshtein.distance("", "") == 0
      assert Levenshtein.distance("a", "a") == 0
      assert Levenshtein.distance("abc", "abc") == 0
      assert Levenshtein.distance("hello world", "hello world") == 0

      # Same string reference / variable
      str = "testing same reference"
      assert Levenshtein.distance(str, str) == 0
    end

    test "empty strings" do
      assert Levenshtein.distance("", "") == 0
      assert Levenshtein.distance("a", "") == 1
      assert Levenshtein.distance("", "a") == 1
      assert Levenshtein.distance("abc", "") == 3
      assert Levenshtein.distance("", "abc") == 3
      assert Levenshtein.distance("hello", "") == 5
      assert Levenshtein.distance("", "world") == 5
    end

    test "insertions only" do
      assert Levenshtein.distance("a", "ab") == 1
      assert Levenshtein.distance("b", "ab") == 1
      assert Levenshtein.distance("ac", "abc") == 1
      assert Levenshtein.distance("abcdefg", "xabxcdxxefxgx") == 6
      assert Levenshtein.distance("cat", "scratches") == 6
    end

    test "deletions only" do
      assert Levenshtein.distance("a", "") == 1
      assert Levenshtein.distance("ab", "a") == 1
      assert Levenshtein.distance("ab", "b") == 1
      assert Levenshtein.distance("abc", "ac") == 1
      assert Levenshtein.distance("xabxcdxxefxgx", "abcdefg") == 6
      assert Levenshtein.distance("scratches", "cat") == 6
    end

    test "substitutions only" do
      assert Levenshtein.distance("a", "b") == 1
      assert Levenshtein.distance("ab", "ac") == 1
      assert Levenshtein.distance("ac", "bc") == 1
      assert Levenshtein.distance("abc", "axc") == 1
      assert Levenshtein.distance("xabxcdxxefxgx", "1ab2cd34ef5g6") == 6
      assert Levenshtein.distance("ball", "bell") == 1
      assert Levenshtein.distance("boat", "boot") == 1
    end

    test "mixed operations" do
      assert Levenshtein.distance("alma", "korte") == 5
      assert Levenshtein.distance("example", "samples") == 3
      assert Levenshtein.distance("sturgeon", "urgently") == 6
      assert Levenshtein.distance("levenshtein", "frankenstein") == 6
      assert Levenshtein.distance("distance", "difference") == 5
      assert Levenshtein.distance("erlang was neat", "elixir is great") == 9
      assert Levenshtein.distance("kitten", "sitting") == 3
      assert Levenshtein.distance("saturday", "sunday") == 3
      assert Levenshtein.distance("rosettacode", "raisethysword") == 8
    end

    test "unicode and multibyte graphemes" do
      # Accents and diacritics
      assert Levenshtein.distance("café", "cafe") == 1
      assert Levenshtein.distance("café", "cafés") == 1
      assert Levenshtein.distance("résumé", "resume") == 2
      assert Levenshtein.distance("árvíztűrő", "arvizturo") == 4

      # Non-Latin alphabets (Cyrillic, Greek, Japanese, etc.)
      assert Levenshtein.distance("привет", "привет мир") == 4
      assert Levenshtein.distance("こんにちは", "こんばんは") == 2
      assert Levenshtein.distance("Ελλάδα", "Ελλάς") == 2

      # Emojis and grapheme clusters
      assert Levenshtein.distance("🚀🔥", "🚀✨") == 1
      assert Levenshtein.distance("😀😁😂", "😀😁") == 1
      assert Levenshtein.distance("👩‍👩‍👦‍👦", "") == 1
      assert Levenshtein.distance("👩‍👩‍👦‍👦", "👩‍👩‍👧‍👧") == 1
    end

    test "whitespace, newlines, and special characters" do
      assert Levenshtein.distance("hello\nworld", "hello world") == 1
      assert Levenshtein.distance("hello\tworld", "hello world") == 1
      assert Levenshtein.distance("\t\r\n", "   ") == 3
      assert Levenshtein.distance("a b c", "abc") == 2
      assert Levenshtein.distance("!@#$%", "^&*()") == 5
    end

    test "symmetry property: distance(a, b) == distance(b, a)" do
      pairs = [
        {"kitten", "sitting"},
        {"example", "samples"},
        {"levenshtein", "frankenstein"},
        {"café", "cafe"},
        {"", "non-empty"},
        {"short", "a much longer string here"}
      ]

      for {a, b} <- pairs do
        assert Levenshtein.distance(a, b) == Levenshtein.distance(b, a)
      end
    end

    test "triangle inequality property: distance(a, c) <= distance(a, b) + distance(b, c)" do
      triples = [
        {"kitten", "sitting", "fitting"},
        {"example", "samples", "simple"},
        {"cat", "hat", "dog"},
        {"levenshtein", "frankenstein", "einstein"}
      ]

      for {a, b, c} <- triples do
        assert Levenshtein.distance(a, c) <=
                 Levenshtein.distance(a, b) + Levenshtein.distance(b, c)
      end
    end
  end
end
