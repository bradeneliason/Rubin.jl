using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(3*(5+-4*cos(x))^-1, x) == :(x+2*arctan((2+-1*cos(x))^-1*sin(x)))
@test integrate((3+cos(x)^2+2*sin(x)+-2*cos(x)*sin(x))^-1*(1+2*sin(x)+cos(x)), x) == :(-1*arctan((2+sin(x))^-1*(-1*sin(x)+2*cos(x))))
@test integrate((-2*sin(x)^2+-2*sin(x)+4*cos(x)+cos(x)*sin(x))^-1*(2+5*sin(x)+cos(x)), x) == :(-1*log(1+-3*cos(x)+sin(x))+log(3+cos(x)+sin(x)))
@test integrate((1+-5*sin(x)+3*cos(x)^2+4*cos(x)+-1*cos(x)*sin(x))^-1*(3+2*sin(x)+7*cos(x)), x) == :(-1*log(1+-2*sin(x)+cos(x))+log(3+cos(x)+sin(x)))
@test integrate((-1+-4*cos(x)+-3*cos(x)^2+4*cos(x)^3)^-1*(-1+4*cos(x)+5*cos(x)^2), x) == :(x+-2*arctan((3+cos(x))^-1*sin(x))+-2*arctan((1+2*cos(x)+5*cos(x)^2)^-1*(3*sin(x)+7*cos(x)*sin(x))))
@test integrate((-1+-9*cos(x)^2+2*cos(x)+4*cos(x)^3)^-1*(-5+2*cos(x)+7*cos(x)^2), x) == :(x+-2*arctan(2*(1+-1*cos(x)+2*cos(x)^2)^-1*cos(x)*sin(x)))
@test integrate(3*(5+4*sin(x))^-1, x) == :(x+2*arctan((2+sin(x))^-1*cos(x)))
@test integrate(2*(1+cos(x)^2)^-1, x) == :(x*2^(1/2)+-1*2^(1/2)*arctan((1+2^(1/2)+cos(x)^2)^-1*cos(x)*sin(x)))
@test integrate((p+q*cos(x)+r*sin(x))^-1, x) == :(2*(p^2+-1*q^2+-1*r^2)^-1//2*arctan((p^2+-1*q^2+-1*r^2)^-1//2*(r+(p+-1q)*tan((1/2)*x))))
