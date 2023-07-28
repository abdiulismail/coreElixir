defmodule TupleChallenges do
  # 1 Write a function that takes two tuples representing 2D points (x, y coordinates)
  # and returns the distance between the two points.
  # The formula for distance between two points (x1, y1) and (x2, y2) is given by distance = sqrt((x2 - x1)^2 + (y2 - y1)^2).
  def quest1({x1, y1}, {x2, y2}) do
    distance = :math.sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))
    distance
  end

  # Write a function that takes a list of tuples,
  # where each tuple contains a person's name (string) and their age (integer).
  # The function should return the name of the oldest person in the list.
  def quest2(_mylsit) do
  end
end
