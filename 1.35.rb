def fixed_point(first_guess, tolerance, &f)
  close_enough = lambda do |v1, v2|
    (v1 - v2).abs < tolerance
  end
  try = lambda do |guess|
    subsequent = f[guess]
    if close_enough[guess, subsequent]
      subsequent
    else
      try[subsequent]
    end
  end
  try[first_guess]
end

def golden_ratio(tolerance)
  fixed_point(1, tolerance) do |x|
    1 + 1.0 / x
  end
end

p golden_ratio(0.1)
p golden_ratio(0.001)
p golden_ratio(0.00001)
p golden_ratio(0.0000001)
