defmodule MyMap do
  @moduledoc """
    a map is a key-value store, where keys and values can be any term
    maps are appropriate when you to combine a couple of fields into a single structure

    iex()> bob = %{:name => "bob", :age => 25, :works_at => "initech"}
    %{age: 25, name: "Bob", works_at: "Initech"}

    if keys are atoms, you can write this so its slightly shorthand syntax

    iex()> bob = %{name: "bob", age: 25, workat: "inftech"}
    %{age: 25, name: "Bob", works_at: "Initech"}

    if you must mix the shorthand syntax with  => , the shorthand syntax must come at the end

    iex()> %{"hello" => "world", a: 1, b: 2}
    %{:a => 1, :b => 2, "hello" => "world"}


    key-value pairs in a map do not follow any order (thats why the above result has different order)

    maps do not impose any restrictions on the key type , anything can be a key in a map
    as key-value structure, maps do not allow duplicated keys.
    keys are compared using the literal-equality operator ===/2, if colliding keys are defined in a map literal, the last one prevails


    to retrieve a field, you can use the access operator [] or Map.get/2 or Map.fetch/2
    iex()> bob[:age]
    25

    iex()> map = %{a: 1, b: 2}
    iex()> Map.fetch(map, :a)
    {:ok, 1}

    atom keys again receive special syntax treatment.The following snippet fetches a value stored under the :age key

    iex()> bob.age

    to change,update  a field value, you can use the following syntax

    iex()> next_bob = %{bob | age: 26}
    %{age: 26, name: "Bob", works_at: "Initech"}

    this syntax can be used to change multiple attributes as well

    iex()> %{bob | age: 26, works_at: "initrode"}
    %{age: 26, name: "Bob", works_at: "Initrode"}

    Map manipulations are available in the Map module

    To insert a key-value pair(or modify existing one) you can use the Map.put/3 function

    iex()> Map.put(bob, :salary, 5000)
    %{age: 25, name: "Bob", salary: 50000, works_at: "Initech"}

    in addition , a more general-purpose Dict module is provided.
    this module can be used to manipulate any abstract key-value structure such as HashDict

    for example , using Dict.put/3, you can also modify the map

    iex()> Dict.put(bob, :salary, 50000)
    %{age: 25, name: "Bob", salary: 50000, works_at: "Initech"}

    **using  dict has a benefit of shileding you from possible structural change.
    you can later to switch to some other key-value structure without changing the code that manipulates it

    variables can be used as map keys both when writing map literals as well as when matching

    iex()> n = 1
    1
    iex()> %{n => :one}
    %{1 => :one}
    iex()> %{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}
    %{1 => :one, 2 => :two, 3 => :three}


  """

  # ====================================================================================================================
  def general do
    # creating map
    bob = %{:name => "bob", :age => 24, :location => "msa"}
    %{name: "bob", age: 24, location: "msa"}

    # retrieve a field
    bob.age
    bob[:age]
    Map.get(bob, :age)
    # Map.fetch(bob,:age)

    # update or change a field
    %{bob | age: 100}

    # you can also update multiple values
    %{bob | age: 100, name: "ken", location: "klf"}

    # insert new key-value pairs
    Map.put(bob, :salary, 5000)

    n = 1
    %{n => :one}
    %{^n => :one} = %{1 => :one}
  end

  # ====================================================================================================================

  # delete(map,key)
  # deletes the entry in map for a specific key
  # if the key does not exist, returns map unchanged
  def deletemap(map) do
    Map.delete(map, 2)
    # Map.delete(%{a: 1, b: 2}, :a)
    # %{b: 2}
    # Map.delete(%{b: 2}, :a)
    # %{b: 2}
  end

  # ====================================================================================================================

  # drop(map,keys)
  # drops the given keys from map
  # if the key contains keys that are not in map, they are simply ignored
  def drop(map) do
    Map.drop(map, [:b])
  end

  # ====================================================================================================================

  # equal(map1,map2)
  # checks if two maps are equal
  # two maps are considered to be equal if they contain the same keys and those keys contain the same values
  # comparisons between keys and values is done with ===/3, which means integers are not equivalent to floats
  def equal(map1, map2) do
    Map.equal?(map1, map2)
    # Map.equal?(%{a: 1, b: 2}, %{b: 2, a: 1})
    # true
    # Map.equal?(%{a: 1, b: 2}, %{b: 1, a: 2})
    # false
  end

  # ====================================================================================================================

  # fetch(map,key)
  # fetches the value for a specific key in the given map
  # if map contains the given key, then its value is returned in the shape of {:ok, value}
  # if map doesnt contain key , :error is returned
  def fetch(map, key) do
    Map.fetch(map, key)
    # Map.fetch(%{a: 1}, :a)
    # {:ok, 1}
    # Map.fetch(%{a: 1}, :b)
    # :error
  end

  # ====================================================================================================================

  # fetch!(map,key)
  # fetches the value for a specific key in the given map , erroring out if map doesnt contain key
  # if map contains key, the corresponding value is returned. if map doesnt contain key, a KeyError exception is raised
  def fetch!(map, key) do
    Map.fetch!(map, key)
    # Map.fetch!(%{a: 1}, :a)
    # 1
  end

  # ====================================================================================================================

  # filter(map,fun)
  # returns a map containing only those pairs from map for which fun returns a truthy value
  # fun receives the key and value of each of the element in the map as key-value pairs
  # reject(map,fun) - discards all elements where the function returns a truthy value
  def filter(map) do
    Map.filter(map, fn {_key, val} -> rem(val, 2) == 1 end)

    # Map.filter(%{one: 1, two: 2, three: 3}, fn {_key, val} -> rem(val, 2) == 1 end)
    # %{one: 1, three: 3}
  end

  # ====================================================================================================================

  # reject(map,fun)
  # Returns map excluding the pairs from map for which fun returns a truthy value.
  def reject(map) do
    Map.filter(map, fn {_key, val} -> rem(val, 2) == 1 end)

    # Map.reject(%{one: 1, two: 2, three: 3}, fn {_key, val} -> rem(val, 2) == 1 end)
    # %{two: 2}
  end

  # ====================================================================================================================

  # from_keys(keys, value)
  # builds a map from the given keys and the fixed value
  def fromkeys(keys, value) do
    Map.from_keys(keys, value)

    # Map.from_keys([1, 2, 3], :number)
    # %{1 => :number, 2 => :number, 3 => :number}
  end

  # ====================================================================================================================

  # from_struct(struct)
  # converts a struct to map
  # it accepts the struct module or a struct itself and simply removes the __struct__ field from the given struct
  def fromstruct(struct) do
    Map.from_struct(struct)

    # defmodule User do
    #   defstruct [:name]
    # end

    # Map.from_struct(User)
    # #=> %{name: nil}

    # Map.from_struct(%User{name: "john"})
    # #=> %{name: "john"}
  end

  # ====================================================================================================================

  # get(map,key, default \\)
  # gets the value for a specific key in map
  # if key is present in map then its value is returned, otherwise , default is returned
  # if default is not provided, nil is used
  def get(map, key) do
    Map.get(map, key)

    # Map.get(%{}, :a)
    # nil
    # Map.get(%{a: 1}, :a)
    # 1
    # Map.get(%{a: 1}, :b)
    # nil
    # Map.get(%{a: 1}, :b, 3)
    # 3
    # Map.get(%{a: nil}, :a, 1)
    # nil
  end

  # ====================================================================================================================

  # get_and_update(map,key,fun)
  # gets the value from key and updates it, all in ine pass
  # fun is called with the current value under key in map(or nil if key is not present in map) and must return a two-element tuple
  # the current value(the retrieved value, which can be operated on before being returnd)
  # and the new value to be stored under key in the resulting map
  # fun may also return :pop, which means the current value shall be removed from map and returned (making this function behave like Map.pop(map, key)).
  def get_and_update(map, key) do
    Map.get_and_update(map, key, fn current_value -> {current_value, "newvalue"} end)

    # Map.get_and_update(%{a: 1}, :a, fn current_value ->
    #   {current_value, "new value!"}
    # end)
    # {1, %{a: "new value!"}}

    # Map.get_and_update(%{a: 1}, :b, fn current_value ->
    #   {current_value, "new value!"}
    # end)
    # {nil, %{a: 1, b: "new value!"}}

    # Map.get_and_update(%{a: 1}, :a, fn _ -> :pop end)
    # {1, %{}}

    # Map.get_and_update(%{a: 1}, :b, fn _ -> :pop end)
    # {nil, %{a: 1}}
  end


  # ====================================================================================================================
  # get_




end
