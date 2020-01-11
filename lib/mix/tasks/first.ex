defmodule Witchcraft.Tutorial.First do
  def run(initial, multiplicator, divisor) do
    initial |> mul_by(multiplicator) |> div_by(divisor) |> IO.inspect()
  end

  defp mul_by(thiz, thaz), do: thiz * thaz
  defp div_by(thiz, thaz), do: thiz / thaz
end
