defmodule Loops do
  @moduledoc """
    looping in elixir works very different than other languages.
    constructs such as while, do..while are not provided

    in elixir, the principle looping tool is recursion.

    iterating with recursion
    ========================
    lets say you want to  print the first n positive numbers.
    because there are no loops, you must rely on recursion

          defmodule NaturalNums do
              def print(1), do: IO.puts(1)
              def print(n) do
                print(n-1)
                IO.puts(n)
              end
          end

    this code relies on recursion, pattern maching and multiclause functions.
    this code demonstrates the basic way of doing conditional loop. you specify a multiclause function, first providing the clauses that stop the recursion
    this is followed by more general clauses that produce part of the result and call the function recursively
    

  """



end
