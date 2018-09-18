defmodule Practice.Pali do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def pali(str) do
    str
    |>String.downcase
    |>String.reverse == String.downcase(str)
  end
end
