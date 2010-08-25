def sum(term, a, subsequent, b)
  if a > b
    0
  else
    term[a] + sum(term, subsequent[a], subsequent, b)
  end
end

def iterative_sum(term, a, subsequent, b)
  result = 0
  loop do
    if a > b
      return result
    else
      result += term[a]
      a = subsequent[a]
    end
  end
end


INC = lambda { |n| n + 1 }
CUBE = lambda { |n| n * n * n }   

def sum_cubes(a,b)
  sum(CUBE, a, INC, b)
end

def iterative_sum_cubes(a,b)
  iterative_sum(CUBE, a, INC, b)
end


p sum_cubes(3, 10000)
p iterative_sum_cubes(3, 10000)