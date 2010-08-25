def smallest_divisor(n)
  find_divisor(n, 2)
end

def divides?(a, b)
  b % a == 0
end

def find_divisor(n, test_divisor)
  if test_divisor ** 2 > n
    n
  elsif divides?(test_divisor, n)
    test_divisor
  else
    find_divisor(n, test_divisor + 1)
  end
end

def prime?(n)
  n == smallest_divisor(n)
end

def expmod(base, exp, m)
  if exp == 0
    1
  elsif exp.even?
    (expmod(base, exp/2, m) ** 2) % m
  else
    (expmod(base, exp-1, m) * base) % m
  end
end

def fermat_test(n)
  a = 1 + rand(n-1)
  expmod(a,n,n) == a
end

def fast_prime?(n,times)
  if times == 0
    true
  elsif fermat_test(n)
    fast_prime?(n, times - 1)
  else
    false
  end
end
    

def timed_prime_test(n)
  puts
  print n
  start_prime_test(n, Time.now.to_f)
end

def start_prime_test(n, start_time)
  if fast_prime?(n,5)
    report_prime(Time.now.to_f - start_time)
    return true
  else
    return false
  end
end

def report_prime(elapsed_time)
  print " *** "
  print elapsed_time
end

def first_3_primes_from(m)
  q = 0
  loop do
    if timed_prime_test(m)
      q += 1
      if q == 3
        break
      end
    end
    m += 1  
  end
end

first_3_primes_from(1000)
first_3_primes_from(10000)
first_3_primes_from(100000)
first_3_primes_from(1000000)
