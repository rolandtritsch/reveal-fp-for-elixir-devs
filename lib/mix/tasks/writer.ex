defmodule Witchcraft.Tutorial.Writer do
  use Witchcraft
  alias Algae.Writer

  defmodule Step2 do
    def triple(n), do: n * 3
  end

  defmodule Step1 do
    def double(n), do: n * 2
  end

  def execute(n, f) do
    monad Writer.new(n, "log") do
      Writer.tell "step#{n}"
      return f.(n)
    end
  end

  def run(n) do
    #n |> Step1.double() |> Step2.triple() |> IO.inspect()
    (execute(n, fn x -> x end) >>> &execute(&1, fn x -> x * 10 end)) >>> &execute(&1, fn x -> x * 10 end) |> IO.inspect()
  end
end
