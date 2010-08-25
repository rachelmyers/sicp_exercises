def A (x,y)
	if y == 0
		0
	elsif x == 0
		2*y
	elsif y ==1
		2
	else
		A(x-1, A(x, y-1))
	end
end