defmodule AdventOfCode do
  # review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.
  # For example:
  # 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
  # 1111 produces 4 because each digit (all 1) matches the next.
  # 1234 produces 0 because no digit matches the next.
  # 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

  def calc_sum([], acc) do
    acc
  end

  def calc_sum([head | []], acc, orig) do
    acc =
    if head == hd(orig) do
      acc + head
    else
      acc
    end

    calc_sum([], acc)
  end

  def calc_sum([head | tail], acc, orig) do
    acc =
    if head == hd(tail) do
      acc + head
    else
      acc
    end

    calc_sum(tail, acc, orig)
  end

  def main(args) do
    list = File.read!(args)
    |> String.trim("\n")
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)

    IO.puts("#{inspect(calc_sum(list, 0, list))}")
  end
end
