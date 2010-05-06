puts "1.1.7, 1.1.8"
# In addition to the exercises below, we learned about lexical
# and dynamic scoping, and how to make a variable bound or free.

puts "Books's Example"
# of Newton's method of calculating Square Roots,
# translated from Scheme into Ruby.

# Tolerance sets how close our square root caluclation must be.
# If less accuracy is needed, use a larger number.
# If more accuracy is needed, use a smaller number.
Tolerance = 0.00001

# Starts the calculation by calling the sqrt_iter method
# with an initial guess that the square root is 1.0.  
# You can set the inital guess to any float.
def sqrt(x)
  sqrt_iter(1.0, x)
end

# Iteratively narrows in on the square root by seeing if the
# guess is good enough, and if not, calling the improve method.
def sqrt_iter(guess, x)
  if good_enough?(guess, x)
    guess
  else 
    sqrt_iter(improve(guess, x), x)
  end
end

# Tests to see if our guess is acceptable according to the
# Tolerance value set at the beginning.
def good_enough?(guess, x)
  ((guess**2)-x).abs < Tolerance
end

# Newton's cool way to narrow in on the right answer:
# Ex: if x = 2 and guess = 1, then average = 1.5 = new guess
# Using guess = 1.5, average = 1.4167
# Using guess = 1.4167, average = 1.4142, within tolerance

def improve(guess, x)
  average(guess, (x / guess))
end

def average(x,y)
  (x+y)/2
end

# Though x is being used repeatedly as a bound variable, in this
# case, it would be prefectly fine as a free variable.

# Some examples
puts sqrt(2)
puts sqrt(16)
puts sqrt(256)
puts sqrt(15)

# This float's too small; test fails to give correct answer:
# puts sqrt(0.00000034) 

# If the float too big your computer will take
# a ridiculously long time to calculate it.
# Control + C to escape.


puts "Exercise 1.6"
# What would happen if we defined our own if function that calls if?
# Converting, for example, the tradtional if-statement
# 
# if russians_have_attacked? then
#  launch_nukes
# else
#  stay_alert
# end
#  
# into the ternary operator of form
#
# def myif(cond, when_true, when_false)
#  cond ? when_true : when_false
# end
# 
# Because it's evaluated applicatively, from the most nested
# statements working outwards, in the example
# myif (russians_have_attacked?, launch_nukes, stay_alert)
# it will launch the nukes, stay alert, then see if the russians
# have attacked.  Also, in the sqrt example, it will lead to
# a stack overflow error.
# 
# Boyfriend:  "The official ruby style guide says a method should
# end in a bang (!) if it's destructive, and I would say of all the
# methods in Ruby, launch_nukes probably deserves a bang."

  
  
puts "Exercise 1.7"
# The sqrt method fails for very small or very large numbers.
# Alternative good_enough? method will compare how much guesses
# change between interations and return a value when the change
# becomes very small.

# Tolerance sets how close successive iterations must be.
Tolerance = 0.00001

def sqrt(x)
  sqrt_iter(1.0, 10.0, x)
end

def sqrt_iter(previous_guess, current_guess, x)
  if good_enough?(previous_guess, current_guess)
    current_guess
  else 
    sqrt_iter(current_guess, improve(current_guess, x), x)
  end
end

# Compares changes between guesses; if the difference is within
# the Tolerance set at the beginning, the guess is good enough.
def good_enough?(previous_guess, current_guess)
  (previous_guess - current_guess).abs < Tolerance
end

def improve(current_guess, x)
  average(current_guess, (x / current_guess))
end

def average(x,y)
  (x+y)/2
end

# Some examples
puts sqrt(0.000004)
puts sqrt(300000000)
puts sqrt(256)


puts "Exercise 1.8"
# Creates a cube root procedure analagous to square root procedure.
Tolerance = 0.01

def cbrt(x)
  cbrt_iter(1.0, x)
end

def cbrt_iter(guess, x)
  if good_enough?(guess, x)
    guess
  else 
    cbrt_iter(improve(guess, x), x)
  end
end

def good_enough?(guess, x)
  ((guess**3)-x).abs < Tolerance
end

# Newton's SUPER cool way to narrow in on cubic roots:
# If you know why this works, tell me.
def improve(guess, x)
  (x/(guess**2) + 2*guess)/3
end

# Some examples
puts cbrt(27)
puts cbrt(19683)
puts cbrt(8)
puts cbrt(15)
