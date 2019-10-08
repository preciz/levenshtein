defmodule Levenshtein do
  @moduledoc """
  For what is Levenshtein distance see:

  [https://en.wikipedia.org/wiki/Levenshtein_distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
  """

  @doc """
  Returns an integer representing Levenshtein distance between
  `source` and `target`.

  Levenshtein distance between two words is the minimum number of
  single-character edits (i.e. insertions, deletions or substitutions)
  required to change one word into the other.

  The algorithm used is based on the [Wagner-Fisher iterative
  implementation](http://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows).

  ## Examples

      iex> Levenshtein.distance("kitten", "sitting")
      3
  """
  @spec distance(String.t(), String.t()) :: non_neg_integer
  def distance(source, target)

  def distance(source, source), do: 0

  def distance(source, <<>>), do: String.length(source)

  def distance(<<>>, target), do: String.length(target)

  def distance(source, target) do
    source = String.graphemes(source)
    target = String.graphemes(target)
    distlist = 0..Kernel.length(target) |> Enum.to_list()
    do_distance(source, target, distlist, 1)
  end

  defp do_distance([], _, distlist, _), do: List.last(distlist)

  defp do_distance([src_hd | src_tl], target, distlist, step) do
    distlist = distlist(target, distlist, src_hd, [step], step)
    do_distance(src_tl, target, distlist, step + 1)
  end

  defp distlist([], _, _, new_distlist, _), do: Enum.reverse(new_distlist)

  defp distlist(
         [target_hd | target_tl],
         [distlist_hd | distlist_tl],
         grapheme,
         new_distlist,
         last_dist
       ) do
    diff = if target_hd != grapheme, do: 1, else: 0
    min = min(min(last_dist + 1, hd(distlist_tl) + 1), distlist_hd + diff)
    distlist(target_tl, distlist_tl, grapheme, [min | new_distlist], min)
  end
end
