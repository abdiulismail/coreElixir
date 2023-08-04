defmodule Macross do
  @moduledoc """
    a macro consist of elixir code that can change the semantics of the input code
    a macro is always called at compile time, it receives the parsed representation of the input elixir code, and it has the opportunity to return an alternative version of that code

    unless some_expression do
      block1
    else
      block2
    end

  unless isnt a special keyword, its a macro that transforms the input code into something like this

    if some_expression do
        block_2
    else
        block_1
    end

  so whenever we say something is macro, the underlying implication is that it runs at compile time and produces alternative code

  """
end
