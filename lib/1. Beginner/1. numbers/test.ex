defmodule Mysqr do
  def findsqrt(n) when is_integer(n) do
    :math.sqrt(n)
    |> round()
  end
end
