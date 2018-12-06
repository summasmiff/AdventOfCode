defmodule AdventOfCode.Day2 do
  def sum([h | t]) do
    h * t
  end

  def get_match_count(_, [], count), do: count
  def get_match_count(letter, [h | t], acc) do
    count = if h == letter do
      acc + 1
    else
      acc
    end

    get_match_count(letter, t, count)
  end

  def update_tail([_ | t]) when is_list(t) do
    hd(t) + 1
  end
  def update_tail([_ | t]) when is_number(t) do
    t + 1
  end

  def update_count_list([], count_list), do: count_list
  def update_count_list([h | t], count_list) do
    count = get_match_count(h, t, 1)

    count_list = if(count >= 2 && !Enum.member?(count_list, count)) do
      [ count | count_list ]
    else
      count_list
    end

    update_count_list(t, count_list)
  end

  def calc([], checksum_list) do
    sum(checksum_list)
  end
  def calc([head | list], [check_2 | check_3] = checksum_list) do
    letter_array = String.graphemes(head)
    count_list = update_count_list(letter_array, [])

    checksum_list = case count_list do
      [2] -> [ check_2 + 1 | check_3 ]
      [3] -> [ check_2 | update_tail(checksum_list)]
      [2, 3] -> [ check_2 + 1 | update_tail(checksum_list) ]
      [3, 2] -> [ check_2 + 1 | update_tail(checksum_list) ]
      _ -> checksum_list
    end

    calc(list, checksum_list)
  end

  def compare_words([], _, list), do: list
  def compare_words(_, [], list), do: list
  def compare_words([first_h | first_t], [second_h | second_t], list) do
    list = if (first_h == second_h) do
      [first_h | list]
    else
      list
    end

    compare_words(first_t, second_t, list)
  end

  def compare_against_list(_, [], list1), do: list1
  def compare_against_list(word, [h | t], list1) do
    word2 = String.graphemes(h)
    list = compare_words(word, word2, [])

    cond do
      length(list) > length(list1) -> compare_against_list(word, t, list)
      true -> compare_against_list(word, t, list1)
    end
  end

  def calc2([h | []], list1) do
    word1 = String.graphemes(h)
    list = compare_words(word1, list1, [])

    cond do
      length(list) > length(list1) -> list
      true -> list1
    end
  end
  def calc2([h | tail], list1) do
    word1 = String.graphemes(h)
    list = compare_against_list(word1, tail, list1)

    cond do
      length(list) > length(list1) -> calc2(tail, list)
      true -> calc2(tail, list1)
    end
  end

  def main(args) do
    list = File.read!(args)
    |> String.trim()
    |> String.split("\n")

    # IO.puts(calc(list, [0, 0]))
    IO.puts(Enum.reverse(calc2(list, [])))
  end
end
