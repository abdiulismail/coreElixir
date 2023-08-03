defmodule Range do
  @moduledoc """
    a range is an abstraction that allows you to represent a range of numbers
    elixir even provides a special syntax for defining ranges

    iex()> range = 1..2

    you cna ask whether a number falls in the range by using the in operator

    iex() 2 in range
    true

    ranges are enumerable , so functions from the Enum module know how to work with them

    iex(4)> Enum.each(1..3, &IO.puts/1 )
    1
    2
    3
    
  """
end
