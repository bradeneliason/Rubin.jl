using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(csc(x)^-1//2*(a+b*csc(x))*(A+B*csc(x)+C*csc(x)^2), x) == :(csc(x)^(1/2)*(-2*B*b+-2*C*a)*cos(x)+csc(x)^(1/2)*sin(x)^(1/2)*(-2*a*(A+-1C)+2*B*b)*Elliptic.E(-1//2*x+1//4*pi,2)+-1*csc(x)^(1/2)*sin(x)^(1/2)*(2*A*b+2*B*a+2//3*C*b)*Elliptic.F(-1//2*x+1//4*pi,2)+-2//3*C*b*csc(x)^3//2*cos(x))
