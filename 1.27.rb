def expmod(base, exp, m)
  if exp == 0
    1
  elsif exp.even?
    (expmod(base, exp/2, m) ** 2) % m
  else
    (expmod(base, exp-1, m) * base) % m
  end
end

def test_carmichael(carmichael)
  if (1..carmichael-1).all? { |n| expmod(n,carmichael,carmichael) == n }
    puts "OMG #{carmichael} is a Carmichael number! WOW!"
  else
    puts "#{carmichael} is NOT a Carmichael number! :("
  end
end

CARMICHAEL_NUMBERS = [561, 1105, 1729, 2465, 2821, 6601]
CARMICHAEL_NUMBERS.each do |car|
  test_carmichael(car)
end

[3002, 900].each do |noncar|
  test_carmichael(noncar)
end