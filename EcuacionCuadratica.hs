ecuacion a b c signo = if d < 0 then error "La solución no es real" else
        if d == 0 then x1 else
        case signo of 0 -> x1
                      1 -> x2
        where
             x1 = e - sqrt d / (2 * a)
             x2 = e + sqrt d / (2 * a)
             d = b * b - 4 * a * c
             e = - b / (2 * a)
