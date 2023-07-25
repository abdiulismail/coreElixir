defmodule MyTuple do
  @moduledoc """

  tuples are records that are used to group small number of fixed elements
  tuples are denoted using curly braces
  tuples may contain elements of different type

  iex(1)> person = {"Bob", 25}
  {"Bob", 25}

  extract from a tuple
  =====================
  to extract an element from a tuple , you can use the kernel.elem/2 function , which accepts a tuple and zero based index of the element.
  recall Kernel module is auto-imported , so you can call elem instead of kernel.elem

  iex(2)> age = elem(persion, 1)
  25

  modify a tuple
  =============
  to modify the element of the tuple, you can use the kernel.put_elem/3 function, which accepts a tuple,
  a zero-based inde and the new value of the field in the given position

  iex(3)> put_elem(person, 1, 26)
  {"Bob", 26}

  the function put_elem doesnt modify the tuple. it returns the new version, keeping the old one intact.
  recall that data in elixir is immutable, and you cant do an im-memory modification of a value.

  so , how can you use the put_elem function ?
  you need to store its result to another variable

   iex(5)> older_person = put_elem(person, 1, 26)
   {"Bob", 26}

  Recall that variables can be rebound, so you can also do the following:

  iex(7)> person = put_elem(person, 1, 26)
  {"Bob", 26}

  By doing this, you have effectively rebound the person variable to the new memory location.
  The old location isn’t referenced by any other variable, so it’s eligible for garbage collection.

  you can check the number of elements in a list using:application:

  tuple_size(name_of_tuple)

  iex(6)> tuple_size(old_person)
  2

  tuples are most appropriate to group a small, fixed number of elements together.
  when you need a dynamically sized collection, you can use lists

  tuples are good for reading data while lists are better for traversals.
  tuples are typically used either when a function has multiple return values or for error handling

  File.read/1

  returns {:ok, content} if reading the given file is successful or {:error,reason} when not successful


  """

  def mytuple do

    person = {"bob", 1}

    _exract = elem(person,1)


    old_person = put_elem(person,1,45)

    _size = tuple_size(old_person)

    # insert an element at the end of a tuple
    # returns a new tuple with the elements appended at the end
    insert_new_person = Tuple.append(old_person,"kenya")

    # delete the element at the given index from a tuple
    remove_new = Tuple.delete_at(insert_new_person,2)

    # duplicates - creates a new tuple or any data passed , times the size passed
    _duplicate = Tuple.duplicate(remove_new, 3)

    # insert an element into a tuple
    # insert value at the given index
    insert = Tuple.insert_at(remove_new, 0,"test")

    # product - Computes a product of tuple elements.
    _prod = Tuple.product({345,234})

    # sum - Computes a sum of tuple elements.
    _sum = Tuple.sum({342,555})

    # to_list - Converts a tuple to a list.
    tolist = Tuple.to_list(insert)
    tolist




  end
end
