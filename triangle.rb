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
def triangle(a, b, c)
  if(!triangleValid(a, b, c))
  	raise TriangleError
  end
  triangleType(a, b, c)
end

def triangleType(a, b, c)
  if( a == b && b == c)
  	 return :equilateral
  end
  if( a == b || b == c || a == c)
  	return :isosceles
  end
  :scalene
end

def triangleValid(a, b, c)
  validSides(a, b, c) && validSideSums(a, b, c)
end

def validSides(*args)
  args.inject(true){ |validity, item| validity && item > 0 }
end

def validSideSums(a, b, c)
	validSideSum(a, b, c) && validSideSum(b, c, a) && validSideSum(a, c, b)
end

def validSideSum(a, b, c)
  (a + b) > c
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
