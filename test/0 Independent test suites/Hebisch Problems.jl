using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((1+x^4+x^6+-1*x^3+-1*x^5)*exp(x), x) == :(871*exp(x)+x^6*exp(x)+-870*x*exp(x)+-145*x^3*exp(x)+-7*x^5*exp(x)+36*x^4*exp(x)+435*x^2*exp(x))
@test integrate((x^3+2x)^-1*(2+-1*x^2)*exp(x*(2+x^2)^-1), x) == :(expintegralei(x*(2+x^2)^-1))
@test integrate((x^3+2x)^-1*(2+-1*x^3+2x+2*x^4+3*x^2)*exp(x*(2+x^2)^-1), x) == :((2+x^2)*exp(x*(2+x^2)^-1)+expintegralei(x*(2+x^2)^-1))
@test integrate((x+exp(x))^-1*(1+exp(x))*exp(x+exp(x)), x) == :(expintegralei(x+exp(x)))
@test integrate((1+x^3+-1x+-1*x^2)^-1*(1+x^3+-1*x^2+-3x)*exp((-1+x^2)^-1), x) == :((1+x)*exp((-1+x^2)^-1))
@test integrate(log(x)^-2*(-1+log(x)^2)*exp(1+log(x)^-1), x) == :(x*exp(1+log(x)^-1))
@test integrate(log(x)^-2*(-1+log(x)^2*(1+x))*exp(x+log(x)^-1), x) == :(x*exp(x+log(x)^-1))
