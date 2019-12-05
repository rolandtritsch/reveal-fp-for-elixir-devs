defmodule Mix.Tasks.Tutorial do
  @shortdoc "Various mix commands to work with witchcraft. Use help to learn more."

  @moduledoc """
  See usage() for all available commands.
  """

  use Mix.Task

  alias Witchcraft.Tutorial.{
    First
  }

  defp usage do
    """
    No command found. Use one of ...

    help - this message
    first - getting started
    """
  end

  defp usage_first do
    """
    first: Do not expect a parameter. Use ...

    first
    """
  end

  @impl true
  def run(["help"]), do: Mix.raise(usage())

  def run(["first" | [_ | _]]), do: Mix.raise(usage_first())
  def run(["first"]), do: First.run()

  def run([]), do: run(["help"])
  def run(_), do: run(["help"])
end
