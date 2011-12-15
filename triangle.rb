# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def pythagoras?(a,b,c)
  return (a**2 == (b**2)+(c**2)) || (b**2 == (a**2)+(c**2)) ||(c**2 == (a**2)+(b**2))
end
def triangle(a, b, c)
  # WRITE THIS CODE
  begin
    if a <= 0 || b <= 0 || c <= 0
      begin
      raise TriangleError.new
        end
    elsif pythagoras?(a,b,c)
      begin
      raise TriangleError.new
        end
    else
    end
  rescue TriangleError => ex

  end

  if a == b && b == c
    begin
      :equilateral
    end
  elsif a == b || b == c || c == a
    begin
      :isosceles
    end
  else
    begin
      :scalene
    end
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
