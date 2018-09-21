defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

# change n to i


  def eval(l, i, n) do
    new_l = ""
    el1 = Enum.at(l, 0)
    el2 = Enum.at(l, 1)
    if length(l) <= 2 or el2 == nil do
      n = n + [parse_float(el1)]
      #new_l ++ n
      #acc = ""
      #r_val = Enum.reduce(new_l, acc, fn(x, acc)-> x<>acc end)
    else
      Enum.find(l, fn(el)->
        if (match?("*", el) or match?("/", el)) do
          i = i + 2
          if el2 == "*" do
            n = n + [parse_float(el1) * parse_float(Enum.at(l, i))]
          end
          if el2 == "/" do
            n = n + [parse_float(el1) / parse_float(Enum.at(l, i))]
          end
          new_l = [n] ++ Enum.slice(l, i+2, length(l))
          eval(new_l, i, n)
        end
      end)
      #if no * or / in l, but we still have 3 or more els in l, evaluate
      if el2 == "+" do
        i = i + 2
        n = n + [parse_float(el1) + parse_float(Enum.at(l, i))]
      end
      if el2 == "-" do
        i = i + 2
        n = n + [parse_float(el1) - parse_float(Enum.at(l, i))]
      end
      new_l = n ++ Enum.slice(l, i, length(l))
      eval(new_l, i, n)
    end
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    |>String.codepoints()
    |>eval(0,0)
    #|> String.split(~r/\s+/)
    #|> hd
    #|> parse_float
    #|> :math.sqrt()

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end
end
