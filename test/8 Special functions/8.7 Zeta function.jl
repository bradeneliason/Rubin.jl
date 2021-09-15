using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x^2*SpecialFunctions.zeta(2,a+b*x), x) == :(2*b^-3*SpecialFunctions.polygamma(-2,x)+b^-1*x^2*SpecialFunctions.polygamma(0,x)+-2*x*b^-2*loggamma(a+b*x))
@test integrate(x*SpecialFunctions.zeta(2,a+b*x), x) == :(-1*b^-2*loggamma(a+b*x)+x*b^-1*SpecialFunctions.polygamma(0,x))
@test integrate(SpecialFunctions.zeta(2,a+b*x), x) == :(b^-1*SpecialFunctions.polygamma(0,x))
@test integrate(x^-2*SpecialFunctions.zeta(2,a+b*x)+-1*b*x^-1*SpecialFunctions.polygamma(2,x), x) == :(-1*x^-1*SpecialFunctions.polygamma(1,x))
@test integrate(x*SpecialFunctions.zeta(s,a+b*x), x) == :(x*b^-1*(1+-1s)^-1*SpecialFunctions.zeta(-1+s,a+b*x)+-1*b^-2*(1+-1s)^-1*(2+-1s)^-1*SpecialFunctions.zeta(-2+s,a+b*x))
@test integrate(SpecialFunctions.zeta(s,a+b*x), x) == :(b^-1*(1+-1s)^-1*SpecialFunctions.zeta(-1+s,a+b*x))
@test integrate(x^-2*SpecialFunctions.zeta(s,a+b*x)+b*s*x^-1*SpecialFunctions.zeta(1+s,a+b*x), x) == :(-1*x^-1*SpecialFunctions.zeta(s,a+b*x))
