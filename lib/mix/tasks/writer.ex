defmodule Witchcraft.Tutorial.Writer do
  use Witchcraft
  alias Algae.Writer

  def double(n) do
    monad Writer.new(0, "") do
      Writer.tell "Double #{n} - "
      return n * 2
    end
  end

  def triple(n) do
    monad Writer.new(0, "") do
      Writer.tell "Triple #{n} - "
      return n * 3
    end
  end

  def run(n) do
    d = &double/1
    t = &triple/1

    # n |> d.() |> IO.inspect()
    # n |> d.() |> d.() |> IO.inspect()
    # n |> d.() >>> d >>> d |> IO.inspect()
    # n |> d.() >>> d >>> d |> Writer.run() |> IO.inspect()
    n |> d.() >>> d >>> d >>> t |> Writer.run() |> IO.inspect()

  end
end
