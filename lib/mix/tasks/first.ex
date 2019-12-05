defmodule Witchcraft.Tutorial.First do
  def run(inital, multiplicator, divisor) do
    result = inital |> mul_by(multiplicator) |> div_by(divisor)
    IO.inspect(result)
  end

  defp mul_by(thiz, thaz), do: thiz * thaz
  defp div_by(thiz, thaz), do: thiz / thaz
end
