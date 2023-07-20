defmodule Mynumbes do
import Integer
  def firstnum do
    a = 3
    b = 4
    c = 2
    d = a * b * c
    e = div(d,3) # returns the divisor
    f = rem(e,5) # returns the reminder
    g = abs(f)  # returns the absolute number representation
    h = max(g, 40) # returns the biggest of two given numbers
    i = min(h, 2) # returns the smallest of the two given items
    j = round(i) # Rounds a number to the nearest integer.
    _k = is_even(j)  # checks if a number is even
    _l = is_odd(j)  # checks if a number is odd
    _m = digits(910)  # Returns the ordered digits for the given integer.
    _n = extended_gcd(240,45) # Returns the extended greatest common divisor of the two given integers.
    _o = floor_div(-10,3) # Performs a floored integer division.
    _q = gcd(2,3) # Returns the greatest common divisor of the two given integers.
    _r = mod(5,3) # Computes the modulo remainder of an integer division.
    _s = String.to_integer("45")
    _t = pow(2,1) # Computes base raised to power of exponent.
    _u = Integer.to_charlist(123) # Returns a charlist which corresponds to the text representation of integer in the given base.
    _v = Integer.to_string(123) # Returns a binary which corresponds to the text representation of integer in the given base.
    _x = undigits([1,2,3]) # Returns the integer represented by the ordered digits.
    _y = is_integer(23) # returns booleans if input is integer


  end

end
