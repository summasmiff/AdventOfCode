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
    # for each letter in the item
    count = get_match_count(h, t, 1)

    count_list = if(count >= 2 && !Enum.member?(count_list, count)) do
      [ count | count_list ]
    else
      count_list
    end

    # move on to next letter
    update_count_list(t, count_list)
  end

  def calc([], checksum_list) do
    sum(checksum_list)
  end
  def calc([head | list], [check_2 | check_3] = checksum_list) do
    letter_array = String.graphemes(head)
    #do first word
    count_list = update_count_list(letter_array, [])

    checksum_list = case count_list do
      [2] -> [ check_2 + 1 | check_3 ]
      [3] -> [ check_2 | update_tail(checksum_list)]
      [2, 3] -> [ check_2 + 1 | update_tail(checksum_list) ]
      [3, 2] -> [ check_2 + 1 | update_tail(checksum_list) ]
      _ -> checksum_list
    end

    #move to next word
    calc(list, checksum_list)
  end

  def main(args) do
    list = File.read!(args)
    |> String.trim()
    |> String.split("\n")

    IO.puts(calc(list, [0, 0]))
  end
end
