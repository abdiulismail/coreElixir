defmodule Myatoms do
  @moduledoc """
   Atoms are literal named constants.
   Atoms constants start with a colon character, followed by a combination of alphanumeric
   and underscore characters

   :an_atom
   :another_atom

   its possible to use spaces in the atom name with the following syntax

   :"an atom with spaces"

   an atom consist of two parts, the text and the value
   the atom text is whatever you put after the colon character
   at runtime, this text is kept in the atom table.
   the value is the data that goes into the variable, and is merely a reference the atom table

   this is why atoms are the best used for named constants, they are efficient both in memory and performance-wise
   when you say,

   variable = :some_atom

   the variable doesnt contain the entire text, but only a reference to the atom table
   therefore memory consumption is low, the comparisons are fast and the code is still readable.


    ALIASES
    ==========
    There is another syntax for atom constants. You can omit the beginning colon, and start with uppercase:

    AnAtom

    This is called an alias, and at compile time it’s transformed into :"Elixir.AnAtom":

    iex(1)> AnAtom == :"Elixir.AnAtom"
    true

    When you use an alias, the compiler implicitly adds the Elixir. prefix to its text and inserts an atom there.
    But if an alias already contains that prefix, it’s not added. Conequently, the following also works:

    iex(2)> AnAtom == Elixir.AnAtom
    true


    Atoms as Booleans
    ==================
    Elixir doesnt have a dedicated boolean type
    instead the atoms

    :true
    :false

    the term boolean is still used in elixir to denote an atom that has a value of either :true or :false

    the standard logical operators work with boolean atoms


      iex(1)> true and false
      false
      iex(2)> false or true
      true
      iex(3)> not false
      true

    always keep in mind that a boolean is just an atom that has a value of true or false

    Nil and Truthy values
    =======================
    Another special atom is

    :nil

    which works similar to null from other languages

    the atom nil plays a role in elixir support for truthness.
    thr atoms nil and false are treated as falsy values and everything else treated as truthy values

    This property can be used with Elixir’s short-circuit operators ||, && and !.
    The operator || returns the first expression that isn’t falsy:

    iex(1)> nil || false || 5 || true
    5

    Because both nil, and false are falsy expressions, the number 5 is returned.
    Notice that subsequent expressions won’t be evaluated at all.
    If all expressions evaluate to a falsy value, then the result of the last expression is returned.

    The operator && returns the second expression, but only if the first expression is truthy.
    Otherwise, it returns the first expression without evaluating the second one:

    iex(1)> true && 5
    5

    iex(2)> false && 5
    false

    iex(3)> nil && 5
    nil

    Short-circuiting can be used for elegant operation chaining.
    For example, if you need to fetch a value from cache, a local disk, or a remote database, you can do something like this:

    read_cached || read_from_disk || read_from_database

    Similarly, you can use the operator && to ensure that certain conditions are met:

    database_value = connection_established? && read_data

    In both examples, short-circuit operators make it possible to write concise code with- out resorting to complicated nested conditional constructs.



  """
end
