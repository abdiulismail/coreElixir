# write a code that checks if a number ie even or odd

defmodule Mymath do
  import Integer

  def check_is_even(number) do
    is_even(number)
  end

  # 1 find the factorial of a given number
  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def factorial(_) do
    "Factorial is only defined for non-negative integers."
  end

  # 2 find fibonnaci of a given number
end
