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
  # get_and_update!(map,key,fun) do
  # gets the value from key and updates it, all in one pass. Raises KeyError exception if key is not present in map
  def get_and_update!(map, key) do
    Map.get_and_update(map, key, fn current_value -> {current_value, "newvalue"} end)

    # Map.get_and_update!(%{a: 1}, :a, fn current_value ->
    #   {current_value, "new value!"}
    # end)
    # {1, %{a: "new value!"}}

    # Map.get_and_update!(%{a: 1}, :b, fn current_value ->
    #   {current_value, "new value!"}
    # end)
    # ** (KeyError) key :b not found in: %{a: 1}

    # Map.get_and_update!(%{a: 1}, :a, fn _ ->
    #   :pop
    # end)
    # {1, %{}}
  end

  # ====================================================================================================================

  # get_lazy(map,key,fun)
  # gets the value for a specific key in map
  # if key is present in map then its value is returned, otherwise, fun is evaluated and its result is returned
  # def get_lazy(map,key) do
  #   somefun = &(&2+&2)
  #   Map.get_lazy(map,key,somefun)
  # end

  # ====================================================================================================================
  # has_key?(map,key)
  # returns whether the given key exists in the given map
  def has_key(map, key) do
    Map.has_key?(map, key)

    # Map.has_key?(%{a: 1}, :a)
    # true
    # Map.has_key?(%{a: 1}, :b)
    # false
  end

  # ====================================================================================================================

  # intersect(map1,map2)
  # intersects two maps, returning a map with the common keys
  # the values in the returned map are the values of the intersected keys in map2
  def intersect(map1, map2) do
    Map.intersect(map1, map2)
    # iex(7)> Map.intersect(%{a: 1, b: 2}, %{b: "b", c: "c"})
    # %{b: "b"}
  end

  # ====================================================================================================================

  # intersect(map1,map2,fun)
  # intersect two maps, returning a map with the common keys and resolving conflicts through a function
  def intersect2(map1,map2) do
    Map.intersect(map1,map2, fn _k,v1,v2 -> v1 + v2 end)
  end

  # ====================================================================================================================
  # keys(map)
  # returns all keys from map
  def keys(map) do
    Map.keys(map)
    # Map.keys(%{a: 1, b: 2})
    # [:a, :b]
  end

  # merge(map1,map2)
  # merges two maps into one
  # all keys in map2 will be added to map1 , overriding any existing one(ie the keys in map2 have precedence over the ones in mpa1)
  def merge(map1, map2) do
    Map.merge(map1, map2)

    # Map.merge(%{a: 1, b: 2}, %{a: 3, d: 4})
    # %{a: 3, b: 2, d: 4}
  end

  # merge(map1, map2, fun)
  # merges two maps into one, resolving conflicts through the given fun
  # all keys in map2 will be added in map1. the given function will be invoked when there are duplicate keys
  # its arguments are key(the duplicate key), value1(the value of key in map1) and value2(the value of key in map2)
  # the value returned by fun is used as the value under key in the resulting map
  def merge2(map1, map2) do
    Map.merge(map1, map2, fn _k, v1, v2 -> v1 + v2 end)
  end

  # new()
  # returns a new empty map
  def new do
    Map.new()

    # Map.new()
    # %{}
  end

  # new(enumerable)
  # creates a map from an enumerable
  # duplicate keys are removed, the latest one prevails
  def new2 do
    Map.new()

    # Map.new([{:b, 1}, {:a, 2}])
    # %{a: 2, b: 1}
    # Map.new(a: 1, a: 2, a: 3)
    # %{a: 3}
  end

  # new(enumerable, transform)
  # creates a map from an enumerable via the given transformation function
  # duplicate keys are removed, the last one prevails
  def new3 do
    Map.new()

    # Map.new([:a, :b], fn x -> {x, x} end)
    # %{a: :a, b: :b}

    # Map.new(%{a: 2, b: 3, c: 4}, fn {key, val} -> {key, val * 2} end)
    # %{a: 4, b: 6, c: 8}
  end


  # pop(map,key,default \\ nil)
  # removes the value associated with key in map and returns the value and the updated map
  # if key id present in map, it returns {value, update_map} where value is the value of the key and updated_map is the result of removing key from the map.
  # if key is not present in map, {default,map} is returned
  def pop(map,key) do
    Map.pop(map,key)

    # Map.pop(%{a: 1}, :a)
    # {1, %{}}
    # Map.pop(%{a: 1}, :b)
    # {nil, %{a: 1}}
    # Map.pop(%{a: 1}, :b, 3)
    # {3, %{a: 1}}
  end


  # pop!(map,key)
  # removes the value associated with key in map and returns the value and the updated map, or it raises keyError if key is not present
  def pop2(map,key) do
    Map.pop!(map,key)

    # Map.pop!(%{a: 1}, :a)
    # {1, %{}}
    # Map.pop!(%{a: 1, b: 2}, :a)
    # {1, %{b: 2}}
    # Map.pop!(%{a: 1}, :b)
    # ** (KeyError) key :b not found in: %{a: 1}
  end


  # pop_lazy(map,key,fun)
  # lazily returns and removes the value associated with key in map
  # if key is present in map, it returns {value, new_map} where value is the value of the key and new_map is the result of removing key from map.
  # if key is not present in map, {fun_Result, map} is returned, where fun_result is the result of applying fun
  # this is useful if the default value is very expensive to calculate or generally difficult to setup and teardown again
  def pop_lazy(map,key) do
    Map.pop_lazy(map,key, fn  -> 13 end)

    # map = %{a: 1}
    # fun = fn ->
    #   # some expensive operation here
    #   13
    # end
    # Map.pop_lazy(map, :a, fun)
    # {1, %{}}
    # Map.pop_lazy(map, :b, fun)
    # {13, %{a: 1}}

  end


  # put(map,key,value)
  # puts the given value under key in map
  def put(map,key,value) do
    Map.put(map,key,value)

    # Map.put(%{a: 1}, :b, 2)
    # %{a: 1, b: 2}
    # Map.put(%{a: 1, b: 2}, :a, 3)
    # %{a: 3, b: 2}
  end

  # put_new(map,key,value)
  # puts the given value under key unless the entry key already exist in map
  def put_new(map,key,value) do
    Map.put(map,key,value)

    # Map.put_new(%{a: 1}, :b, 2)
    # %{a: 1, b: 2}
    # Map.put_new(%{a: 1, b: 2}, :a, 3)
    # %{a: 1, b: 2}
  end

  # put_new_lazy(map,key,fun)
  # evaluates fun and puts the result under key in map unless key is already present
  # this function is useful in case you want to compute the value to put under key only if key is not already present,
  # for example, when the value is expensive to calculate or generally difficult to setup and teardown again
  def put_new_lazy(map,key) do
    Map.put_new_lazy(map,key,fn  -> 3 end)

    # map = %{a: 1}
    # fun = fn ->
    #   # some expensive operation here
    #   3
    # end
    # Map.put_new_lazy(map, :a, fun)
    # %{a: 1}
    # Map.put_new_lazy(map, :b, fun)
    # %{a: 1, b: 3}
  end

  # reject(map,fun)
  # returns map excluding the pairs from map for which fun returns a truthy value
  def reject2(map) do
    Map.reject(map,fn {_key, val} -> rem(val,2) == 1  end)

    # Map.reject(%{one: 1, two: 2, three: 3}, fn {_key, val} -> rem(val, 2) == 1 end)
    # %{two: 2}
  end

  # replace(map, key, value)
  # puts a value under key only if the key already exist in map
  def replace(map,key,value) do
    Map.replace(map,key,value)

    # Map.replace(%{a: 1, b: 2}, :a, 3)
    # %{a: 3, b: 2}

    # Map.replace(%{a: 1}, :b, 2)
    # %{a: 1}
  end


  # replace!(map,key,value)
  # put a value under key only if the key alredy exist in map
  # if key is not present in map, a KeyError exception is raised
  def replace2(map,key,value) do
    Map.replace!(map,key,value)

    # Map.replace!(%{a: 1, b: 2}, :a, 3)
    # %{a: 3, b: 2}

    # Map.replace!(%{a: 1}, :b, 2)
    # ** (KeyError) key :b not found in: %{a: 1}
  end


  # replace_lazy(map,key,fun)
  # replaces the value under key using the given key function only if key already exist in map
  # in comparison to replace/3 , this can be useful when its expensive to calculate the value
  # if key does not exist, the original map is returned unchanged
  def replace_lazy(map,key) do
    Map.replace_lazy(map,key,fn v -> v * 4 end)

    # Map.replace_lazy(%{a: 1, b: 2}, :a, fn v -> v * 4 end)
    # %{a: 4, b: 2}

    # Map.replace_lazy(%{a: 1, b: 2}, :c, fn v -> v * 4 end)
    # %{a: 1, b: 2}
  end

  


end
