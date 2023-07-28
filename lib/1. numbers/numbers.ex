defmodule Mynumbes do
  import Integer

  def firstnum do
    a = 3
    b = 4
    c = 2
    d = a * b * c
    # returns the divisor
    e = div(d, 3)
    # returns the reminder
    f = rem(e, 5)
    # returns the absolute number representation
    g = abs(f)
    # returns the biggest of two given numbers
    h = max(g, 40)
    # returns the smallest of the two given items
    i = min(h, 2)
    # Rounds a number to the nearest integer.
    j = round(i)
    # checks if a number is even
    _k = is_even(j)
    # checks if a number is odd
    _l = is_odd(j)
    # Returns the ordered digits for the given integer.
    _m = digits(910)
    # Returns the extended greatest common divisor of the two given integers.
    _n = extended_gcd(240, 45)
    # Performs a floored integer division.
    _o = floor_div(-10, 3)
    # Returns the greatest common divisor of the two given integers.
    _q = gcd(2, 3)
    # Computes the modulo remainder of an integer division.
    _r = mod(5, 3)
    _s = String.to_integer("45")
    # Computes base raised to power of exponent.
    _t = pow(2, 1)

    # Returns a charlist which corresponds to the text representation of integer in the given base.
    _u = Integer.to_charlist(123)
    # Returns a binary which corresponds to the text representation of integer in the given base.
    _v = Integer.to_string(123)
    # Returns the integer represented by the ordered digits.
    _x = undigits([1, 2, 3])
    # returns booleans if input is integer
    _y = is_integer(23)
  end
end
