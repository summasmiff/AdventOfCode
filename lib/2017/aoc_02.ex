defmodule AdventOfCode2017.Day2 do
  # Calculate the checksum of input_02.tsv.
  # For each row, determine the difference between the largest value and the smallest
  # value; the checksum is the sum of all of these differences.

  # For example, given the following spreadsheet:
  # 5 1 9 5
  # 7 5 3
  # 2 4 6 8

  # The first row's largest and smallest values are 9 and 1, and their difference is 8.
  # The second row's largest and smallest values are 7 and 3, and their difference is 4.
  # The third row's difference is 6.
  # In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
  def integerify(head) do
    String.split(head)
    |> Enum.map(&String.to_integer/1)
  end

  def remap_tsv_strings([head | []], acc) do
    row = integerify(head)
    |> Enum.sort()

    with [least | _] = row, [most | _ ] = Enum.reverse(row) do
      sum = most - least
      sum + acc
    end
  end

  def remap_tsv_strings([head | tail], acc) do
    row = integerify(head)
    |> Enum.sort()

    acc = with [least | _] = row, [most | _ ] = Enum.reverse(row) do
      sum = most - least
      sum + acc
    end

    remap_tsv_strings(tail, acc)
  end

  def main(path) do
    tsv = File.read!(path)
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn(x) -> String.length(x) == 0 end)

    IO.puts("#{inspect(remap_tsv_strings(tsv, 0))}")
  end
end
