using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(sin(e+f*x)^m*(1+m+-1*sin(e+f*x)^2*(2+m)), x) == :(f^-1*sin(e+f*x)^(1+m)*cos(e+f*x))
@test integrate(sin(e+f*x)^5*(6+-7*sin(e+f*x)^2), x) == :(f^-1*sin(e+f*x)^6*cos(e+f*x))
@test integrate(sin(e+f*x)^4*(5+-6*sin(e+f*x)^2), x) == :(f^-1*sin(e+f*x)^5*cos(e+f*x))
@test integrate(sin(e+f*x)^3*(4+-5*sin(e+f*x)^2), x) == :(f^-1*sin(e+f*x)^4*cos(e+f*x))
@test integrate(sin(e+f*x)^2*(3+-4*sin(e+f*x)^2), x) == :(f^-1*sin(e+f*x)^3*cos(e+f*x))
@test integrate((2+-3*sin(e+f*x)^2)*sin(e+f*x), x) == :(f^-1*sin(e+f*x)^2*cos(e+f*x))
@test integrate(1+-2*sin(e+f*x)^2, x) == :(f^-1*cos(e+f*x)*sin(e+f*x))
@test integrate(-1*sin(e+f*x)^2*csc(e+f*x), x) == :(f^-1*cos(e+f*x))
@test integrate(-1*csc(e+f*x)^2, x) == :(f^-1*cot(e+f*x))
@test integrate(csc(e+f*x)^3*(-2+sin(e+f*x)^2), x) == :(f^-1*cot(e+f*x)*csc(e+f*x))
@test integrate(csc(e+f*x)^4*(-3+2*sin(e+f*x)^2), x) == :(f^-1*csc(e+f*x)^2*cot(e+f*x))
@test integrate(csc(e+f*x)^5*(-4+3*sin(e+f*x)^2), x) == :(f^-1*csc(e+f*x)^3*cot(e+f*x))
@test integrate(sin(e+f*x)^5*(A+C*sin(e+f*x)^2), x) == :(-1*f^-1*(A+C)*cos(e+f*x)+-1//5*f^-1*cos(e+f*x)^5*(A+3C)+1//3*f^-1*cos(e+f*x)^3*(2A+3C)+1//7*C*f^-1*cos(e+f*x)^7)
