defmodule KeywordList do
  @moduledoc """
    a keyword list is a special case of a list, where each element is a two-element tuple, and the first element of each tuple is an atom.
    the second element can be any type.

    iex(1)> days = [{:monday, 1}, {:tuesday, 2}, {:wednesday, 3}]

    Elixir allows a slightly more elegant syntax for defining a keyword list

    iex(2)> days = [monday: 1, tuesday: 2, wednesday: 3]

    keyword lists are often used for small-size key-value structures, where keys are atoms
    most useful functions are available in the Keyword module

    iex(3)> Keyword.get(days, :monday)
    1

    iex(4)> Keyword.get(days, :noday)
    nil

    just as with maps , you can use the access operator [] to fetch a value

    iex()> days[:tuesday]

    
  """
end
