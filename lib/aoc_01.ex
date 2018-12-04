defmodule AdventOfCode.Day1 do
  def calculate_pt1(acc, []), do: acc
  def calculate_pt1(acc, [""]), do: acc
  def calculate_pt1(acc, [ head | list ]) do
    calculate_pt1(acc + String.to_integer(head), list)
  end

  def calculate_pt2(acc, [""], freqList, listCopy), do: calculate_pt2(acc, listCopy, freqList, listCopy)
  def calculate_pt2(acc, [ head | list ], [], listCopy) do
    calculate_pt2(acc + String.to_integer(head), list, [acc], listCopy)
  end
  def calculate_pt2(acc, [ head | list ], freqList, listCopy) do
    if Enum.member?(freqList, acc) do
      acc
    else
      calculate_pt2(acc + String.to_integer(head), list, [acc | freqList], listCopy)
    end
  end

  def main(args) do
    list = File.read!(args)
    |> String.split("\n")

    IO.puts("pt 1: #{inspect(calculate_pt1(0, list))}. pt 2: #{inspect(calculate_pt2(0, list, [], list))}")
  end
end
