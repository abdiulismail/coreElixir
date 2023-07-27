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

    check for element?
    ===================
    you can check whether a list contains a particular element with the help of the in operator

         5 in prime_numbers

    replace an element
    ====================
    to maniplulate a list, you can use functions from the List module. For example,
    List.replace_at/3 modifies the element at a certain position
          prime_numbers = [1, 2, 3, 5, 7]
          List.replace_at(prime_numbers,2,4)
    like with tuples, the modifier doesnt mutate the data but returns the modified version of it, which you need to store in another variable
    or you can rebound to the same variable

    insert a new elment
    ====================
    you can insert a new element at the specified position with the List.insert_at function

              prime_numbers = [1, 2, 3, 5, 7]
              List.insert_at(prime_numbers,3,4)

    to append to the end , you can use a negative value for the insertion position
              prime_numbers = [1, 2, 3, 5, 7]
              List.insert_at(prime_numbers,-1,4)

    like most list operation, modifying  a random element has a complexity of 0(n).
    in particular appending at the end of the list is expensive as it takes n steps, n being the length of the list

    concatenate two list
    ========================
    you can join two list together using ++ operator
    [1,2,3,4] + [5,6,7]

    again the complexity is 0(n) since its adding at the end of list to another.
    you should avoid adding elements to the end of a list.
    list are most efficient when new elements are pushed to the top, or popped from it

    recursive list
    ===============
    an alternative way to look at list is to think of them as recursive structures
    a list can be represented by a pair(head,tail) , where head is the first element of the list
    and tail points to the (head,tail) pair of the remaining elements.
    in elixir there is a special syntax to support recursive list defnition

    a_list = [head | tail]

    head can be any data type, where tail is itself a list.if tail is empty, it indicates the end of the entire list.

            iex(1)> [1 | [2 | [3 | [4 | []]]]]

    to get to the head of the list, you can use hd function. the tail can be obtained by calling the tl function

            iex(1)> hd([1, 2, 3, 4])
            1

            iex(2)> tl([1, 2, 3, 4])
            [2, 3, 4]

    both operations are 0(1), because they amount to reading one or the other value from (head,tail) pair

    Knowing the recursive nature of the list, it’s simple and efficient to push a new element to the top of the list:
              iex(1)> a_list = [5, :value, true]
              [5, :value, true]

              iex(2)> new_list = [:new_element | a_list]
              [:new_element, 5, :value, true]


  """

  def mylist do
    prime_numbers = [1, 2, 3, 5, 7]
    length(prime_numbers)
  end

  # to get an element from a list , you can use the Enum.at/2 function
  def getele do
    prime_numbers = [1, 2, 3, 5, 7]
    Enum.at(prime_numbers, 4)
  end

  # you can check whether a list contains a particular element with the help of the in operator
  def check do
    prime_numbers = [1, 2, 3, 5, 7]
    5 in prime_numbers
  end

  # replace element at certain position
  def reple do
    prime_numbers = [1, 2, 3, 5, 7]
    List.replace_at(prime_numbers,2,4)
  end

  # insert new element - not good practice , always use pop like operation
  def inser do
    prime_numbers = [1, 2, 3, 5, 7]
    List.insert_at(prime_numbers,3,4)
    # insert at the end
    List.insert_at(prime_numbers,-1,1)
  end

  # concatenate two list
  def conc do
    [1,2,4] ++ [5,6,7]
  end

  # traverse through list using recursion
  def traverse([]), do: []
  def traverse([head | tail]) do
    # do something with the head
    IO.puts("element #{head}")
    # recursive call to traverse the reamining tail
    traverse(tail)
  end

  # transform each element of a list , eg square each element
  def transfrm([]), do: []
  def transfrm([head | tail]) do
     new_elemt = head ** 100000000000000000000000000
    [new_elemt | transfrm(tail)]
    # IO.puts("#{new_elemt}")
    # transfrm(tail)
  end

end
