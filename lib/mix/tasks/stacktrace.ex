defmodule Witchcraft.Tutorial.Stacktrace do
  defmodule Level3 do
    def run(true), do: :ok
    def run(false), do: {:error, "Something terrible happened"}
  end

  defmodule Level2 do
    def run(pass) do
      case Level3.run(pass) do
        :ok -> :ok
        {:error, reason} ->
          {:error, "Level2 failed - #{reason}"}
      end
    end
  end

  defmodule Level1 do
    def run(pass) do
      case Level2.run(pass) do
        :ok -> :ok
        {:error, reason} ->
          {:error, "Level1 failed - #{reason}"}
      end
    end
  end

  def run(pass) do
    case Level1.run(pass) do
      :ok ->
        IO.puts("Done/Worked")
        :ok
      {:error, reason} ->
        IO.puts("#{__MODULE__} - Error: #{reason}")
        {:error, "Tutorial failed"}
    end
  end
end
