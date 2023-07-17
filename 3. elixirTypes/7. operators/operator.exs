# Comparison operators
# ======================
# a===b # strict equality (so 1 === 1.0 is false)
# a!==b # strict inequality (so 1 !== 1.0 is true)
# a==b # value equality (so 1 == 1.0 is true)
# a!=b # value inequality (so 1 != 1.0 is false)
# a>b # normal comparison
# a>=b # : a<b#: a<=b # :

# Boolean operators
# ======================
# (These operators expect true or false as their first argument.)
# a or b a and b not a
# # true if a is true; otherwise b
# # false if a is false; otherwise b
# # false if a is true; true otherwise

# Relaxed Boolean operators
# These operators take arguments of any type. Any value apart from nil or false is interpreted as true.
# a||b #aifaistruthy;otherwiseb
# a&&b #bifaistruthy;otherwisea
# !a # false if a is truthy; otherwise true


# Join operators
#     binary1 <> binary2 # concatenates two binaries (Later we'll
#     # see that binaries include strings.)
#     list1 ++ list2 # concatenates two lists

#     list1 -- list2 # removes elements of list 2 from a copy of list 1

# The in operator
# a in enum  # tests if a is included in enum (for example,
# # a list, a range, or a map). For maps, a should
# # be a {key, value} tuple.
