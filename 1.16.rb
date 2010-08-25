def fast_exp(base, exp)
	acc = 1
	while exp > 0
	  if exp.even?
	    exp /= 2
	    base = (base * base)
	  else
	    exp -= 1
	    acc = acc * base
	  end
	end
  acc
end
 
puts fast_exp(2,2)
puts fast_exp(2,3)
puts fast_exp(2,4)
puts fast_exp(2,5)
puts fast_exp(2,6)
puts fast_exp(2,7)
puts fast_exp(2,8)
puts fast_exp(2,9)
puts fast_exp(2,10)
puts fast_exp(2,11)
puts fast_exp(2,12)
