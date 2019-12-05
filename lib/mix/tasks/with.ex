defmodule Witchcraft.Tutorial.With do
  def run(initial, multiplicator, divisor) do
    with result <- mul_by(initial, multiplicator),
         {:ok, result1} <- div_by(result, divisor)
    do
      IO.inspect(result1)
    else
      {:error, :div_by_zero} -> IO.puts("Error: Div by 0")
      {:error, _} -> IO.puts("Error: Unknown")
    end
  end

  defp mul_by(thiz, thaz), do: thiz * thaz
  defp div_by(thiz, thaz) do
    if thaz > 0 do
      {:ok, thiz / thaz}
    else
      {:error, :div_by_zero}
    end
  end
end
