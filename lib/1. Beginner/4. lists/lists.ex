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


    so many functions to work with in lists are found in Enum module

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
    List.replace_at(prime_numbers, 2, 4)
  end

  # insert new element - not good practice , always use pop like operation
  def inser do
    prime_numbers = [1, 2, 3, 5, 7]
    List.insert_at(prime_numbers, 3, 4)
    # insert at the end
    List.insert_at(prime_numbers, -1, 1)
  end

  # insertion using pop-like operation (appending new item to list)
  def insert do
    prime_numbers = [1, 2, 3, 5, 7]
    [:new_element | prime_numbers]
  end

  # concatenate two list using ++ or subract using --
  def conc do
    [1, 2, 4] ++ [5, 6, 7]
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
    new_elemt = head * 2
    [new_elemt | transfrm(tail)]
    # IO.puts("#{new_elemt}")
    # transfrm(tail)
  end

  # delete an element from a list
  #List.delete([],e) , delete a given element from a list, returns a new list without the element
  # if the element occurs more than just once in the list, just the first occurence is removed

  def dele([]), do: []
  def dele(lst) do
    List.delete(lst,2)
    # iex(1)> list = [1,2,3,4,5]
    # [1, 2, 3, 4, 5]
    # iex(2)> MyList.dele(list)
    # [1, 3, 4, 5]
    # iex(3)>
  end

  # delete a specific value using index of that value
  def deleat([]), do: []
  def deleat(lst) do
    List.delete_at(lst,2)
    # iex(1)> list = [1,2,3,4,5]
    # [1, 2, 3, 4, 5]
    # iex(2)> MyList.dele(list)
    # [1, 2, 4, 5]
    # iex(3)>
  end

  # duplicate(elem, n) - duplicates the given element n times in a list
  # n is an integer greater than or equal to 0
  # if n is 0, an empty list is returned
  def dupli([]),do: []
  def dupli(list) do
    List.duplicate(list,3)
    # iex(1)> list = [1,2,3,4,5]
    # [1, 2, 3, 4, 5]
    # iex(2)> MyList.dupli(list)
    # [[1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]]
    # iex(3)>
  end

  # first(list, default \\ nil) - returns the first element in list or default if list is empty
  def first([]),do: []
  def first(list) do
    List.first(list)
    # iex(1)> list = [1,2,3,4,5]
    # [1, 2, 3, 4, 5]
    # iex(2)> MyList.dupli(list)
    # [[1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]]
    # iex(3)>
  end

  # flatten(list) - flattens the given list of nested list
  def flaten([]),do: []
  def flaten(list) do
    List.flatten(list)
    # iex(14)> list = [1,2,[3,4,[5,6,[7,8,9]]]]
    # [1, 2, [3, 4, [5, 6, ~c"\a\b\t"]]]
    # iex(15)> MyList.flaten(list)
    # [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # flatten(list, tail) - flattens the given list of nested lists,
  # the list tail will be added at the end of the flattened list
  # empty list elements from the list are discarded, but not the ones from the tail
  def flaten2([],_),do: []
  def flaten2(list, tail) do
    List.flatten(list,tail)
    # iex(21)> list = [1,2,[3,4,[5,6,[7,8,9]]]]
    # [1, 2, [3, 4, [5, 6, ~c"\a\b\t"]]]
    # iex(22)> MyList.flaten2(list,[9,[],10])
    # [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, [], 10]
  end

  # foldl(list,acc, fun) - folds(reduces) the given list from the left with a function
  # comeback to this when understood ->

  # improper?(list) - returns true if list is an improper list, otherwise returns false
  def impropa(list) do
    List.improper?(list)
    # List.improper?([1, 2 | 3])
    # true

    # List.improper?([1, 2, 3])
    # false
  end


  # keydelete(list, key, position) - receives a list of tuples and deletes the first tuples where the element at position matches the given key
  def keyd(list,x,no) do
    List.keydelete(list,x,no)
      # List.keydelete([a: 1, b: 2], :a, 0)
      # [b: 2]

      # List.keydelete([a: 1, b: 2], 2, 1)
      # [a: 1]

      # List.keydelete([a: 1, b: 2], :c, 0)
      # [a: 1, b: 2]
  end

  # keyfind(list,key,position,default \\ nil) - receives a list of tuples and returns the tuple where the element at position in the tuple matches the given key
  # if no match is found, default is returned
  def keyfnd(list,key,pos) do
    List.keyfind(list,key,pos)
      # List.keyfind([a: 1, b: 2], :a, 0)
      # {:a, 1}

      # List.keyfind([a: 1, b: 2], 2, 1)
      # {:b, 2}

      # List.keyfind([a: 1, b: 2], :c, 0)
      # nil
  end

  

end
