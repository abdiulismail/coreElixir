mylist = [1,2,4,4]
IO.puts delete(mylist, 4)

concat = [1,2,4,4] ++ [5,4,2,2]  # concatenation
IO.puts concat
IO.puts [1,2,4,4] -- [4]  # difference

IO.puts 1 in [1,2,4,4]  # membership

IO.puts "x" in [1,2,3,4,5]

# prepending new element to a list

new = 0
list = [1, 2, 3]
[new | list]

# functions of list

list = [1,2,3,4,5]
IO.puts hd(list)  # returns head of a list
IO.puts tl(list)  # returns tail of a list
IO.puts length(list) # returns length of a list
