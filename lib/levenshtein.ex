defmodule Levenshtein do
  @moduledoc """
  For what is Levenshtein distance see:

  [https://en.wikipedia.org/wiki/Levenshtein_distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
  """

  @doc """
  Calculates Levenshtein distance between two words

  Returns a non negative integer.
  """
  @spec distance(binary, binary) :: non_neg_integer
  def distance(a, b) when is_binary(a) and is_binary(b) do
    distance(
      a |> String.to_charlist(),
      b |> String.to_charlist()
    )
  end

  def distance(a, b) when is_list(a) and is_list(b) do
    :levenshtein.distance(a, b)
  end

  @doc """
  Calculates Levenshtein distance between two words

  Returns a non negative integer.
  """
  @spec distance_cached(binary, binary) :: non_neg_integer
  def distance_cached(a, b) when is_binary(a) and is_binary(b) do
    distance_cached(
      a |> String.to_charlist(),
      b |> String.to_charlist()
    )
  end

  def distance_cached(a, b) when is_list(a) and is_list(b) do
    :levenshtein.distance_cached(a, b)
  end
end
