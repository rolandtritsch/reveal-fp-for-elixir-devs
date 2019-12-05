defmodule Witchcraft.Tutorial.First do
  def run(initial, multiplicator, divisor) do
    result = initial |> mul_by(multiplicator) |> div_by(divisor)
    IO.inspect(result)
  end

  defp mul_by(thiz, thaz), do: thiz * thaz
  defp div_by(thiz, thaz), do: thiz / thaz
end
