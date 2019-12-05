defmodule Mix.Tasks.Tutorial do
  @shortdoc "Various mix commands to work with witchcraft. Use help to learn more."

  @moduledoc """
  See usage() for all available commands.
  """

  use Mix.Task

  alias Witchcraft.Tutorial.{
    First,
    Maybe
  }

  defp usage do
    """
    No command found. Use one of ...

    help - this message
    first - getting started
    maybe - getting started (with the first monad)
    """
  end

  defp usage_first do
    """
    first: Missing parameter(s). Use one of ...

    first <inital> <multiplicator> <divisor>
    """
  end

  defp usage_maybe do
    """
    maybe: Missing parameter(s). Use one of ...

    maybe <inital> <multiplicator> <divisor>
    """
  end

  @impl true
  def run(["help"]), do: Mix.raise(usage())

  def run(["first", inital, multiplicator, divisor]) do
    {i, ""} = Integer.parse(inital)
    {m, ""} = Integer.parse(multiplicator)
    {d, ""} = Integer.parse(divisor)
    First.run(i, m, d)
  end

  def run(["maybe", inital, multiplicator, divisor]) do
    {i, ""} = Integer.parse(inital)
    {m, ""} = Integer.parse(multiplicator)
    {d, ""} = Integer.parse(divisor)
    Maybe.run(i, m, d)
  end

  def run([]), do: run(["help"])
  def run(_), do: run(["help"])
end
