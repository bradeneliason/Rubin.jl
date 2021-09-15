using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((c+d*x)^3*sech(a+b*x), x) == :(2*b^-1*(c+d*x)^3*arctan(exp(a+b*x))+-6*im*b^-4*d^3*Polylogarithms.polylog(4,-1*im*exp(a+b*x))+6*im*b^-4*d^3*Polylogarithms.polylog(4,im*exp(a+b*x))+-6*im*b^-3*d^2*(c+d*x)*Polylogarithms.polylog(3,im*exp(a+b*x))+-3*im*d*b^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(a+b*x))+3*im*d*b^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(a+b*x))+6*im*b^-3*d^2*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(a+b*x)))
@test integrate((c+d*x)^2*sech(a+b*x), x) == :(2*b^-1*(c+d*x)^2*arctan(exp(a+b*x))+-2*im*b^-3*d^2*Polylogarithms.polylog(3,im*exp(a+b*x))+2*im*b^-3*d^2*Polylogarithms.polylog(3,-1*im*exp(a+b*x))+-2*im*d*b^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(a+b*x))+2*im*d*b^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(a+b*x)))
@test integrate((c+d*x)*sech(a+b*x), x) == :(b^-1*(2c+2*d*x)*arctan(exp(a+b*x))+im*d*b^-2*Polylogarithms.polylog(2,im*exp(a+b*x))+-1*im*d*b^-2*Polylogarithms.polylog(2,-1*im*exp(a+b*x)))
@test integrate((c+d*x)^3*sech(a+b*x)^2, x) == :(b^-1*(c+d*x)^3+b^-1*(c+d*x)^3*tanh(a+b*x)+3//2*b^-4*d^3*Polylogarithms.polylog(3,-1*exp(2a+2*b*x))+-3*d*b^-2*(c+d*x)^2*log(1+exp(2a+2*b*x))+-3*b^-3*d^2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2a+2*b*x)))
@test integrate((c+d*x)^2*sech(a+b*x)^2, x) == :(b^-1*(c+d*x)^2+b^-1*(c+d*x)^2*tanh(a+b*x)+-1*b^-3*d^2*Polylogarithms.polylog(2,-1*exp(2a+2*b*x))+-2*d*b^-2*(c+d*x)*log(1+exp(2a+2*b*x)))
@test integrate(sech(a+b*x)^2*(c+d*x), x) == :(b^-1*(c+d*x)*tanh(a+b*x)+-1*d*b^-2*log(cosh(a+b*x)))
@test integrate((c+d*x)^3*sech(a+b*x)^3, x) == :(b^-1*(c+d*x)^3*arctan(exp(a+b*x))+(1/2)*b^-1*(c+d*x)^3*sech(a+b*x)*tanh(a+b*x)+-6*b^-3*d^2*(c+d*x)*arctan(exp(a+b*x))+-3*im*b^-4*d^3*Polylogarithms.polylog(2,im*exp(a+b*x))+-3*im*b^-4*d^3*Polylogarithms.polylog(4,-1*im*exp(a+b*x))+3*im*b^-4*d^3*Polylogarithms.polylog(2,-1*im*exp(a+b*x))+3*im*b^-4*d^3*Polylogarithms.polylog(4,im*exp(a+b*x))+3//2*d*b^-2*(c+d*x)^2*sech(a+b*x)+-3*im*b^-3*d^2*(c+d*x)*Polylogarithms.polylog(3,im*exp(a+b*x))+3*im*b^-3*d^2*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(a+b*x))+-3//2*im*d*b^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(a+b*x))+3//2*im*d*b^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(a+b*x)))
@test integrate((c+d*x)^2*sech(a+b*x)^3, x) == :(b^-1*(c+d*x)^2*arctan(exp(a+b*x))+-1*b^-3*d^2*arctan(sinh(a+b*x))+im*b^-3*d^2*Polylogarithms.polylog(3,-1*im*exp(a+b*x))+d*b^-2*(c+d*x)*sech(a+b*x)+(1/2)*b^-1*(c+d*x)^2*sech(a+b*x)*tanh(a+b*x)+-1*im*b^-3*d^2*Polylogarithms.polylog(3,im*exp(a+b*x))+im*d*b^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(a+b*x))+-1*im*d*b^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(a+b*x)))
@test integrate(sech(a+b*x)^3*(c+d*x), x) == :(b^-1*(c+d*x)*arctan(exp(a+b*x))+(1/2)*d*b^-2*sech(a+b*x)+(1/2)*im*d*b^-2*Polylogarithms.polylog(2,im*exp(a+b*x))+(1/2)*b^-1*(c+d*x)*sech(a+b*x)*tanh(a+b*x)+-1//2*im*d*b^-2*Polylogarithms.polylog(2,-1*im*exp(a+b*x)))
@test integrate(x*sech(x)^-3//2+-1//3*x*sech(x)^(1/2), x) == :(-4//9*sech(x)^-3//2+2//3*x*sech(x)^-1//2*sinh(x))
@test integrate(x*sech(x)^-5//2+-3//5*x*sech(x)^-1//2, x) == :(-4//25*sech(x)^-5//2+2//5*x*sech(x)^-3//2*sinh(x))
@test integrate(x*sech(x)^-7//2+-5//21*x*sech(x)^(1/2), x) == :(-20//63*sech(x)^-3//2+-4//49*sech(x)^-7//2+2//7*x*sech(x)^-5//2*sinh(x)+10//21*x*sech(x)^-1//2*sinh(x))
@test integrate(x^2*sech(x)^-3//2+-1//3*x^2*sech(x)^(1/2), x) == :(-8//9*x*sech(x)^-3//2+16//27*sech(x)^-1//2*sinh(x)+2//3*x^2*sech(x)^-1//2*sinh(x)+-16//27*im*cosh(x)^(1/2)*sech(x)^(1/2)*Elliptic.F((1/2)*im*x,2))
