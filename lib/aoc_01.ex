defmodule AdventOfCode.Day1 do
  def calculate(acc, []), do: acc
  def calculate(acc, [""]), do: acc
  def calculate(acc, [ head | list ]) do
    calculate(acc + String.to_integer(head), list)
  end

  def main(args) do
    list = File.read!(args)
    |> String.split("\n")

    total = calculate(0, list)
    IO.puts(inspect(total))
  end
end
