def smallest_divisor(n)
  find_divisor(n,2)
end

def find_divisor(n, test_divisor)
  if ( test_divisor * test_divisor ) > n
    n
  elsif divides?(test_divisor, n)
    test_divisor
  else
    find_divisor(n, test_divisor == 2 ? 3 : test_divisor + 2)
  end
end

def next_test_divisor(n)
  if n == 2
    3
  else
    n + 2
  end
end

def divides?(a, b)
  b % a == 0
end


#Applied to 1.22


def prime?(n)
  n == smallest_divisor(n)
end

def timed_prime_test(n)
  puts
  print n
  start_prime_test(n, Time.now.to_f)
end

def start_prime_test(n, start_time)
  if prime?(n)
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