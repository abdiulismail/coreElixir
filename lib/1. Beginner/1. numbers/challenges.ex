defmodule Mymath do
  import Integer

  # Write a function to calculate the
  # sum,difference,product,reminder,abs,even,odd,prime,gdc,lcm,sqrt of two integers.
  # ==========================================================================================
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

  # ==========================================================================================
  # Write a function to reverse the digits of an integer.
  def myrev(a) when is_integer(a) do
    a
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  # ==========================================================================================

  # Implement a function to count the number of digits in an integer.
  def mycount(a) when is_integer(a) do
    a
    |> Integer.to_string()
    |> String.length()
  end

  # ==========================================================================================

  # find the factorial of a given number
  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    n * factorial(n - 1)
  end

  def factorial(_) do
    "Factorial is only defined for non-negative integers."
  end

  # ==========================================================================================

  # Write a function to check if an integer is a palindrome.
  def reverse(a) when is_integer(a) do
    a
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end

  def checkapl(a) do
    a == reverse(a)
  end

  # ==========================================================================================

  # Create a function to find the prime factors of a given integer.
  # prime factors are the prime numbers that divide that integer exactly

  # defmodule PrimeFactors do
  #   def find_prime_factors(n) when is_integer(n) and n > 1 do
  #     find_prime_factors(n, 2, [])
  #   end

  #   defp find_prime_factors(1, _, factors) do
  #     factors
  #   end

  #   defp find_prime_factors(n, divisor, factors) do
  #     find_prime_factors(n, divisor + 1, factors)
  #   end

  #   defp find_prime_factors(n, divisor, factors) when rem(n, divisor) == 0 do
  #     find_prime_factors(n, divisor, [divisor | factors])
  #   end
  # end
  # ==========================================================================================

  # Write a function to check if an integer is a power of two , three and five.

  # ==========================================================================================
  # Write a function to find the square root of a positive integer (return the integer part).
  def findsqrt(n) when is_integer(n) do
    # this from th erlang library , that is how we import them
    :math.sqrt(n)
    |> round()
  end

  # ==========================================================================================
  # Implement a function to find the cube root of a positive integer (return the integer part).
  def cuberoot(n) when is_integer(n) do
  end
end
