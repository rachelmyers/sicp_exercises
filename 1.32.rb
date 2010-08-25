def accumulate (combiner, null_value, term, a, subsequent, b)
    result = null_value
    loop do
      if a > b
        return result
      else
        result = combiner[term[a], result]
        a = subsequent[a]
      end
    end
end

product = lambda { |a, b| a * b}
term = lambda { |a| a }
subsequent = lambda { |a| a + 1 }

puts accumulate(product, 1, term, 5, subsequent, 12)