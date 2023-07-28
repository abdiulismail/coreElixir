defmodule MyModules do
  @moduledoc """
   a module is a collection of functions.
   every elixir function must be defined inside a module

   elixir comes with a standard library that provides many useful modules such IO module
   can be used to do various I/O operations. The function puts from the IO module can be used to print a message to the screen

   to call a function of a module , you use the syntax
   modulename.function_name(args)

   to define your own module , you use defmodule construct.
   inside defmodule , you define functions using def construct

   a single source file may contain multiple modules

        defmodule Module1 do
            ...
        end

        defmodule Module2 do
        ...
        end

  a module name must start with a capital lette and is usually written in camel case
  a module name can consist of alphanumerics, underscores and dot character

      defmodule Geometry.Rectangle do
      ...
      end

  you can also nest modules inside another module

        defmodule Geometry do
            defmodule Rectangle do
      ...   end
      ..end


  """

  def rectangle_area(a, b) do
    a * b
  end
end
