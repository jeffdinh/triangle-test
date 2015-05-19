# 1. Copy this file from the course notes repo into a new repository
# 2. Run `ruby triangle_test.rb`. You should see 6 error messages.
# 3. Implement the Triangle class until all 6 tests are passing.
require "minitest/autorun"

class Triangle
  def initialize(a,b,c)
    @side1 = a
    @side2 = b
    @side3 = c
  end
  
  def kind
    if @side1 == @side2 and @side2 == @side3 and @side3 == @side1
      return :equilateral
    end

    if @side1 == @side2 or @side3 == @side2 or @side1 == @side3
      return :isosceles
    end

    if @side1 != @side2 and @side2 != @side3 and @side3 != @side1
      return :scalene
    end
  end

  def perimeter
      return @side1 + @side2 + @side3
  end
end

class TestMeme < Minitest::Test
  def test_equilateral
    t = Triangle.new(5,5,5)
    assert_equal :equilateral, t.kind
  end

  def test_isosceles
    s = Triangle.new(2,2,3)
    assert_equal :isosceles, s.kind
  end

  def test_other_isosceles
    t = Triangle.new 3,4,3
    assert_equal :isosceles, t.kind
  end

  def test_scalene
    t = Triangle.new 6,7,8
    assert_equal :scalene, t.kind
  end

  def test_perimeter_right
    t = Triangle.new(3,4,5)
    assert_equal 12, t.perimeter
  end

  def test_perimeter_eq
    t = Triangle.new 10,20,30
    assert_equal 60, t.perimeter
  end
end
