defmodule Structs do
  @moduledoc """
    structs are extensions built on top of maps that provide compile-time checks and default values

    defining structs
    ===============
    to define a struct, the defstruct construct is used

          iex()> defmodule User do
                    defstruct name: "john", age: 27
                end

    the keyword list used with destruct defines what fields the struct will have along with their default values

    struct take the name of the module they are defined

            iex()> %User{}
            %User{age: 27, name: "john"}

            iex()> %User{name: "john"}
            %User{age: 27, name: "jane"}

    accessing and updating structs
    ===============================
          iex()> john = %user{}
          %User{age: 27, name: "john"}

          iex()> john.name
          "john"

          iex()> jane = %{john | name: "jane"}
          %User{age: 27, name: "jane"}

          



  """
end
