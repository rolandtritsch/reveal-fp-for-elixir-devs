defmodule Witchcraft.Scratch do
  use Witchcraft
  alias Witchcraft.Functor
  alias Algae.Maybe

  import Algae.Writer

  defmodule Functions do
    def f(x), do: x + 3

    def exponent(n) do
      monad writer({0, 0}) do
        tell 1
        return n * n
      end
    end
  end

  def run do
    f = fn x -> x + 3 end
    ff = fn x -> x * 3 end
    fff = fn x -> [x * 3] end

    2 |> f.()
    2 |> Functions.f()
    [1, 2, 3] |> Enum.map(f)
    [1, 2, 3] |> Enum.map(&Functions.f/1)
    # {1, 2, 3} |> Enum.map(f)

    [1, 2, 3] |> Functor.map(f)
    {1, 2, 3} |> Functor.map(f)
    %{a: 1, b: 2, c: 3} |> Functor.map(f)

    [1, 2, 3] ~> f
    [1, 2, 3] ~> &Functions.f/1
    {1, 2, 3} ~> f
    %{a: 1, b: 2, c: 3} ~> f

    [1, 2, 3] ~>> [f, ff]
    # {1, 2, 3} ~>> [f, ff]
    # %{a: 1, b: 2, c: 3} ~>> [f, ff]

    Maybe.new(1) ~>> Maybe.new(f)
    Maybe.new() ~>> Maybe.new(f)
    Maybe.new(1) ~>> Maybe.new()

    [1, 2, 3] ~> f
    [1, 2, 3] ~> f ~> ff

    [1, 2, 3] >>> fff

    exponent = fn n ->
      monad writer({0, 0}) do
        tell 1
        return n * n
      end
    end

    run(exponent.(42) >>> exponent >>> exponent)
    run((Functions.exponent(42) >>> &Functions.exponent/1) >>> &Functions.exponent/1)

    excite = fn s ->
      monad writer({0.0, "log"}) do
        tell s
        excited <- return "#{s}!"
        tell " => #{excited} ... "
        return excited
      end
    end

    "Hi" |> excite.() >>> excite >>> excite |> run()
  end
end
