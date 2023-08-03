defmodule Operators do
  @moduledoc """
    elixir operators such as + , - , * , / works just like other other languages

    the only difference is with strict and weak equality

    iex(1)> 1 == 1.0     <- weak equality
    true

    iex(2)> 1 === 1.0    <- Strict equality
    false

    other logical operators are != , < , > , <= , >=

    unlike logical operators , short-circuit oerators work with concept of truthness
    the atoms false and nil are treated as fasly and everything else is treated as truthy

    the && operator returns the second expression only if the first one isnt falsy.
    the  || operator returns the first expression if its truthy, otherwise it returns the second expression
    the unary operator ! returns false if the value is truthy, otherwise it returns true

  """
end
