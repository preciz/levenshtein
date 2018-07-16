defmodule Levenshtein do
  def distance(a, b) when is_binary(a) and is_binary(b) do
    distance(
      a |> String.to_charlist,
      b |> String.to_charlist
    )
  end

  def distance(a, b) when is_list(a) and is_list(b) do
    :levenshtein.distance(a, b)
  end
end
