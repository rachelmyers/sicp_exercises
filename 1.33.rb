def filtered_accumulate (combiner, null_value, term, a, subsequent, b, filter)
  result = null_value
  loop do
    if a > b
      return result
    else
      if filter[a]
        result = combiner[term[a], result]
      end
      a = subsequent[a]
    end
  end
end

def expmod(base, exp, m)
  if exp == 0
    1
  elsif exp.even?
    (expmod(base, exp / 2, m) ** 2) % m
  else
    (expmod(base, exp - 1, m) * base) % m
  end
end

def fermat_test(n)
  a = 1 + rand(n - 1)
  expmod(a, n, n) == a
end

def fast_prime?(n, times)
  if times == 0
    true
  elsif fermat_test(n)
    fast_prime?(n, times - 1)
  else
    false
  end
end

sum = lambda { |a, b| a + b}
term = lambda { |a| a * a }
subsequent = lambda { |a| a + 1 }
filter = lambda { |a| fast_prime?(a, 10) }

puts filtered_accumulate(sum, 0, term, 1, subsequent, 12, filter)
