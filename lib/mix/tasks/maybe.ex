defmodule Witchcraft.Tutorial.Maybe do
  alias Algae.Maybe
  alias Algae.Maybe.{Just, Nothing}

  def run(initial, multiplicator, divisor) do
    Maybe.new(initial) |> mul_by(Maybe.new(multiplicator)) |> div_by(Maybe.new(divisor)) |> IO.inspect()
  end

  defp mul_by(_thiz, %Nothing{} = _thaz), do: Maybe.new()
  defp mul_by(%Nothing{} = _thiz, _thaz), do: Maybe.new()
  defp mul_by(%Just{just: thiz}, %Just{just: thaz}), do: Maybe.new(thiz * thaz)

  defp div_by(_thiz, %Nothing{} = _thaz), do: Maybe.new()
  defp div_by(%Nothing{} = _thiz, _thaz), do: Maybe.new()
  defp div_by(_thiz, %Just{just: 0}), do: Maybe.new()
  defp div_by(%Just{just: thiz}, %Just{just: thaz}), do: Maybe.new(thiz / thaz)
end
