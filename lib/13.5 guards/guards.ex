defmodule Guards do
  @moduledoc """
    guards are extensions of the basic pattern matching mechanism.
    they allow you to state additional broader expectations that must be satisfied for the entire pattern to match

    a guard can be specified by providing the when clause after the arguments list

    def test(x) when x < 0 do
      :negative
    end

    the guars is a logical expression that places further conditions on a clause.

    def test(x) when is_number and x > 0 do
       :positive
    end

   multiclause lambda
   ===================

   test_num = fn
          x when is_number(x) and x < 0 ->
            :negative
          0 -> :zero
          x when is_number(x) and x > 0 ->
            :positive
    end


  """
end
