defmodule Witchcraft.Tutorial.Maybe do
  alias Algae.Maybe.{Just, Nothing}

  def run(initial, multiplicator, divisor) do
    result = Just.new(initial) |> mul_by(Just.new(multiplicator)) |> div_by(Just.new(divisor))
    IO.inspect(result)
  end

  defp mul_by(_thiz, %Nothing{} = _thaz), do: Nothing.new()
  defp mul_by(%Nothing{} = _thiz, _thaz), do: Nothing.new()
  defp mul_by(%Just{just: thiz}, %Just{just: thaz}), do: Just.new(thiz * thaz)

  defp div_by(_thiz, %Nothing{} = _thaz), do: Nothing.new()
  defp div_by(%Nothing{} = _thiz, _thaz), do: Nothing.new()
  defp div_by(_thiz, %Just{just: 0}), do: Nothing.new()
  defp div_by(%Just{just: thiz}, %Just{just: thaz}), do: Just.new(thiz / thaz)
end
