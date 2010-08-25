def fast_expt(b, n)
  if n = 0
    1
  elsif n.even?
    (fast_expt(b, n/2)) ^2
    