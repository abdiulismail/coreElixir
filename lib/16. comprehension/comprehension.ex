defmodule Comprehension do
  @moduledoc """
    comprehensions help you iterate and transform enumerables.

    iex()> for x <- [1,2,3] do
             x * x
            end

    the comprehension iterates through each element and runs the do/end block
    the result is a list that contains all the results returned by the do/end block.

    comprehensions have various other features that often makes them elegant compared to Enum based iterations.
    eg its possible to perform nested iterations over multiple collections.

            iex(2)> for x <- [1, 2, 3], y <- [1, 2, 3], do: {x, y, x*y}

  """

  def multiplication_table do
    for x <- 1..9, y <- 1..9,
        into: %{} do
      {{x, y}, x*y}
    end
  end
  
end
