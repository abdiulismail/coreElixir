searchData={"items":[{"type":"module","title":"Geometry","doc":"a function must always be a part of a module.\n  function name start with a lowercase letter.\n  as with variables , function name can end with the characters ? and !\n  the character ? is often used to indicate a function that returns either true or false.\n  placing ! at the end of the name indicates a function that may raise a runtime error\n\n  functions can be defined using the def construct.\n  the defnition start with def construct, followed by function name, the args list and body enclosed in do..end block.\n\n  the defmodule and def are not keywords but compilation constructs called macros.\n\n  if a function has no arguments , you can omit parenthesis\n\n  the return value of an function  is the value of its last expression.\n  there is no explicit return value in elixir\n  ofcourse you can always store the function result to a variable\n\n  iex(2)> area = Geometry.rectangle_area(3, 2)\n\n  parenthesis are optional in elixir and you can omit them\n\n  iex(4)> Geometry.rectangle_area 3, 2\n\n  Personally, I find that omitting parentheses makes the code ambiguous, so my advice is to always include them when calling a function\n\n  if a function resides in the same module , you can omit the module prefix\n\n  given that elxir is a functional langauge, you often need to combine functions, passing the result\n  of one function as the argument to the next one.\n  elixir comes with a built in operator |> called the pipeline operator\n\n  -5\n  |> abs\n  |> Integer.to_string\n  |> IO.puts\n\n\n  function arity\n  ===============\n  arity is a fancy name for the number of arguments a function recives.\n  a function is uniquely identified by its containing module, its name and its arity.\n  a function with arity of one /1 means it receives only one argument\n  a function with arity of two /2 means it receives two arguments and so on\n\n  two functions with the same name , but different arities are two different functions.\n  Rectangle.area/1\n  Rectangle.area/2\n\n  the name might be overloaded but the arities are different.\n\n  it usually makes no sense for different function with the same name to have completly different implementations.\n  more commonly, a lower-arity function delegates to a higher-arity function, providing default arguments.\n\n      defmodule calculator do\n        def sum(a) do\n          sum(a,0)\n        end\n\n        def sum(a,b) do\n          a + b\n        end\n      end\n\n  again a lower-arity function is implemented in terms of higher-arity one.\n  the pattern is so frequent that elixir allows  you to specify defualts for arguments using the \\ operator followed by default value\n\n      defmodule calculator do\n            def sum(a,b \\ 1, c, d \\ 2) do\n              a + b\n            end\n        end\n\n  function visibility\n  ===================\n  when you define a function using the def macro, the function is made public, it can be called by anyone else.\n  in elixir terminology its said the function is exported.\n\n  you can use the defp macro to make the function private.\n  a private function can be used only inside the module its defined in\n\n  imports and aliases\n  ==================\n  calling functions from another module can sometimes be cumbersome\n  because you need to reference the module name.\n  if your module often calls functions from another module, you can import that other module into your own\n  importing a module allows you to call its public functions without prefixing them with the module name\n\n        defmodule MyModule do\n          import IO\n\n          def myfunction do\n            puts \"calling imported function\"\n          end\n        end\n\n  Of course, you can import multiple modules. In fact, the standard library’s Kernel module is automatically imported into every module.\n  This is because Kernel contains functions that are often used, so automatic importing makes their usage easier.1.\n\n  an alternative to import is alias , a construct that makes it possible to reference a module under a different name\n\n        defmodule MyModule do\n          alias IO, as: MyIO\n\n          def myfunction do\n            MyIO.puts(\"calling imported alias function\")\n          end\n        end\n\nalias can be useful if a module has a long name.\n\nPersonally, I tend to avoid aliases, because they increase ambiguity.\nBut in some cases they can improve readability, especially if you call functions from a long-named module many times.\n\nmodule attributes\n==================\nmodules attributes are of two types\n1. those used as compile time constants\n\n        defmodule Circle do\n          @pi 3.14\n\n          def area(r) do\n            r * r * pi\n          end\n        end\n    the @pi constant exist only during compilation of the module\n\n2. those registered for runtime\n\n   an attribute can also be registered, which means that it will be stored in the generated binary\n   and can be accessed in runtime.\n\n   elixir registers some attributes by default eg @moduledoc and @doc to provide documentation for modules and functions\n\n\nType specification\n====================\ntypespec specification often called typespecs are another important feature based on attributes.\nthis feature allows you to provide type information for your functions which can be later analyzed with a static analysis tool called dialyzer\n\n        @spec rectangle_area(number,number) :: number\n        def rectangle_area(a,b) do\n          sum(a,b) * 3\n        end\n\nhere you see the @spec attribute to indicate that both functions accept and return a number\n\ntypespec provides a way of compensating for the lack of a static type system.\ntypespec allows you to document your code better","ref":"Geometry.html"},{"type":"function","title":"Geometry.rectangle_area/2","doc":"","ref":"Geometry.html#rectangle_area/2"},{"type":"function","title":"Geometry.square_area/1","doc":"","ref":"Geometry.html#square_area/1"},{"type":"module","title":"Introduction","doc":"Elixir is built on top of erlang.\nfault-tolerant - system has to keep working even when unforseen bugs happen,\nhigh availability - enables distribution over multiple hardware\nscalability - handle any possible load\nResponsiveness - lengthy task shouldnt block rest of the system\nlive update - realtime system version update without restarting servers\n\nErlang concurrency\n=================\nErlang virtual machine called BEAM , uses its own schedulers to distribute the\nexecution of processes over available CPU cores thus parallelizing execution as much as possible\n\nErlang processes are completly isolated from each other, they share no memory and a crash\nof one process doesnt cause a crash of other process.This helps you isolate effect of an unexpected error\n\nSharing no memory , process communicate via asynchronous message.This meaans there are no complex synchronization mechanisms such as locks , mutex or semaphores\n\nTypical erlang system are divided into a large number of concurrent process which cooperate together to provide complete service.\n\nsince process share no memory , each process collects its garbage individually.\nsuch collection are much shorter and dont block the entire system for long periods of time\n\nElixir\n=========\nElxir runs ontop of erlang BEAM and allows you to run cleaner, more compact code\nElixir targets the erlang runtime. The result of compiling the elixir source code are BEAM compliant bytec code\nfiles that can run in a beam instance and can normally cooperate with pure erlang code\nyou can use erlang libraries for elixir and vice versa.\nElixir is semantically close to Erlang: many of its language constructs map directly to the Erlang counterparts.\nBut Elixir provides some additional constructs that make it possible to radically reduce boilerplate and duplication.\nIn addition, it tidies up some important parts of the standard libraries and provides some nice syntactic sugar and a uniform tool for creating and packaging systems\n\n\ninteractive shell\n==================\nrunning iex starts an instance of the BEAM and then starts an interactive elixir shell inside it.\n\niex(1)> 1 + 2\n3\n\neverything in elixir is an expression that has a return value\n\nYou can type practically anything that constitutes valid Elixir code, including more complicated multiline expressions:","ref":"Introduction.html"},{"type":"module","title":"ListChallenges","doc":"","ref":"ListChallenges.html"},{"type":"function","title":"ListChallenges.checkempty/1","doc":"","ref":"ListChallenges.html#checkempty/1"},{"type":"function","title":"ListChallenges.checklength/1","doc":"","ref":"ListChallenges.html#checklength/1"},{"type":"function","title":"ListChallenges.reverse/2","doc":"","ref":"ListChallenges.html#reverse/2"},{"type":"module","title":"MyList","doc":"lists in erlang are  used to manage dynamic, variable-sized collection of data.\n\n      iex> prime_numbers = [1,2,3,5,7]\n      [1,2,3,5,7]\n\n\n  to do something with a list , you have to traverse it.\n  therefore most of the operation on list have an 0(n) complexity,\n  including the Kernel.length/1 function which iterates through the entire list to calculate its length\n\n        iex> length(prime_numbers)\n\n  to get an element from a list , you can use the Enum.at/2 function.\n  Enum.at is again an 0(n) operation, it iterates from the beginning of the list to the desired element.\n  lists are never a good fit when direct access is called for. for those purpose , either tuples, maps or\n  higher level data structure is appropriate\n\n  check for element?\n  ===================\n  you can check whether a list contains a particular element with the help of the in operator\n\n       5 in prime_numbers\n\n  replace an element\n  ====================\n  to maniplulate a list, you can use functions from the List module. For example,\n  List.replace_at/3 modifies the element at a certain position\n        prime_numbers = [1, 2, 3, 5, 7]\n        List.replace_at(prime_numbers,2,4)\n  like with tuples, the modifier doesnt mutate the data but returns the modified version of it, which you need to store in another variable\n  or you can rebound to the same variable\n\n  insert a new elment\n  ====================\n  you can insert a new element at the specified position with the List.insert_at function\n\n            prime_numbers = [1, 2, 3, 5, 7]\n            List.insert_at(prime_numbers,3,4)\n\n  to append to the end , you can use a negative value for the insertion position\n            prime_numbers = [1, 2, 3, 5, 7]\n            List.insert_at(prime_numbers,-1,4)\n\n  like most list operation, modifying  a random element has a complexity of 0(n).\n  in particular appending at the end of the list is expensive as it takes n steps, n being the length of the list\n\n  concatenate two list\n  ========================\n  you can join two list together using ++ operator\n  [1,2,3,4] + [5,6,7]\n\n  again the complexity is 0(n) since its adding at the end of list to another.\n  you should avoid adding elements to the end of a list.\n  list are most efficient when new elements are pushed to the top, or popped from it\n\n  recursive list\n  ===============\n  an alternative way to look at list is to think of them as recursive structures\n  a list can be represented by a pair(head,tail) , where head is the first element of the list\n  and tail points to the (head,tail) pair of the remaining elements.\n  in elixir there is a special syntax to support recursive list defnition\n\n  a_list = [head | tail]\n\n  head can be any data type, where tail is itself a list.if tail is empty, it indicates the end of the entire list.\n\n          iex(1)> [1 | [2 | [3 | [4 | []]]]]\n\n  to get to the head of the list, you can use hd function. the tail can be obtained by calling the tl function\n\n          iex(1)> hd([1, 2, 3, 4])\n          1\n\n          iex(2)> tl([1, 2, 3, 4])\n          [2, 3, 4]\n\n  both operations are 0(1), because they amount to reading one or the other value from (head,tail) pair\n\n  Knowing the recursive nature of the list, it’s simple and efficient to push a new element to the top of the list:\n            iex(1)> a_list = [5, :value, true]\n            [5, :value, true]\n\n            iex(2)> new_list = [:new_element | a_list]\n            [:new_element, 5, :value, true]\n\n\n  so many functions to work with in lists are found in Enum module","ref":"MyList.html"},{"type":"function","title":"MyList.check/0","doc":"","ref":"MyList.html#check/0"},{"type":"function","title":"MyList.conc/0","doc":"","ref":"MyList.html#conc/0"},{"type":"function","title":"MyList.dele/1","doc":"","ref":"MyList.html#dele/1"},{"type":"function","title":"MyList.deleat/1","doc":"","ref":"MyList.html#deleat/1"},{"type":"function","title":"MyList.dupli/1","doc":"","ref":"MyList.html#dupli/1"},{"type":"function","title":"MyList.first/1","doc":"","ref":"MyList.html#first/1"},{"type":"function","title":"MyList.flaten2/2","doc":"","ref":"MyList.html#flaten2/2"},{"type":"function","title":"MyList.flaten/1","doc":"","ref":"MyList.html#flaten/1"},{"type":"function","title":"MyList.getele/0","doc":"","ref":"MyList.html#getele/0"},{"type":"function","title":"MyList.impropa/1","doc":"","ref":"MyList.html#impropa/1"},{"type":"function","title":"MyList.inser/0","doc":"","ref":"MyList.html#inser/0"},{"type":"function","title":"MyList.insert/0","doc":"","ref":"MyList.html#insert/0"},{"type":"function","title":"MyList.keyd/3","doc":"","ref":"MyList.html#keyd/3"},{"type":"function","title":"MyList.keyfnd/3","doc":"","ref":"MyList.html#keyfnd/3"},{"type":"function","title":"MyList.keyfnd!/3","doc":"","ref":"MyList.html#keyfnd!/3"},{"type":"function","title":"MyList.keymembr/3","doc":"","ref":"MyList.html#keymembr/3"},{"type":"function","title":"MyList.keyreplace/4","doc":"","ref":"MyList.html#keyreplace/4"},{"type":"function","title":"MyList.mylist/0","doc":"","ref":"MyList.html#mylist/0"},{"type":"function","title":"MyList.reple/0","doc":"","ref":"MyList.html#reple/0"},{"type":"function","title":"MyList.transfrm/1","doc":"","ref":"MyList.html#transfrm/1"},{"type":"function","title":"MyList.traverse/1","doc":"","ref":"MyList.html#traverse/1"},{"type":"module","title":"MyModules","doc":"a module is a collection of functions.\n every elixir function must be defined inside a module\n\n elixir comes with a standard library that provides many useful modules such IO module\n can be used to do various I/O operations. The function puts from the IO module can be used to print a message to the screen\n\n to call a function of a module , you use the syntax\n modulename.function_name(args)\n\n to define your own module , you use defmodule construct.\n inside defmodule , you define functions using def construct\n\n a single source file may contain multiple modules\n\n      defmodule Module1 do\n          ...\n      end\n\n      defmodule Module2 do\n      ...\n      end\n\na module name must start with a capital lette and is usually written in camel case\na module name can consist of alphanumerics, underscores and dot character\n\n    defmodule Geometry.Rectangle do\n    ...\n    end\n\nyou can also nest modules inside another module\n\n      defmodule Geometry do\n          defmodule Rectangle do\n    ...   end\n    ..end","ref":"MyModules.html"},{"type":"function","title":"MyModules.rectangle_area/2","doc":"","ref":"MyModules.html#rectangle_area/2"},{"type":"module","title":"MyTuple","doc":"tuples are records that are used to group small number of fixed elements\ntuples are denoted using curly braces\ntuples may contain elements of different type\n\niex(1)> person = {\"Bob\", 25}\n{\"Bob\", 25}\n\nextract from a tuple\n=====================\nto extract an element from a tuple , you can use the kernel.elem/2 function , which accepts a tuple and zero based index of the element.\nrecall Kernel module is auto-imported , so you can call elem instead of kernel.elem\n\niex(2)> age = elem(persion, 1)\n25\n\nmodify a tuple\n=============\nto modify the element of the tuple, you can use the kernel.put_elem/3 function, which accepts a tuple,\na zero-based inde and the new value of the field in the given position\n\niex(3)> put_elem(person, 1, 26)\n{\"Bob\", 26}\n\nthe function put_elem doesnt modify the tuple. it returns the new version, keeping the old one intact.\nrecall that data in elixir is immutable, and you cant do an im-memory modification of a value.\n\nso , how can you use the put_elem function ?\nyou need to store its result to another variable\n\n iex(5)> older_person = put_elem(person, 1, 26)\n {\"Bob\", 26}\n\nRecall that variables can be rebound, so you can also do the following:\n\niex(7)> person = put_elem(person, 1, 26)\n{\"Bob\", 26}\n\nBy doing this, you have effectively rebound the person variable to the new memory location.\nThe old location isn’t referenced by any other variable, so it’s eligible for garbage collection.\n\nyou can check the number of elements in a list using:application:\n\ntuple_size(name_of_tuple)\n\niex(6)> tuple_size(old_person)\n2\n\ntuples are most appropriate to group a small, fixed number of elements together.\nwhen you need a dynamically sized collection, you can use lists\n\ntuples are good for reading data while lists are better for traversals.\ntuples are typically used either when a function has multiple return values or for error handling\n\nFile.read/1\n\nreturns {:ok, content} if reading the given file is successful or {:error,reason} when not successful","ref":"MyTuple.html"},{"type":"function","title":"MyTuple.mytuple/0","doc":"","ref":"MyTuple.html#mytuple/0"},{"type":"module","title":"Myatoms","doc":"Atoms are  named constants.\n the value of an atom is its own name\n\n Atoms constants start with a colon character, followed by a combination of alphanumeric\n and underscore characters\n\n :an_atom\n :another_atom\n\n its possible to use spaces in the atom name with the following syntax\n\n :\"an atom with spaces\"\n\n an atom consist of two parts, the text and the value\n the atom text is whatever you put after the colon character\n at runtime, this text is kept in the atom table.\n the value is the data that goes into the variable, and is merely a reference the atom table\n\n this is why atoms are the best used for named constants, they are efficient both in memory and performance-wise\n when you say,\n\n variable = :some_atom\n\n the variable doesnt contain the entire text, but only a reference to the atom table\n therefore memory consumption is low, the comparisons are fast and the code is still readable.\n\n atoms are not garbage collected, which makes them lightweight and efficienct for use as keys, flags and other constants\n\n\n  ALIASES\n  ==========\n  There is another syntax for atom constants. You can omit the beginning colon, and start with uppercase:\n\n  AnAtom\n\n  This is called an alias, and at compile time it’s transformed into :\"Elixir.AnAtom\":\n\n  iex(1)> AnAtom == :\"Elixir.AnAtom\"\n  true\n\n  When you use an alias, the compiler implicitly adds the Elixir. prefix to its text and inserts an atom there.\n  But if an alias already contains that prefix, it’s not added. Conequently, the following also works:\n\n  iex(2)> AnAtom == Elixir.AnAtom\n  true\n\n\n  Atoms as Booleans\n  ==================\n  Elixir doesnt have a dedicated boolean type\n  instead the atoms\n\n  :true\n  :false\n\n  the term boolean is still used in elixir to denote an atom that has a value of either :true or :false\n\n  the standard logical operators work with boolean atoms\n\n\n    iex(1)> true and false\n    false\n    iex(2)> false or true\n    true\n    iex(3)> not false\n    true\n\n  always keep in mind that a boolean is just an atom that has a value of true or false\n\n  Nil and Truthy values\n  =======================\n  Another special atom is\n\n  :nil\n\n  which works similar to null from other languages\n\n  the atom nil plays a role in elixir support for truthness.\n  thr atoms nil and false are treated as falsy values and everything else treated as truthy values\n\n  This property can be used with Elixir’s short-circuit operators ||, && and !.\n  The operator || returns the first expression that isn’t falsy:\n\n  iex(1)> nil || false || 5 || true\n  5\n\n  Because both nil, and false are falsy expressions, the number 5 is returned.\n  Notice that subsequent expressions won’t be evaluated at all.\n  If all expressions evaluate to a falsy value, then the result of the last expression is returned.\n\n  The operator && returns the second expression, but only if the first expression is truthy.\n  Otherwise, it returns the first expression without evaluating the second one:\n\n  iex(1)> true && 5\n  5\n\n  iex(2)> false && 5\n  false\n\n  iex(3)> nil && 5\n  nil\n\n  Short-circuiting can be used for elegant operation chaining.\n  For example, if you need to fetch a value from cache, a local disk, or a remote database, you can do something like this:\n\n  read_cached || read_from_disk || read_from_database\n\n  Similarly, you can use the operator && to ensure that certain conditions are met:\n\n  database_value = connection_established? && read_data\n\n  In both examples, short-circuit operators make it possible to write concise code with- out resorting to complicated nested conditional constructs.\n\n  atoms are not meant to hold large amounts of data.\n  if you need to work with large textual data, consider using strings instead","ref":"Myatoms.html"},{"type":"function","title":"Myatoms.atomtest/0","doc":"","ref":"Myatoms.html#atomtest/0"},{"type":"function","title":"Myatoms.convertocharlist/1","doc":"","ref":"Myatoms.html#convertocharlist/1"},{"type":"function","title":"Myatoms.convertostring/1","doc":"","ref":"Myatoms.html#convertostring/1"},{"type":"module","title":"Mymath","doc":"","ref":"Mymath.html"},{"type":"function","title":"Mymath.checkapl/1","doc":"","ref":"Mymath.html#checkapl/1"},{"type":"function","title":"Mymath.factorial/1","doc":"","ref":"Mymath.html#factorial/1"},{"type":"function","title":"Mymath.findsqrt/1","doc":"","ref":"Mymath.html#findsqrt/1"},{"type":"function","title":"Mymath.mycount/1","doc":"","ref":"Mymath.html#mycount/1"},{"type":"function","title":"Mymath.myop/2","doc":"","ref":"Mymath.html#myop/2"},{"type":"function","title":"Mymath.myrev/1","doc":"","ref":"Mymath.html#myrev/1"},{"type":"function","title":"Mymath.reverse/1","doc":"","ref":"Mymath.html#reverse/1"},{"type":"module","title":"Mymath.MathUtils","doc":"","ref":"Mymath.MathUtils.html"},{"type":"function","title":"Mymath.MathUtils.sum_even_integers/1","doc":"","ref":"Mymath.MathUtils.html#sum_even_integers/1"},{"type":"module","title":"Mynumbes","doc":"","ref":"Mynumbes.html"},{"type":"function","title":"Mynumbes.firstnum/0","doc":"","ref":"Mynumbes.html#firstnum/0"},{"type":"module","title":"Myvariable","doc":"elixir is a dynamic programming language, which means you dont explictly declare a variable or its type\n instead , the variable type is determined by whatever data it contains\n in elixir, assignment is called binding.\n when you initialize a variable with a value, the variable is bound to that value\n\n each expression in elixir has a result.\n in elixir a variable always starts with a lowercase alpabet character or an underscore\n\n As added syntactic sugar, variable names can end with the characters ? and !:\n valid_name?\n also_ok!\n\n data in elixir is immutable, its content cant be changed.\n but variables can be rebound to different value\n\n monthly_salary = 1000\n monthly_salary = 3000\n\n rebinding doesnt mutate the existing memory location, it reserves new memory and reassigns the symbolic name to the new location\n\n You should always be aware of the fact that data is immutable.\n Once a memory location is occupied with data, it can’t be modified until it’s released.\n But variables can be rebound, which makes them point to a differ- ent memory location.\n Thus variables are mutable, whereas the data they point to is immutable.\n\n elxir is a garbage-collectable langauge, which means you dont have to manually release memory.\n when a variable goes out of scope, the corresponding memory is eligible for garbage collection.","ref":"Myvariable.html"},{"type":"function","title":"Myvariable.nextfoldertest/0","doc":"","ref":"Myvariable.html#nextfoldertest/0"},{"type":"function","title":"Myvariable.salario/0","doc":"","ref":"Myvariable.html#salario/0"},{"type":"module","title":"TupleChallenges","doc":"","ref":"TupleChallenges.html"},{"type":"function","title":"TupleChallenges.quest1/2","doc":"","ref":"TupleChallenges.html#quest1/2"},{"type":"function","title":"TupleChallenges.quest2/1","doc":"","ref":"TupleChallenges.html#quest2/1"}],"content_type":"text/markdown"}