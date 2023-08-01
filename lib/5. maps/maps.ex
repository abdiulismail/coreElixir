defmodule MyMap do
  @moduledoc """
    a map is a key-value store, where keys and values can be any term
    maps are appropriate when you to combine a couple of fields into a single structure

    iex()> bob = %{:name => "bob", :age => 25, :works_at => "initech"}
    %{age: 25, name: "Bob", works_at: "Initech"}

    if keys are atoms, you can write this so its slightly shorter

    iex()> bob = %{name: "bob", age: 25, workat: "inftech"}
    %{age: 25, name: "Bob", works_at: "Initech"}

    to retrieve a field, you can use the access operator []
    iex()> bob[:age]
    25

    atom keys again receive special syntax treatment.The following snippet fetches a value stored under the :age key

    iex()> bob.age

    to change a field value, you can use the following syntax

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
    

  """







end
