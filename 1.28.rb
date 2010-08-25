##TRY AGAIN

def expmod(base, exp, m)
  if exp == 0
    1
  elsif exp.even?
    root = expmod(base, exp/2, m)
    if (root != 1 || root != base - 1) && (root ** 2 == 1 % base)
      return 0
    else
      (root ** 2) % m
    end
  else
    (expmod(base, exp-1, m) * base) % m
  end
end

def miller_rabin_test(n)
  seen = []
  (n/2 + 1).times do
    a = 1 + rand(n)
    retry if seen.include?(a)
    seen << a
    expmod(a, n - 1, n) 
  end
  return true
end