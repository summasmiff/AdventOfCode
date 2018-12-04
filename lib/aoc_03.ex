defmodule AdventOfCode.Day3 do
  def build_row([head | _] = array, start_num) do

    if head == start_num do
      IO.puts("Array => #{inspect(array, charlists: :as_lists)}")
      array
    else
      new_head = head - 2
      build_row([new_head | array], start_num)
    end
  end

  def test_row(start_num, end_num, test_num) do
    IO.puts("Start num => #{inspect(start_num)}")
    IO.puts("End num => #{inspect(end_num)}")

    if(start_num < test_num) do
      array = build_row([end_num], start_num)
      IO.puts("Member of array? #{inspect(Enum.member?(array, test_num))}")
      Enum.member?(array, test_num)
    else
      false
    end
  end

  def calc_row(start_num, row_diff, row, test_num) do
    end_num = start_num + row_diff
    row_diff = row_diff + 2

    if test_row(start_num, end_num, test_num) do
      IO.puts("Row!!! #{inspect(row)}")
      row
    else
      row = row + 1
      calc_row(end_num + 1, row_diff, row, test_num)
    end
  end

  def manhatten_distance(args) do
    calc_row(2, 6, 2, args)
  end

  def main(args) when is_number(args), do: IO.puts("#{inspect(manhatten_distance(args))}")
  def main(args), do: main(String.to_integer(args))
end
