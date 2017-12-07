# AdventOfCode
My Advent of Code solutions

## Installation
Compile by running `mix escript.build`

Update mix.exs with the command & filename you'd like to run:
```
def project do
    [
      app: :command
      escript: [main_module: filename],
      ...
    ]
end
```
Run using the filename with the input as the first argument.

Day 1: `./aoc_01 "input_01.txt"`
Day 2: `./aoc_02 "input_02.tsv"`
