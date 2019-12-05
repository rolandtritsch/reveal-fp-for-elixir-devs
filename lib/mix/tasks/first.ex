defmodule Witchcraft.Tutorial.First do
  def run() do
    result = 10 |> mul_by(2) |> div_by(10)
    IO.puts(result)
  end

  defp mul_by(thiz, thaz), do: thiz * thaz
  defp div_by(thiz, thaz), do: thiz / thaz
end
