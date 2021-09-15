using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(csc(c+d*x)^3*(A+A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(-2*A*a*d^-1*cot(c+d*x)+-7//8*A*a*d^-1*arctanh(cos(c+d*x))+-2//3*A*a*d^-1*cot(c+d*x)^3+-7//8*A*a*d^-1*cot(c+d*x)*csc(c+d*x)+-1//4*A*a*d^-1*csc(c+d*x)^3*cot(c+d*x))
@test integrate(csc(c+d*x)^2*(A+A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(-1*A*a*d^-1*arctanh(cos(c+d*x))+-5//3*A*a*d^-1*cot(c+d*x)+-1*A*a*d^-1*cot(c+d*x)*csc(c+d*x)+-1//3*A*a*d^-1*csc(c+d*x)^2*cot(c+d*x))
@test integrate((A+A*csc(c+d*x))*(a+a*csc(c+d*x))*csc(c+d*x), x) == :(-2*A*a*d^-1*cot(c+d*x)+-3//2*A*a*d^-1*arctanh(cos(c+d*x))+-1//2*A*a*d^-1*cot(c+d*x)*csc(c+d*x))
@test integrate((A+A*csc(c+d*x))*(a+a*csc(c+d*x))*sin(c+d*x), x) == :(2*A*a*x+-1*A*a*d^-1*arctanh(cos(c+d*x))+-1*A*a*d^-1*cos(c+d*x))
@test integrate(sin(c+d*x)^2*(A+A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(3//2*A*a*x+-2*A*a*d^-1*cos(c+d*x)+-1//2*A*a*d^-1*cos(c+d*x)*sin(c+d*x))
@test integrate(sin(c+d*x)^3*(A+A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(A*a*x+-2*A*a*d^-1*cos(c+d*x)+1//3*A*a*d^-1*cos(c+d*x)^3+-1*A*a*d^-1*cos(c+d*x)*sin(c+d*x))
@test integrate(csc(c+d*x)^3*(A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(-1//8*A*a*d^-1*arctanh(cos(c+d*x))+-1//8*A*a*d^-1*cot(c+d*x)*csc(c+d*x)+1//4*A*a*d^-1*csc(c+d*x)^3*cot(c+d*x))
@test integrate(csc(c+d*x)^2*(A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(1//3*A*a*d^-1*cot(c+d*x)^3)
@test integrate((A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x))*csc(c+d*x), x) == :(-1//2*A*a*d^-1*arctanh(cos(c+d*x))+(1/2)*A*a*d^-1*cot(c+d*x)*csc(c+d*x))
@test integrate((A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x))*sin(c+d*x), x) == :(A*a*d^-1*arctanh(cos(c+d*x))+-1*A*a*d^-1*cos(c+d*x))
@test integrate(sin(c+d*x)^2*(A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(-1//2*A*a*x+-1//2*A*a*d^-1*cos(c+d*x)*sin(c+d*x))
@test integrate(sin(c+d*x)^3*(A+A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(1//3*A*a*d^-1*cos(c+d*x)^3)
@test integrate(csc(c+d*x)^3*(A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(-1//8*A*a*d^-1*arctanh(cos(c+d*x))+-1//8*A*a*d^-1*cot(c+d*x)*csc(c+d*x)+1//4*A*a*d^-1*csc(c+d*x)^3*cot(c+d*x))
@test integrate(csc(c+d*x)^2*(A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(1//3*A*a*d^-1*cot(c+d*x)^3)
@test integrate((A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x))*csc(c+d*x), x) == :(-1//2*A*a*d^-1*arctanh(cos(c+d*x))+(1/2)*A*a*d^-1*cot(c+d*x)*csc(c+d*x))
@test integrate(csc(c+d*x)^-1*(A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(A*a*d^-1*arctanh(cos(c+d*x))+-1*A*a*d^-1*cos(c+d*x))
@test integrate(csc(c+d*x)^-2*(A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(-1//2*A*a*x+-1//2*A*a*d^-1*cos(c+d*x)*sin(c+d*x))
@test integrate(csc(c+d*x)^-3*(A+-1*A*csc(c+d*x))*(a+a*csc(c+d*x)), x) == :(1//3*A*a*d^-1*cos(c+d*x)^3)
@test integrate(csc(c+d*x)^3*(A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(2*A*a*d^-1*cot(c+d*x)+-7//8*A*a*d^-1*arctanh(cos(c+d*x))+2//3*A*a*d^-1*cot(c+d*x)^3+-7//8*A*a*d^-1*cot(c+d*x)*csc(c+d*x)+-1//4*A*a*d^-1*csc(c+d*x)^3*cot(c+d*x))
@test integrate(csc(c+d*x)^2*(A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(A*a*d^-1*arctanh(cos(c+d*x))+-5//3*A*a*d^-1*cot(c+d*x)+A*a*d^-1*cot(c+d*x)*csc(c+d*x)+-1//3*A*a*d^-1*csc(c+d*x)^2*cot(c+d*x))
@test integrate((A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x))*csc(c+d*x), x) == :(2*A*a*d^-1*cot(c+d*x)+-3//2*A*a*d^-1*arctanh(cos(c+d*x))+-1//2*A*a*d^-1*cot(c+d*x)*csc(c+d*x))
@test integrate(csc(c+d*x)^-1*(A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(-2*A*a*x+-1*A*a*d^-1*arctanh(cos(c+d*x))+-1*A*a*d^-1*cos(c+d*x))
@test integrate(csc(c+d*x)^-2*(A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(3//2*A*a*x+2*A*a*d^-1*cos(c+d*x)+-1//2*A*a*d^-1*cos(c+d*x)*sin(c+d*x))
@test integrate(csc(c+d*x)^-3*(A+-1*A*csc(c+d*x))*(a+-1*a*csc(c+d*x)), x) == :(-1*A*a*x+-2*A*a*d^-1*cos(c+d*x)+1//3*A*a*d^-1*cos(c+d*x)^3+A*a*d^-1*cos(c+d*x)*sin(c+d*x))
