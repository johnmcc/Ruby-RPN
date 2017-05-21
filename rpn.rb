class Rpn
  attr_writer :calculation
  def initialize
    @calculation = ""
    @stack = []
  end

  def solve
    result = 0
    @calculation.split(" ").each do |element|
      to_push = is_number?(element) ? element.to_i : calculate(element)
      @stack << to_push
    end

    @stack.first
  end

  def is_number? string
    true if Float(string) rescue false
  end

  def calculate method
    num1, num2 = [@stack.pop, @stack.pop]

    return num1 + num2 if method == "+"
    return num2 - num1 if method == "-"
    return num1 * num2 if method == "*"
    return num2 / num1 if method == "/"
  end
end