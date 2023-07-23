defmodule Myvariable do
  @moduledoc """
   elixir is a dynamic programming language, which means you dont explictly declare a variable or its type
   instead , the variable type is determined by whatever data it contains
   in elixir, assignment is called binding.
   when you initialize a variable with a value, the variable is bound to that value

   each expression in elixir has a result.
   in elixir a variable always starts with a lowercase alpabet character or an underscore

   As added syntactic sugar, variable names can end with the characters ? and !:
   valid_name?
   also_ok!

   data in elixir is immutable, its content cant be changed.
   but variables can be rebound to different value

   monthly_salary = 1000
   monthly_salary = 3000

   rebinding doesnt mutate the existing memory location, it reserves new memory and reassigns the symbolic name to the new location

   You should always be aware of the fact that data is immutable.
   Once a memory location is occupied with data, it can’t be modified until it’s released.
   But variables can be rebound, which makes them point to a differ- ent memory location.
   Thus variables are mutable, whereas the data they point to is immutable.

   elxir is a garbage-collectable langauge, which means you dont have to manually release memory.
   when a variable goes out of scope, the corresponding memory is eligible for garbage collection.
   


  """
  @spec salario :: 1000
  def salario() do
    monthly_salary = 1000
    monthly_salary
  end

  def nextfoldertest do
  end
end
