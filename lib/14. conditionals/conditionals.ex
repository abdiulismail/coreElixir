defmodule Conditionals do
  @moduledoc """
    elixir provides some standard ways of doing conditional branching, with constructs such as if and case
    multiclause functions can be used for this purpose as well.

  branching with multiclause functions
  =====================================

     defmodule TestNum do
          def test(x) when x < 0, do: :negative
          def test(0), do: :zero
          def test(x), do: :positive
      end

  the three clauses constitute three conditional branches.
  in a typical imperative langauge such as javascript, you could write like this

        function test(x){
                if (x < 0) return "negative";
                if (x == 0) return "zero";
                return "positive";
          }

  the nice things about multiclause is that they can reap all the benefits of pattern matching.
  eg the following tests whether a given list is empty

        defmodule TestList do
            def empty?([]), do: true
            def empty?([_|_]), do: false
        end

  the first clause matches the empty list, whereas the second clause replies on the [head | tail] representation of a non-empty list

  relying on pattern matching , you can implement ploymorphic functions that do different things depending on the input type.

        defmodule Polymorphic do
            def double(x) when is_number(x), do: 2 * x
            def double(x) when is_binary(x), do: x <> x
        end

        iex(2)> Polymorphic.double(3)
        6
        iex(3)> Polymorphic.double("Jar")
        "JarJar"

  you can also use the classical if else statment

        def max(a,b) do
          if a >= b, do: a, else: b
        end

  there is also the unless macro available, which is equivalent of if(not..):

          def max(a, b) do
            unless a >= b, do: b, else: a
          end


  cond
  =====
  the cond macro can be though of as equivalent to an if-else-if pattern.
  it takes a list of expressions and execute the block of the first expression that evaluates to a truthy value

          def max(a,b) do
            cond do
              a >= b -> a
              true -> b
            end
          end

  the result of cond is the result of the corresponding executed block.
  if none of the conditions is satisfied, cond raises an error

  if you used cond, th simple max/2 function could look like this:

          def max(a,b) do
            cond do
              a >=b -> a
              true -> b     //equivalent to default
            end
          end

  case
  =====
  the general syntax of case is as follows

  case expression do
       pattern_1 ->
       .
       pattern_n ->
  end

  the term pattern here indicates that it deals with pattern matching.
  in the case construct, the provided expression is evaluated, and then the result is matched against given clause.
  the first one that matches is executed, and the result of the corresponding block(its last expression) is the result of the entire case expression
  if no clause matches, an error is raised

  the case powered version of max function would look like this
        def max(a,b) do
            case a >= b do
              true -> a
              false -> b
            end
        end


  As you have seen, there are different ways of doing conditional logic in Elixir.
  Multi- clauses offer a more declarative feel of branching, but they require defining a separate function and passing all the necessary arguments to it.
  Classical constructs like if or case seem more imperative but can often prove simpler than the multiclause approach.
  Selecting the appropriate solution depends on the specific situation as well as your personal preferences.


  """





end
