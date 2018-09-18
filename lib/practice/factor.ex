defmodule Practice.Factor do
  def parse_int(text) do
    {num, _} = Integer.parse(text)
    num
  end

  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def get_factors(n, p, acc) do
    cond do
      n >= p * p ->
        cond do
          rem(n, p) == 0 ->
            acc = "#{acc}#{p} * "
            n = div(n, p)
            get_factors(n, p, acc)
          true ->
            p = p + 1
            get_factors(n, p, acc)
        end
      true ->
        acc = "#{acc}#{n}"
        acc
    end
  end

  def factor(x) do
    p = 2
    x
    |>parse_int
    |>get_factors(p, "")
  end
end
