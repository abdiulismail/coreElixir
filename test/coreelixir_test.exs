defmodule CoreelixirTest do
  use ExUnit.Case
  doctest Coreelixir

  test "greets the world" do
    assert Coreelixir.hello() == :world
  end
end
