defmodule Mix.Tasks.Tutorial do
  @shortdoc "Various mix commands to work with witchcraft. Use help to learn more."

  @moduledoc """
  See usage() for all available commands.
  """

  use Mix.Task

  alias Witchcraft.Tutorial.{
    First,
    With,
    Maybe
  }

  defp usage do
    """
    No command found. Use one of ...

    help - this message
    first - getting started
    with - getting started (with with)
    maybe - getting started (with the first monad)
    """
  end

  defp usage_first do
    """
    first: Missing parameter(s). Use one of ...

    first <initial> <multiplicator> <divisor>
    """
  end

  defp usage_with do
    """
    with: Missing parameter(s). Use one of ...

    with <initial> <multiplicator> <divisor>
    """
  end

  defp usage_maybe do
    """
    maybe: Missing parameter(s). Use one of ...

    maybe <initial> <multiplicator> <divisor>
    """
  end

  @impl true
  def run(["help"]), do: Mix.raise(usage())

  def run(["first"]), do: Mix.raise(usage_first())
  def run(["first", initial, multiplicator, divisor]) do
    {i, ""} = Integer.parse(initial)
    {m, ""} = Integer.parse(multiplicator)
    {d, ""} = Integer.parse(divisor)
    First.run(i, m, d)
  end

  def run(["with"]), do: Mix.raise(usage_with())
  def run(["with", initial, multiplicator, divisor]) do
    {i, ""} = Integer.parse(initial)
    {m, ""} = Integer.parse(multiplicator)
    {d, ""} = Integer.parse(divisor)
    With.run(i, m, d)
  end

  def run(["maybe"]), do: Mix.raise(usage_maybe())
  def run(["maybe", initial, multiplicator, divisor]) do
    {i, ""} = Integer.parse(initial)
    {m, ""} = Integer.parse(multiplicator)
    {d, ""} = Integer.parse(divisor)
    Maybe.run(i, m, d)
  end

  def run([]), do: run(["help"])
  def run(_), do: run(["help"])
end
