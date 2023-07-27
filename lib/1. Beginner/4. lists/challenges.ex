defmodule ListChallenges do

  # function that reverse a list
  def reverse([],rv), do: rv
  def reverse([head | tail] , rv) do
    reverse(tail, [head | rv])
  end
end
