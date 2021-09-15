using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*csch(c+d*x)^2)^4, x) == :(x*a^4+-1//7*b^4*d^-1*coth(c+d*x)^7+-1//3*b^2*d^-1*coth(c+d*x)^3*(3*b^2+6*a^2+-8*a*b)+-1//5*b^3*d^-1*coth(c+d*x)^5*(-3b+4a)+-1*b*d^-1*(-1b+2a)*(b^2+2*a^2+-2*a*b)*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^3, x) == :(x*a^3+-1//5*b^3*d^-1*coth(c+d*x)^5+-1*b*d^-1*(b^2+3*a^2+-3*a*b)*coth(c+d*x)+-1//3*b^2*d^-1*coth(c+d*x)^3*(-2b+3a))
@test integrate((a+b*csch(c+d*x)^2)^2, x) == :(x*a^2+-1//3*b^2*d^-1*coth(c+d*x)^3+-1*b*d^-1*(-1b+2a)*coth(c+d*x))
@test integrate(a+b*csch(c+d*x)^2, x) == :(a*x+-1*b*d^-1*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^-1, x) == :(x*a^-1+-1*a^-1*b^(1/2)*d^-1*(a+-1b)^-1//2*arctan(b^-1//2*(a+-1b)^(1/2)*tanh(c+d*x)))
@test integrate((a+b*csch(c+d*x)^2)^-2, x) == :(x*a^-2+(1/2)*b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-1*coth(c+d*x)+-1//2*a^-2*b^(1/2)*d^-1*(a+-1b)^-3//2*(-2b+3a)*arctan(b^-1//2*(a+-1b)^(1/2)*tanh(c+d*x)))
@test integrate((a+b*csch(c+d*x)^2)^-3, x) == :(x*a^-3+-1//8*a^-3*b^(1/2)*d^-1*(a+-1b)^-5//2*(8*b^2+15*a^2+-20*a*b)*arctan(b^-1//2*(a+-1b)^(1/2)*tanh(c+d*x))+1//4*b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-2*coth(c+d*x)+1//8*b*a^-2*d^-1*(a+-1b)^-2*(a+-1b+b*coth(c+d*x)^2)^-1*(-4b+7a)*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^-4, x) == :(x*a^-4+-1//16*a^-4*b^(1/2)*d^-1*(a+-1b)^-7//2*(-16*b^3+35*a^3+-70*b*a^2+56*a*b^2)*arctan(b^-1//2*(a+-1b)^(1/2)*tanh(c+d*x))+1//6*b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-3*coth(c+d*x)+1//16*b*a^-3*d^-1*(a+-1b)^-3*(a+-1b+b*coth(c+d*x)^2)^-1*(8*b^2+19*a^2+-22*a*b)*coth(c+d*x)+1//24*b*a^-2*d^-1*(a+-1b)^-2*(a+-1b+b*coth(c+d*x)^2)^-2*(-6b+11a)*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^5//2, x) == :(a^5//2*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+-1//4*b*d^-1*(a+-1b+b*coth(c+d*x)^2)^3//2*coth(c+d*x)+-1//8*b^(1/2)*d^-1*(3*b^2+15*a^2+-10*a*b)*arctanh(b^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+-1//8*b*d^-1*(a+-1b+b*coth(c+d*x)^2)^(1/2)*(-3b+7a)*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^3//2, x) == :(a^3//2*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+-1//2*b*d^-1*(a+-1b+b*coth(c+d*x)^2)^(1/2)*coth(c+d*x)+-1//2*b^(1/2)*d^-1*(-1b+3a)*arctanh(b^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x)))
@test integrate((a+b*csch(c+d*x)^2)^(1/2), x) == :(a^(1/2)*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+-1*b^(1/2)*d^-1*arctanh(b^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x)))
@test integrate((a+b*csch(c+d*x)^2)^-3//2, x) == :(a^-3//2*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^-5//2, x) == :(a^-5//2*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+1//3*b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-3//2*coth(c+d*x)+1//3*b*a^-2*d^-1*(a+-1b)^-2*(a+-1b+b*coth(c+d*x)^2)^-1//2*(-3b+5a)*coth(c+d*x))
@test integrate((a+b*csch(c+d*x)^2)^-7//2, x) == :(a^-7//2*d^-1*arctanh(a^(1/2)*(a+-1b+b*coth(c+d*x)^2)^-1//2*coth(c+d*x))+1//5*b*a^-1*d^-1*(a+-1b)^-1*(a+-1b+b*coth(c+d*x)^2)^-5//2*coth(c+d*x)+1//15*b*a^-3*d^-1*(a+-1b)^-3*(a+-1b+b*coth(c+d*x)^2)^-1//2*(15*b^2+33*a^2+-40*a*b)*coth(c+d*x)+1//15*b*a^-2*d^-1*(a+-1b)^-2*(a+-1b+b*coth(c+d*x)^2)^-3//2*(-5b+9a)*coth(c+d*x))
@test integrate((1+csch(x)^2)^3//2, x) == :(-1//2*(coth(x)^2)^3//2*tanh(x)+(coth(x)^2)^(1/2)*log(sinh(x))*tanh(x))
@test integrate((1+csch(x)^2)^(1/2), x) == :((coth(x)^2)^(1/2)*log(sinh(x))*tanh(x))
@test integrate((1+csch(x)^2)^-1//2, x) == :((coth(x)^2)^-1//2*coth(x)*log(cosh(x)))
@test integrate((1+-1*csch(x)^2)^3//2, x) == :(2*arcsin((1/2)*2^(1/2)*coth(x))+(1/2)*(2+-1*coth(x)^2)^(1/2)*coth(x)+arctanh((2+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((1+-1*csch(x)^2)^(1/2), x) == :(arcsin((1/2)*2^(1/2)*coth(x))+arctanh((2+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((1+-1*csch(x)^2)^-1//2, x) == :(arctanh((2+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+csch(x)^2)^3//2, x) == :(2*arctanh((-2+coth(x)^2)^-1//2*coth(x))+-1//2*(-2+coth(x)^2)^(1/2)*coth(x)+arctan((-2+coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+csch(x)^2)^(1/2), x) == :(-1*arctan((-2+coth(x)^2)^-1//2*coth(x))+-1*arctanh((-2+coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+csch(x)^2)^-1//2, x) == :(arctan((-2+coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+-1*csch(x)^2)^3//2, x) == :((1/2)*(-1*coth(x)^2)^(1/2)*coth(x)+-1*(-1*coth(x)^2)^(1/2)*log(sinh(x))*tanh(x))
@test integrate((-1+-1*csch(x)^2)^(1/2), x) == :((-1*coth(x)^2)^(1/2)*log(sinh(x))*tanh(x))
@test integrate((-1+-1*csch(x)^2)^-1//2, x) == :((-1*coth(x)^2)^-1//2*coth(x)*log(cosh(x)))
