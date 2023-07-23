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


    function arity
    ===============
    arity is a fancy name for the number of arguments a function recives.
    a function is uniquely identified by its containing module, its name and its arity.
    a function with arity of one /1 means it receives only one argument
    a function with arity of two /2 means it receives two arguments and so on

    two functions with the same name , but different arities are two different functions.
    Rectangle.area/1
    Rectangle.area/2

    the name might be overloaded but the arities are different.

    it usually makes no sense for different function with the same name to have completly different implementations.
    more commonly, a lower-arity function delegates to a higher-arity function, providing default arguments.

        defmodule calculator do
          def sum(a) do
            sum(a,0)
          end

          def sum(a,b) do
            a + b
          end
        end

    again a lower-arity function is implemented in terms of higher-arity one.
    the pattern is so frequent that elixir allows  you to specify defualts for arguments using the \\ operator followed by default value

        defmodule calculator do
              def sum(a,b \\ 1, c, d \\ 2) do
                a + b
              end
          end

    function visibility
    ===================
    when you define a function using the def macro, the function is made public, it can be called by anyone else.
    in elixir terminology its said the function is exported.

    you can use the defp macro to make the function private.
    a private function can be used only inside the module its defined in

    imports and aliases
    ==================
    calling functions from another module can sometimes be cumbersome
    because you need to reference the module name.
    if your module often calls functions from another module, you can import that other module into your own
    importing a module allows you to call its public functions without prefixing them with the module name

          defmodule MyModule do
            import IO

            def myfunction do
              puts "calling imported function"
            end
          end

    Of course, you can import multiple modules. In fact, the standard library’s Kernel module is automatically imported into every module.
    This is because Kernel contains functions that are often used, so automatic importing makes their usage easier.1.

    an alternative to import is alias , a construct that makes it possible to reference a module under a different name

          defmodule MyModule do
            alias IO, as: MyIO

            def myfunction do
              MyIO.puts("calling imported alias function")
            end
          end

  alias can be useful if a module has a long name.

  Personally, I tend to avoid aliases, because they increase ambiguity.
  But in some cases they can improve readability, especially if you call functions from a long-named module many times.

  module attributes
  ==================
  modules attributes are of two types
  1. those used as compile time constants

          defmodule Circle do
            @pi 3.14

            def area(r) do
              r * r * pi
            end
          end
      the @pi constant exist only during compilation of the module

  2. those registered for runtime

     an attribute can also be registered, which means that it will be stored in the generated binary
     and can be accessed in runtime.

     elixir registers some attributes by default eg @moduledoc and @doc to provide documentation for modules and functions


  Type specification
  ====================
  typespec specification often called typespecs are another important feature based on attributes.
  this feature allows you to provide type information for your functions which can be later analyzed with a static analysis tool called dialyzer

          @spec rectangle_area(number,number) :: number
          def rectangle_area(a,b) do
            sum(a,b) * 3
          end

  here you see the @spec attribute to indicate that both functions accept and return a number

  typespec provides a way of compensating for the lack of a static type system.
  typespec allows you to document your code better

  """

  def rectangle_area(a, b) do
    sum(a,b) * 3
  end

  def square_area(a) do
    rectangle_area(a,a)
    |> abs
    |> Integer.to_string

  end

  defp sum(a,b) do
    a + b
  end

end
