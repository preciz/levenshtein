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

  The algorithm used is based on the [Wagner-Fischer iterative
  implementation](https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows).

  ## Examples

      iex> Levenshtein.distance("same", "same")
      0
      iex> Levenshtein.distance("kitten", "sitting")
      3
  """
  @spec distance(String.t(), String.t()) :: non_neg_integer()
  def distance(source, target)

  def distance(source, source), do: 0

  def distance(source, <<>>), do: String.length(source)

  def distance(<<>>, target), do: String.length(target)

  def distance(source, target) do
    s = String.graphemes(source)
    t = String.graphemes(target)
    do_distance(s, t)
  end

  defp do_distance(s, t) do
    case trim_prefix(s, t) do
      {[], t} ->
        length(t)

      {s, []} ->
        length(s)

      {s, t} ->
        s = :lists.reverse(s)
        t = :lists.reverse(t)

        case trim_prefix(s, t) do
          {[], t} ->
            length(t)

          {s, []} ->
            length(s)

          {s, t} ->
            {s, t, len_t} =
              if length(s) < length(t) do
                {t, s, length(s)}
              else
                {s, t, length(t)}
              end

            distlist = :lists.seq(0, len_t)
            loop_rows(s, t, distlist, 1)
        end
    end
  end

  defp trim_prefix([h | s], [h | t]), do: trim_prefix(s, t)
  defp trim_prefix(s, t), do: {s, t}

  defp loop_rows([sh], target, distlist, step) do
    loop_cols_last(target, distlist, sh, step)
  end

  defp loop_rows([sh | st], target, distlist, step) do
    new_distlist = loop_cols(target, distlist, sh, [step], step)
    loop_rows(st, target, new_distlist, step + 1)
  end

  defp loop_cols([], _, _, acc, _), do: :lists.reverse(acc)

  defp loop_cols([th | tt], [dh | [da | _] = dt], ch, acc, last) do
    val =
      if th == ch do
        dh
      else
        min(dh, min(last, da)) + 1
      end

    loop_cols(tt, dt, ch, [val | acc], val)
  end

  defp loop_cols_last([], _, _, last), do: last

  defp loop_cols_last([th | tt], [dh | [da | _] = dt], ch, last) do
    val =
      if th == ch do
        dh
      else
        min(dh, min(last, da)) + 1
      end

    loop_cols_last(tt, dt, ch, val)
  end
end
