# def func_recur(n)
#   return n  if n < 3
#   func_recur(n-1) + 2 * func_recur(n-2) + 3 *func_recur(n-3)
# end
# 
# puts func_recur(1)
# puts func_recur(2)
# puts func_recur(3)
# puts func_recur(4)
# puts func_recur(5)
# puts func_recur(6)
# puts func_recur(7)
# puts func_recur(8)
# puts func_recur(9)
# puts func_recur(10)


def func(n)
  if n < 3
    n
  else func_iter(2, 1, 0, n)
  end
end

def func_iter(a, b, c, count)
  if count < 3
    a
  else func_iter(a + 2 * b + 3 * c, a, b, count - 1)
  end
end

puts func(1)
puts func(2)
puts func(3)
puts func(4)
puts func(5)
puts func(6)