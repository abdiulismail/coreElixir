defmodule Introduction do
  @moduledoc """
  Elixir is built on top of erlang.
  fault-tolerant - system has to keep working even when unforseen bugs happen,
  high availability - enables distribution over multiple hardware
  scalability - handle any possible load
  Responsiveness - lengthy task shouldnt block rest of the system
  live update - realtime system version update without restarting servers

  Erlang concurrency
  =================
  Erlang virtual machine called BEAM , uses its own schedulers to distribute the
  execution of processes over available CPU cores thus parallelizing execution as much as possible

  Erlang processes are completly isolated from each other, they share no memory and a crash
  of one process doesnt cause a crash of other process.This helps you isolate effect of an unexpected error

  Sharing no memory , process communicate via asynchronous message.This meaans there are no complex synchronization mechanisms such as locks , mutex or semaphores

  Typical erlang system are divided into a large number of concurrent process which cooperate together to provide complete service.

  since process share no memory , each process collects its garbage individually.
  such collection are much shorter and dont block the entire system for long periods of time

  Elixir
  =========
  Elxir runs ontop of erlang BEAM and allows you to run cleaner, more compact code
  Elixir targets the erlang runtime. The result of compiling the elixir source code are BEAM compliant bytec code
  files that can run in a beam instance and can normally cooperate with pure erlang code
  you can use erlang libraries for elixir and vice versa.
  Elixir is semantically close to Erlang: many of its language constructs map directly to the Erlang counterparts.
  But Elixir provides some additional constructs that make it possible to radically reduce boilerplate and duplication.
  In addition, it tidies up some important parts of the standard libraries and provides some nice syntactic sugar and a uniform tool for creating and packaging systems


  interactive shell
  ==================
  running iex starts an instance of the BEAM and then starts an interactive elixir shell inside it.

  iex(1)> 1 + 2
  3

  everything in elixir is an expression that has a return value

  You can type practically anything that constitutes valid Elixir code, including more complicated multiline expressions:





  """
end
