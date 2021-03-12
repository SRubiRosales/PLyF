fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci(x - 1) + fibonacci(x - 2)

--Recursive loop to repeat the fib-function multiple times
x = 0
numsfibonacci x y = do
    putStrLn $ show $ fibonacci x
    if x == y
        then return ()
    else numsfibonacci(x + 1) y