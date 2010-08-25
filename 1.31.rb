def recursive_product(term, a, subsequent, b)
  if a > b
    1
  else
    term[a] * recursive_product(term, subsequent[a], subsequent, b)
  end
end

def recursive_factorial(b)
  term = lambda { |a| a }
  subsequent = lambda { |a| a + 1 }
  recursive_factorial(term, 1, subsequent, b)
end

def recursive_pi(b)
  term_numerator = lambda { |a| a % 2 == 0 ? a + 2 : a + 3}
  term_denominator = lambda { |a| a % 2 == 0  ? a + 3 : a + 2}
  subsequent = lambda { |a| a + 1 }
  numerator = recursive_product(term_numerator, 0, subsequent, b)
  denominator = recursive_product(term_denominator, 0, subsequent, b)
  numerator * 4.0 / denominator
end

def iterative_product(term, a, subsequent, b)
  result = 1
  loop do
    if a > b
      return result
    else
      result *= term[a]
      a = subsequent[a]
    end
  end
end

def iterative_factorial(b)
  term = lambda { |a| a }
  subsequent = lambda { |a| a + 1 }
  iterative_product(term, 1, subsequent, b)
end

def iterative_pi(b)
  term_numerator = lambda { |a| a % 2 == 0 ? a + 2 : a + 3}
  term_denominator = lambda { |a| a % 2 == 0  ? a + 3 : a + 2}
  subsequent = lambda { |a| a + 1 }
  numerator = iterative_product(term_numerator, 0, subsequent, b)
  denominator = iterative_product(term_denominator, 0, subsequent, b)
  numerator * 4.0 / denominator
end

puts recursive_pi(5)
puts iterative_pi(5)
puts recursive_pi(50)
puts iterative_pi(50)
puts recursive_pi(150)
puts iterative_pi(150)