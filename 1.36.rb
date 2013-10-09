def fixed_point(first_guess, tolerance, &f)
    close_enough = lambda do |v1, v2|
    (v1 - v2).abs < tolerance
  end
  try = lambda do |guess|
    subsequent = f[guess]
    puts subsequent
    if close_enough[guess, subsequent]
      subsequent
    else
      try[subsequent]
    end
  end
  try[first_guess]
end





def loggy_problem_no_damping
  fixed_point(2, 0.01) do |x|
    Math.log(1000)/Math.log(x)
  end
end

def loggy_problem_with_damping
  fixed_point(2, 0.01) do |x|
    (Math.log(1000)/Math.log(x) + x) / 2
  end
end

puts loggy_problem_no_damping
puts
puts loggy_problem_with_damping
