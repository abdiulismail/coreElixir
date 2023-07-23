defmodule Mymath do
  import Integer

  # Write a function to calculate the
  # sum,difference,product,reminder,abs,even,odd,prime,gdc,lcm,sqrt of two integers.
  def myop(a, b) do
    sum = a + b
    diff = a - b
    prod = a * b
    rem = rem(a, b)
    abs = abs(a)
    iseven = is_even(a)
    prime = mod(a, 2)
    gcd = gcd(a, b)
    sqra = a * a
    sqrb = b * b

    IO.puts("
    sum is #{sum} ,
    diff is #{diff} ,
    prod is #{prod},
    rem is #{rem},
    abs of #{a} is #{abs},
    is_even of #{a} is #{iseven},
    is_prime of #{a} is #{prime},
    gcd of #{a} and #{b} is #{gcd},
    sqrt of #{a} and #{b} is #{sqra} and #{sqrb}
    ")
  end

  # Write a function to reverse the digits of an integer.
  def myrev(a) when is_integer(a) do
    a
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  # Implement a function to count the number of digits in an integer.
  def mycount(a) when is_integer(a) do
    a
    |> Integer.to_string
    |> String.length
  end

  # find the factorial of a given number
  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def factorial(_) do
    "Factorial is only defined for non-negative integers."
  end

  # Write a function to check if an integer is a palindrome.
  

  # find fibonnaci of a given number
end
