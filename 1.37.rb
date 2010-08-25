def cont_frac(n, d, k)
  result = 0
  while k > 0
    result = n[k] / (d[k] + result)
    k -= 1
  end
  result
end

# p 1 / cont_frac(lambda { |i| 1.0 }, lambda { |i| 1.0 }, 12)

def rec_cont_frac (n, d, k, i = 1)
  if i == k
    n[k] / d[k]
  else
    n[i] / (d[i] + rec_cont_frac(n, d, k, i + 1))
  end
end
p 1 / rec_cont_frac(lambda { |i| 1.0 }, lambda { |i| 1.0 }, 12)
 
