defmodule ListChallenges do

  # function to calculate the length of a list
  def checklength([]),do: []
  def checklength(mylisy) do
    length(mylisy)
  end

  # function to check if a list is empty
  def checkempty([]),do: IO.puts("empty list")
  def checkempty(_),do: IO.puts("list not empty")


  # function that reverse a list
  def reverse([],rv), do: rv
  def reverse([head | tail] , rv) do
    reverse(tail, [head | rv])
  end
end
