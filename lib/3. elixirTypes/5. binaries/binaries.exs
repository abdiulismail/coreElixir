# sometimes you need to access data as a sequence of bits and bytes.
# elixir supports this with the binary data type.
# binary literals are enclosed between << >>

bin1 = << 1,2 >>

bin2 = << 3:: size(2), 5 :: size(4) >>
