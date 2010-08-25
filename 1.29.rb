def sum(term, a, thereafter, b)
	if a > b
	  0
	else
	  term[a] + sum(term, thereafter[a], thereafter, b)
	end
end

INC = lambda { |n| n + 1 }
CUBE = lambda { |n| n ** 3 }
# 
# def sum_cubes(a,b)
#   sum(CUBE, a, INC, b)
# end

# p sum_cubes(4,15)
def integral(f, a, b, dx)
  add_dx = lambda { |x| x + dx}
  sum(f, a + dx / 2.0, add_dx, b) * dx
end

p integral(CUBE, 0, 1, 0.01)
p integral(CUBE, 0, 1, 0.001)
# 
# def simpson(f, a, b, h)
#   h = lamda { ( b - a ) / n }
# 
