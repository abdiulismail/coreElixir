defmodule MyList do
  @moduledoc """
    lists in erlang are  used to manage dynamic, variable-sized collection of data.

        iex> prime_numbers = [1,2,3,5,7]
        [1,2,3,5,7]


    to do something with a list , you have to traverse it.
    therefore most of the operation on list have an 0(n) complexity,
    including the Kernel.length/1 function which iterates through the entire list to calculate its length

          iex> length(prime_numbers)

    to get an element from a list , you can use the Enum.at/2 function.
    Enum.at is again an 0(n) operation, it iterates from the beginning of the list to the desired element.
    lists are never a good fit when direct access is called for. for those purpose , either tuples, maps or
    higher level data structure is appropriate

    you can check whether a list contains a particular element with the help of the in operator

         5 in prime_numbers


  """

  def mylist do
    prime_numbers = [1,2,3,5,7]
    length(prime_numbers)
  end

  # to get an element from a list , you can use the Enum.at/2 function
  def getele do
    prime_numbers = [1,2,3,5,7]
    Enum.at(prime_numbers,4)
  end

  # you can check whether a list contains a particular element with the help of the in operator
  def check do
    prime_numbers = [1,2,3,5,7]
    5 in prime_numbers
  end


  

end
