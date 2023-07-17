# elixir is lexically scoped
# the basic unit of scoping is the function body
# variables defined in a function ( including its parameters)
# are local to that function.
# modules define a scope for local variables, but these are accessible
# only at the top level of that module and not in functions defined in the module

# do block scope
# =================
line_no = 50

if line_no == 50 do
  IO.puts("new page")
  line_no = 0
end

IO.puts(line_no)

# the with expression
# if you need a couple of temporary variables when calculating something
# and you dont want  those variables to leak out into the  wider scope,use with
# it also gives you some control over pattern matching failures

content = "now is the time"
lp = with {:ok, file} = File.open("/etc/passwd"),
content = IO.read(file,:all),
:ok = File.close(file),
[_, uid, gid] = Regex.run(~r/^lp:.*?:(\d+):(\d+)/m, content)
do
  "Group: #{gid}, User: #{uid}"
end

IO.puts lp #=> Group: 26, User: 26
IO.puts content  #=> Now is the time
