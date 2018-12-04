defmodule AdventOfCode.Day1 do
  def calc_sum([], acc), do: acc
  def calc_sum([head | []], acc, orig) do
    acc = if head == orig, do: acc + head, else: acc

    calc_sum([], acc)
  end
  def calc_sum([head | tail], acc, orig) do
    acc = if head == hd(tail), do: acc + head, else: acc

    calc_sum(tail, acc, orig)
  end
  def calc_sum(_, _, _), do: {:error}

  def main(args) do
    list = File.read!(args)
    |> String.trim("\n")
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)

    IO.puts("#{inspect(calc_sum(list, 0, hd(list)))}")
  end
end
