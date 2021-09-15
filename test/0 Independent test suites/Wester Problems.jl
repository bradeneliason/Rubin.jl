using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((-1+2x)^-7//2*(-5+3x)^2, x) == :(-49//20*(-1+2x)^-5//2+-9//4*(-1+2x)^-1//2+7//2*(-1+2x)^-3//2)
@test integrate((-5*exp(-1*m*x)+2*exp(m*x))^-1, x) == :(-1//10*10^(1/2)*m^-1*arctanh(1//5*10^(1/2)*exp(m*x)))
@test integrate((a+b*cos(x))^-1, x) == :(2*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tan((1/2)*x)))
@test integrate((3+3*cos(x)+4*sin(x))^-1, x) == :(1//4*log(3+4*tan((1/2)*x)))
@test integrate((4+3*cos(x)+4*sin(x))^-1, x) == :(-1//3*log(4+3*cot((1/2)*x+1//4*pi)))
@test integrate((6+3*cos(x)+4*sin(x))^-1, x) == :(1//11*x*11^(1/2)+2//11*11^(1/2)*arctan((6+11^(1/2)+3*cos(x)+4*sin(x))^-1*(-3*sin(x)+4*cos(x))))
@test integrate((1/2)*log((x^2+-1*a^2)^2), x) == :(-2x+(1/2)*x*log((x^2+-1*a^2)^2)+2*a*arctanh(x*a^-1))
