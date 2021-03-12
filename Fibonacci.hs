fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n | n > 1 = fibonacci (n-1) + fibonacci (n-2)

sucesion = [fibonacci n | n <- [0..]]

phi = (1 + sqrt (5)) / 2

fibonacciphi n = (phi ^ n - (1 - phi) ^ n) / sqrt (5)