def cube(x)
  x * x * x
end

def sine_estimator(x)
  (3 * x) - (4 * cube(x))
end

def sine(angle)
  $num_iter += 1
  if angle.abs < 0.1
    angle
  else 
    sine_estimator sine(angle/3.0)
  end
end

$num_iter = 0

puts sine(12.15)
puts $num_iter
