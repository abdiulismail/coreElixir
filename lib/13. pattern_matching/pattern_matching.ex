defmodule PatternMatching do
  @moduledoc """
    in elixir , the = operator isnt an assignment
    instead , when we write a = 1 , we said variable a was bound to value 1
    the operator = is called the match operator, and the assignment-like expression is called pattern matching

    a match expression has this general form:

        pattern  = expression


    the match operator
    ==================
    iex()> person = {"Bob", 25}

    at runtime, the left side of the = operator is matched to the right side.
    the left side is called a pattern, whereas on the right side you have an expression that evaluates to an elixir term.

    in the example, you match the variable person to the right-side term {"Bob", 25}
    a variable always matches the right-side term , and it becomes bound to the value of that term.


    matching tuples
    ================
    iex()> {name,age} = {"bob",25}

    this expression assumes that the right-side term is a tuple of two-elements.
    when the expression is evaluated, the variable name and age are bound to the corresponding element of the tuple

          iex(2)> name
          "Bob"
          iex(3)> age
          25

    this feature is useful when you call a function that returns a tuple and you want to bind individual elements of that tuple to sepatate variables

          iex(4)> {date, time} = :calendar.local_time

    the date and time are also tuples, which you can further decompose

          iex(5)> {year, month, day} = date
          iex(6)> {hour, minute, second} = time


    what happens if the righ side doesnt correspond to the pattern? the match fails

        iex(7)> {name, age} = "can't match"
        ** (MatchError) no match of right hand side value: "can't match"

    finally, the match expression just like any other expression also returns a value
    the result of a match expression is always the right-side term you match against

          iex(8)> {name, age} = {"Bob", 25}
          {"Bob", 25}


    in the event you are not interested in a particulat return value, you can use the undercore _ to denote anonymous variable

          iex(1)> {_, time} = :calendar.local_time
          iex(2)> time
          {20, 44, 18}

    when it comes to matching, the anonymous variable works just like a named variable
    it matches any righ-side term , but the value isnt bound to any variable

    patterns can be arbitrarily nested. taking the example further

            iex(3)> {_, {hour, _, _}} = :calendar.local_time
            iex(4)> hour
            20


    a variable can be reference multiple times in the same pattern

          iex(5)> {amount, amount, amount} = {127, 127, 127}
          {127, 127, 127}

          iex(6)> {amount, amount, amount} = {127, 127, 1}
          ** (MatchError) no match of right hand side value: {127, 127, 1}


    occasionally you need to match against the content of the variable.
    for this purpose, the pin operator (^) is provided

          iex(7)> expected_name = "Bob"    # Matches anything and then binds to the variable expected_name
          "Bob"

          iex(8)> {^expected_name, _} = {"Bob", 25}   # Matches to the content of the variable
          {"Bob", 25}

          iex(9)> {^expected_name, _} = {"Alice", 30}
          ** (MatchError) no match of right hand side value: {"Alice", 30}


    using the ^expected_name in patterns says you expect the value of the variable expected_name to be in the appropriate positon in the right-side term
    the pin operator doesnt bind the variable, its expects the variable already bound - in other words it has a value and you try to match against that value

    matching lists
    ==============
    list matching works similarly to tuples

            iex(1)> [first, second, third] = [1, 2, 3]
            [1, 2, 3]


            [1 , second , third] = [1 , 2, 3]
            [first , first , first] = [1 , 1, 1]
            [first , second , _] = [1 , 2, 3]
            [^first , second , _] = [1 , 2, 3]



  matching lists is more often done by relying on their recursive nature.

          iex(3)> [head | tail] = [1, 2, 3]
          [1, 2, 3]

          iex(4)> head
          1

          iex(4)> tail
          [2,3]

  if you need only one element of the (head,tail) pair , you can use the anonymous variable
  Here is an inefficient way of calculating the smallest element in the list:

          iex(6)> [min | _] = Enum.sort([3,2,1])

          iex(7)> min
          1

  first you sort the list, and then , with the pattern [min | _] , you take only the head of the sorted llist
  much more elegant way is to use hd

        iex(8)> hd(Enum.sort([3,2,1]))
        1



  matching maps
  =============
  to match a map , the following syntax can be used

        iex(1)> %{name: name, age: age} = %{name: "Bob", age: 25}
        %{age: 25, name: "Bob"}

        iex(2)> name
        "Bob"

        iex(3)> age
        25

  when matching a map, the lef-side pattern doesnt need to contain all the keys from the right-side term

        iex(4)> %{age: age} =  %{name: "Bob", age: 25}

  maps are frequently used to represent structured data.
  in such cases you are often interested in only some of the maps fields.
  partial matching rule allows you to do this

  a match will fail if the pattern contains a key thats not in the matched term

          iex(6)> %{age: age, works_at: works_at} = %{name: "Bob", age: 25}
          ** (MatchError) no match of right hand side value



  compound matches
  ================
  patterns can be arbitrarily nested

    iex(1)> [_, {name, _}, _] = [{"Bob", 25}, {"Alice", 30}, {"John", 35}]

  in this example , the term being matched is a list of three elements.
  each element is a tuple representing a person consisting of two fields: the person name and age
  the match extracts the name of the second person



  match chaining
  ===============
    iex(2)> a = 1 + 3
    4

    iex(3)> a = (b = 1 + 3)
    4

    iex(4)> a = b = 1 + 3
    4


  matching with functions
  ========================
        defmodule Rectangle do
          def area({a, b}) do
             a*b
          end
        end

  When calling functions, the term being matched is the argument provided to the function call.
  The pattern you match against is the argument specifier, in this case {a, b}.

  Of course, if you provide anything that isn’t a two-element tuple, an error will be raised:

  multiclause function - one function can have different arities

          defmodule Geometry do
            def area({:rectangle, a, b}) do
                 a*b
              end

            def area({:square, a}) do
               a*a
            end

            def area({:circle, r}) do
                r * r * 3.14
            end

            def area(unknown) do
               {:error, {:unknown_shape, unknown}}
            end
        end

  """
end
