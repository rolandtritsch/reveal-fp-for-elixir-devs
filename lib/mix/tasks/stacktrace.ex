defmodule Witchcraft.Tutorial.Stacktrace do
  def bad_double(n) do
    IO.puts("Current #{n}")
    n * 2
  end

  def double({n, log}), do: {n * 2, log <> "Current #{n} - "}

  def run(n) do
    d = &double/1

    {n, ""} |> d.() |> d.() |> IO.inspect()
  end
end
