triangulocc a b = if (a == b)
then "Triangulo isosceles."
else "Triangulo escaleno."

trianguloch a c = if (a == (cateto a c))
then "Triangulo isosceles."
else "Triangulo escaleno."

hipotenusa a b = sqrt ((a * a) + (b * b))

cateto a c = sqrt ((c * c) - (a * a))