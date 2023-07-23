defmodule Geometry do
  @moduledoc """
    a function must always be a part of a module.
    function name start with a lowercase letter.
    as with variables , function name can end with the characters ? and !
    the character ? is often used to indicate a function that returns either true or false.
    placing ! at the end of the name indicates a function that may raise a runtime error

    functions can be defined using the def construct.
    the defnition start with def construct, followed by function name, the args list and body enclosed in do..end block.

    the defmodule and def are not keywords but compilation constructs called macros.

    if a function has no arguments , you can omit parenthesis

    the return value of an function  is the value of its last expression.
    there is no explicit return value in elixir
    ofcourse you can always store the function result to a variable

    iex(2)> area = Geometry.rectangle_area(3, 2)

    parenthesis are optional in elixir and you can omit them

    iex(4)> Geometry.rectangle_area 3, 2

    Personally, I find that omitting parentheses makes the code ambiguous, so my advice is to always include them when calling a function

    if a function resides in the same module , you can omit the module prefix

    given that elxir is a functional langauge, you often need to combine functions, passing the result
    of one function as the argument to the next one.
    elixir comes with a built in operator |> called the pipeline operator

    -5
    |> abs
    |> Integer.to_string
    |> IO.puts

  """

  def rectangle_area(a, b) do
    a * b
  end

  def square_area(a) do
    rectangle_area(a,a)
    |> abs
    |> Integer.to_string

  end
end
