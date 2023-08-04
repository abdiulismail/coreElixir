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

    compute something in a loop and return the result

          defmodule ListHelper do
              def sum([]), do: 0
              def sum([head | tail]) do
                head + sum(tail)
              end
          end

     tail function call
     ===================
        def original_fun(...) do
              ...
              another_fun(...)   # Tail call
        end

    because tail recursion doesnt consume additional memory, its an appropriate solution for arbitrarily large iterations.

    higher-order functions
    =======================
    a higher-order function is a fancy name for a function that takes functios(s) as its input and/or returns function(s).
    the word function here means function value

          iex(1)> Enum.each(
                [1, 2, 3],
                fn(x) -> IO.puts(x) end
              )
    the function Enum.each/2 takes an enumerable(in this case, a list and a lambda)
    it iterates through the enumerable, calling the lambda for each of its elements.
    because Enum.each/2 takes lambda as its input, its called a higher-order function.

    the Enum module is a swiss army knife for loops and iterations.
    it contains alot of useful functions

  """
  def do_sum([]), do: 0

  def do_sum([head | tail]) do
    head + do_sum(tail)
  end
end
