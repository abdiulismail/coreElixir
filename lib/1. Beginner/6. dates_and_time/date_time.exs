import Calendar.ISO

d1 = Date.new(2018,12,25)

# iex> d1 = Date.new(2018, 12, 25)
# {:ok, ~D[2018-12-25]}

# iex> {:ok, d1} = Date.new(2018, 12, 25)
# {:ok, ~D[2018-12-25]}

# iex> d2 = ~D[2018-12-25]
# ~D[2018-12-25]

# iex> d1 == d2
# true  

# iex> Date.day_of_week(d1)
# 2

# iex> Date.add(d1, 7)
# ~D[2019-01-01]

# iex> inspect d1, structs: false
# "%{__struct__: Date, calendar: Calendar.ISO, day: 25, month: 12, year: 2018}"

# (The sequences ~D[...] and ~T[...] are examples of Elixir’s sigils.
# They are a way of constructing literal values.

# Elixir can also represent a range of dates:
d1 = ~D[2018-01-01] ~D[2018-01-01]
d2 = ~D[2018-06-30] ~D[2018-06-30]
first_half = Date.range(d1, d2)
#DateRange<~D[2018-01-01], ~D[2018-06-30]>
Enum.count(first_half)
# 181
~D[2018-03-15] in first_half
# true
