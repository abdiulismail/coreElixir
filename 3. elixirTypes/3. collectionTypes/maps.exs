
states = %{
  "AL" => "Alabama",
  "WI" => "Wisconsin"
 }


responses = %{
  { :error, :enoent } => :fatal,
  { :error, :busy } => :retry
}

IO.puts(responses[{:error,:enoent}])

colors = %{
  :red => 0xff0000,
  :green => 0x00ff00,
  :blue => 0x0000ff
}

# In the first case the keys are strings, in the second they’re tuples, and in the third they’re atoms.
# Although typically all the keys in a map are the same type, that isn’t required.

r = %{
  "one" => 1,
  :two => 2,
  {1,1,1} => 3
}

IO.puts(r["one"])

# you can also use expressions for the keys in map literals
 name = "abdi"

 goodname = %{
  String.downcase(name) => name
 }

IO.puts(goodname[name])

 # ACCESSING A MAP
 # ================
# you can extract values from a map using the key
# the square bracket syntax works with all maps

IO.puts(states["AL"])

# if they keys are atoms you can use dot notation
IO.puts(colors.blue)
