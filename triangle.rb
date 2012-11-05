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

def triangleType(*sides)
  numUniqueSides = sides.uniq.size
  numUniqueSides == 3 ? 
    :scalene : 
    numUniqueSides == 2 ? :isosceles : :equilateral
end

def triangleValid(a, b, c)
  validSides(a, b, c) && validSideSizes(a, b, c)
end

def validSides(*args)
  args.inject(true){ |validity, item| validity && item > 0 }
end

def validSideSizes(*args)
  args.size == 3 && args.permutation.to_a.inject(true){ |validity, arr| validity && arr[0] + arr[1] > arr[2] }
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
