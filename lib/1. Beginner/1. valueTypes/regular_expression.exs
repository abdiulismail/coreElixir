# iex(1)> Regex.run ~r{[aeiou]}, "caterpillar"
# ["a"]
# iex(2)> Regex.scan ~r{[aeiou]}, "caterpillar"
# [["a"], ["e"], ["i"], ["a"]]
# iex(3)> Regex.split ~r{[aeiou]}, "caterpillar"
# ["c", "t", "rp", "ll", "r"]
# iex(4)> Regex.replace ~r{[aeiou]}, "caterpillar" , "*"
# "c*t*rp*ll*r"
