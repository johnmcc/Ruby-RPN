require "minitest/autorun"
require "minitest/rg"
require_relative "./rpn" 

class TestRPN < MiniTest::Test
  def setup
    @rpn = Rpn.new
  end

  def test_no_data
    assert_nil(@rpn.solve)
  end 

  def test_addition
    @rpn.calculation = "3 4 +"
    assert_equal(7, @rpn.solve)
  end

  def test_subtraction
    @rpn.calculation = "4 5 -"
    assert_equal(-1, @rpn.solve)
  end

  def test_multiplication
    @rpn.calculation = "4 2 *"
    assert_equal(8, @rpn.solve)
  end

  def test_division
    @rpn.calculation = "8 4 /"
    assert_equal(2, @rpn.solve)
  end

  def test_multiple_addition
    @rpn.calculation = "2 2 2 2 + + +"
    assert_equal(8, @rpn.solve)
  end

  def test_addition_multiplication
    @rpn.calculation = "8 4 2 + *"
    assert_equal(48, @rpn.solve)
  end

  def test_addition_subtraction
    @rpn.calculation = "8 4 + 2 -"
    assert_equal(10, @rpn.solve)
  end

  def test_subtraction_multiplication
    @rpn.calculation = "9 5 - 10 *"
    assert_equal(40, @rpn.solve)
  end

  def test_subtraction_division
    @rpn.calculation = "10 4 - 2 /"
    assert_equal(3, @rpn.solve)
  end

  def test_float_addition
    @rpn.calculation = "2.5 2.5 +"
    assert_equal(5, @rpn.solve)
  end

  def test_float_subtraction
    @rpn.calculation = "5 2.5 -"
    assert_equal(2.5, @rpn.solve)
  end
end