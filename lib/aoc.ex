defmodule AdventOfCode do
  alias AdventOfCode.{Day1, Day2}

  def main([day, input]) do
    case day do
      "1" -> Day1.main(input)
      "2" -> Day2.main(input)
      _ -> IO.puts("Haven't done that day yet")
    end
  end
end
