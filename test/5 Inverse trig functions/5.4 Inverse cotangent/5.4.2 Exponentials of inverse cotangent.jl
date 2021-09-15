using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+a*x^2)^-1*exp(arccot(x)), x) == :(-1*a^-1*exp(arccot(x)))
@test integrate((a+a*x^2)^-2*exp(arccot(x)), x) == :(-2//5*a^-2*exp(arccot(x))+-1//5*a^-2*(1+x^2)^-1*(1+-2x)*exp(arccot(x)))
@test integrate((a+a*x^2)^-3*exp(arccot(x)), x) == :(-24//85*a^-3*exp(arccot(x))+-12//85*a^-3*(1+x^2)^-1*(1+-2x)*exp(arccot(x))+-1//17*a^-3*(1+x^2)^-2*(1+-4x)*exp(arccot(x)))
@test integrate((a+a*x^2)^-3//2*exp(arccot(x)), x) == :(-1//2*a^-1*(a+a*x^2)^-1//2*(1+-1x)*exp(arccot(x)))
@test integrate((a+a*x^2)^-5//2*exp(arccot(x)), x) == :(-3//10*a^-2*(a+a*x^2)^-1//2*(1+-1x)*exp(arccot(x))+-1//10*a^-1*(a+a*x^2)^-3//2*(1+-3x)*exp(arccot(x)))
@test integrate((a+a*x^2)^-7//2*exp(arccot(x)), x) == :(-3//13*a^-3*(a+a*x^2)^-1//2*(1+-1x)*exp(arccot(x))+-1//13*a^-2*(a+a*x^2)^-3//2*(1+-3x)*exp(arccot(x))+-1//26*a^-1*(a+a*x^2)^-5//2*(1+-5x)*exp(arccot(x)))
