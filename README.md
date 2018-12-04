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
To run:
`./aoc #{day_number} #{input}`
