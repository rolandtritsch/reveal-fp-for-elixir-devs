defmodule Witchcraft.Tutorial.Second do
  def double(n), do: n * 2

  def run(n) do
    d = &double/1

    n |> d.() |> d.() |> IO.inspect()
  end
end
