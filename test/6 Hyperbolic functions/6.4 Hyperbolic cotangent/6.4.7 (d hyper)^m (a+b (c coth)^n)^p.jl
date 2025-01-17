using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*coth(c+d*x)^2)^5, x) == :(x*(a+b)^5+-1//9*b^5*d^-1*coth(c+d*x)^9+-1*b*d^-1*(b^4+5*a^4+5*a*b^3+10*b*a^3+10*a^2*b^2)*coth(c+d*x)+-1//3*b^2*d^-1*coth(c+d*x)^3*(b^3+10*a^3+5*a*b^2+10*b*a^2)+-1//5*b^3*d^-1*coth(c+d*x)^5*(b^2+10*a^2+5*a*b)+-1//7*b^4*d^-1*coth(c+d*x)^7*(b+5a))
@test integrate((a+b*coth(c+d*x)^2)^4, x) == :(x*(a+b)^4+-1//7*b^4*d^-1*coth(c+d*x)^7+-1//3*b^2*d^-1*coth(c+d*x)^3*(b^2+6*a^2+4*a*b)+-1//5*b^3*d^-1*coth(c+d*x)^5*(b+4a)+-1*b*d^-1*(b+2a)*(b^2+2*a^2+2*a*b)*coth(c+d*x))
@test integrate((a+b*coth(c+d*x)^2)^3, x) == :(x*(a+b)^3+-1//5*b^3*d^-1*coth(c+d*x)^5+-1*b*d^-1*(b^2+3*a^2+3*a*b)*coth(c+d*x)+-1//3*b^2*d^-1*coth(c+d*x)^3*(b+3a))
@test integrate((a+b*coth(c+d*x)^2)^2, x) == :(x*(a+b)^2+-1//3*b^2*d^-1*coth(c+d*x)^3+-1*b*d^-1*(b+2a)*coth(c+d*x))
@test integrate((a+b*coth(c+d*x)^2)^-1, x) == :(x*(a+b)^-1+-1*a^-1//2*b^(1/2)*d^-1*(a+b)^-1*arctan(a^(1/2)*b^-1//2*tanh(c+d*x)))
@test integrate((a+b*coth(c+d*x)^2)^-2, x) == :(x*(a+b)^-2+(1/2)*b*a^-1*d^-1*(a+b)^-1*(a+b*coth(c+d*x)^2)^-1*coth(c+d*x)+-1//2*a^-3//2*b^(1/2)*d^-1*(a+b)^-2*(b+3a)*arctan(a^(1/2)*b^-1//2*tanh(c+d*x)))
@test integrate((a+b*coth(c+d*x)^2)^-3, x) == :(x*(a+b)^-3+-1//8*a^-5//2*b^(1/2)*d^-1*(a+b)^-3*(3*b^2+15*a^2+10*a*b)*arctan(a^(1/2)*b^-1//2*tanh(c+d*x))+1//4*b*a^-1*d^-1*(a+b)^-1*(a+b*coth(c+d*x)^2)^-2*coth(c+d*x)+1//8*b*a^-2*d^-1*(a+b)^-2*(a+b*coth(c+d*x)^2)^-1*(3b+7a)*coth(c+d*x))
@test integrate((a+b*coth(c+d*x)^2)^-4, x) == :(x*(a+b)^-4+-1//16*a^-7//2*b^(1/2)*d^-1*(a+b)^-4*(5*b^3+35*a^3+21*a*b^2+35*b*a^2)*arctan(a^(1/2)*b^-1//2*tanh(c+d*x))+1//6*b*a^-1*d^-1*(a+b)^-1*(a+b*coth(c+d*x)^2)^-3*coth(c+d*x)+1//16*b*a^-3*d^-1*(a+b)^-3*(a+b*coth(c+d*x)^2)^-1*(5*b^2+19*a^2+16*a*b)*coth(c+d*x)+1//24*b*a^-2*d^-1*(a+b)^-2*(a+b*coth(c+d*x)^2)^-2*(5b+11a)*coth(c+d*x))
@test integrate((1+-2*coth(x)^2)^-1, x) == :(-1x+2^(1/2)*arctanh((1/2)*2^(1/2)*tanh(x)))
@test integrate((1+-1*coth(x)^2)^(1/2), x) == :(arcsin(coth(x)))
@test integrate((-1+coth(x)^2)^(1/2), x) == :(-1*arctanh((csch(x)^2)^-1//2*coth(x)))
@test integrate((1+-1*coth(x)^2)^3//2, x) == :((1/2)*arcsin(coth(x))+(1/2)*(-1*csch(x)^2)^(1/2)*coth(x))
@test integrate((-1+coth(x)^2)^3//2, x) == :((1/2)*arctanh((csch(x)^2)^-1//2*coth(x))+-1//2*(csch(x)^2)^(1/2)*coth(x))
@test integrate((1+-1*coth(x)^2)^-1//2, x) == :((-1*csch(x)^2)^-1//2*coth(x))
@test integrate((-1+coth(x)^2)^-1//2, x) == :((csch(x)^2)^-1//2*coth(x))
@test integrate((a+b*coth(x)^2)^(1/2)*coth(x)^3, x) == :(-1*(a+b*coth(x)^2)^(1/2)+(a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1//3*b^-1*(a+b*coth(x)^2)^3//2)
@test integrate((a+b*coth(x)^2)^(1/2)*coth(x)^2, x) == :((a+b)^(1/2)*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1//2*(a+b*coth(x)^2)^(1/2)*coth(x)+-1//2*b^-1//2*(a+2b)*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^(1/2)*coth(x), x) == :(-1*(a+b*coth(x)^2)^(1/2)+(a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2)))
@test integrate((a+b*coth(x)^2)^(1/2), x) == :((a+b)^(1/2)*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*b^(1/2)*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^(1/2)*tanh(x), x) == :((a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*a^(1/2)*arctanh(a^-1//2*(a+b*coth(x)^2)^(1/2)))
@test integrate((a+b*coth(x)^2)^(1/2)*tanh(x)^2, x) == :((a+b)^(1/2)*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*(a+b*coth(x)^2)^(1/2)*tanh(x))
@test integrate((a+b*coth(x)^2)^3//2*coth(x)^3, x) == :(-1//3*(a+b*coth(x)^2)^3//2+(a+b)^3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*(a+b*coth(x)^2)^(1/2)*(a+b)+-1//5*b^-1*(a+b*coth(x)^2)^5//2)
@test integrate((a+b*coth(x)^2)^3//2*coth(x)^2, x) == :((a+b)^3//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*(a+b*coth(x)^2)^(1/2)*((1/2)*b+5//8*a)*coth(x)+-1//4*b*(a+b*coth(x)^2)^(1/2)*coth(x)^3+-1//8*b^-1//2*(3*a^2+8*b^2+12*a*b)*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^3//2*coth(x), x) == :(-1//3*(a+b*coth(x)^2)^3//2+(a+b)^3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*(a+b*coth(x)^2)^(1/2)*(a+b))
@test integrate((a+b*coth(x)^2)^3//2, x) == :((a+b)^3//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1//2*b*(a+b*coth(x)^2)^(1/2)*coth(x)+-1//2*b^(1/2)*(2b+3a)*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^3//2*tanh(x), x) == :((a+b)^3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*b*(a+b*coth(x)^2)^(1/2)+-1*a^3//2*arctanh(a^-1//2*(a+b*coth(x)^2)^(1/2)))
@test integrate((a+b*coth(x)^2)^3//2*tanh(x)^2, x) == :((a+b)^3//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*b^3//2*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*a*(a+b*coth(x)^2)^(1/2)*tanh(x))
@test integrate((1+coth(x)^2)^(1/2), x) == :(-1*arcsinh(coth(x))+2^(1/2)*arctanh(2^(1/2)*(1+coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+-1*coth(x)^2)^(1/2), x) == :(-1*2^(1/2)*arctan(2^(1/2)*(-1+-1*coth(x)^2)^-1//2*coth(x))+arctan((-1+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((1+coth(x)^2)^3//2, x) == :(-5//2*arcsinh(coth(x))+2*2^(1/2)*arctanh(2^(1/2)*(1+coth(x)^2)^-1//2*coth(x))+-1//2*(1+coth(x)^2)^(1/2)*coth(x))
@test integrate((-1+-1*coth(x)^2)^3//2, x) == :(-5//2*arctan((-1+-1*coth(x)^2)^-1//2*coth(x))+(1/2)*(-1+-1*coth(x)^2)^(1/2)*coth(x)+2*2^(1/2)*arctan(2^(1/2)*(-1+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^-1//2*coth(x)^3, x) == :((a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*b^-1*(a+b*coth(x)^2)^(1/2))
@test integrate((a+b*coth(x)^2)^-1//2*coth(x)^2, x) == :((a+b)^-1//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*b^-1//2*arctanh(b^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^-1//2*coth(x), x) == :((a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2)))
@test integrate((a+b*coth(x)^2)^-1//2, x) == :((a+b)^-1//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x)))
@test integrate((a+b*coth(x)^2)^-1//2*tanh(x), x) == :((a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*a^-1//2*arctanh(a^-1//2*(a+b*coth(x)^2)^(1/2)))
@test integrate((a+b*coth(x)^2)^-1//2*tanh(x)^2, x) == :((a+b)^-1//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*a^-1*(a+b*coth(x)^2)^(1/2)*tanh(x))
@test integrate((a+b*coth(x)^2)^-3//2*coth(x)^3, x) == :((a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+a*b^-1*(a+b)^-1*(a+b*coth(x)^2)^-1//2)
@test integrate((a+b*coth(x)^2)^-3//2*coth(x)^2, x) == :((a+b)^-3//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*(a+b)^-1*(a+b*coth(x)^2)^-1//2*coth(x))
@test integrate((a+b*coth(x)^2)^-3//2*coth(x), x) == :((a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*(a+b)^-1*(a+b*coth(x)^2)^-1//2)
@test integrate((a+b*coth(x)^2)^-3//2*tanh(x), x) == :((a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*a^-3//2*arctanh(a^-1//2*(a+b*coth(x)^2)^(1/2))+b*a^-1*(a+b)^-1*(a+b*coth(x)^2)^-1//2)
@test integrate((a+b*coth(x)^2)^-3//2*tanh(x)^2, x) == :((a+b)^-3//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+b*a^-1*(a+b)^-1*(a+b*coth(x)^2)^-1//2*tanh(x)+-1*a^-2*(a+b)^-1*(a+b*coth(x)^2)^(1/2)*(a+2b)*tanh(x))
@test integrate((a+b*coth(x)^2)^-5//2*coth(x)^3, x) == :((a+b)^-5//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*(a+b)^-2*(a+b*coth(x)^2)^-1//2+1//3*a*b^-1*(a+b)^-1*(a+b*coth(x)^2)^-3//2)
@test integrate((a+b*coth(x)^2)^-5//2*coth(x)^2, x) == :((a+b)^-5//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+-1*(a+b*coth(x)^2)^-3//2*(3a+3b)^-1*coth(x)+-1//3*a^-1*(a+b)^-2*(a+b*coth(x)^2)^-1//2*(-1b+2a)*coth(x))
@test integrate((a+b*coth(x)^2)^-5//2*coth(x), x) == :((a+b)^-5//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*(a+b)^-2*(a+b*coth(x)^2)^-1//2+-1*(a+b*coth(x)^2)^-3//2*(3a+3b)^-1)
@test integrate((a+b*coth(x)^2)^-5//2*tanh(x), x) == :((a+b)^-5//2*arctanh((a+b)^-1//2*(a+b*coth(x)^2)^(1/2))+-1*a^-5//2*arctanh(a^-1//2*(a+b*coth(x)^2)^(1/2))+1//3*b*a^-1*(a+b)^-1*(a+b*coth(x)^2)^-3//2+b*a^-2*(a+b)^-2*(a+b*coth(x)^2)^-1//2*(b+2a))
@test integrate((a+b*coth(x)^2)^-5//2*tanh(x)^2, x) == :((a+b)^-5//2*arctanh((a+b)^(1/2)*(a+b*coth(x)^2)^-1//2*coth(x))+1//3*b*a^-1*(a+b)^-1*(a+b*coth(x)^2)^-3//2*tanh(x)+-1//3*a^-3*(a+b)^-2*(a+b*coth(x)^2)^(1/2)*(a+4b)*(2b+3a)*tanh(x)+1//3*b*a^-2*(a+b)^-2*(a+b*coth(x)^2)^-1//2*(4b+7a)*tanh(x))
@test integrate((1+coth(x)^2)^-1//2, x) == :((1/2)*2^(1/2)*arctanh(2^(1/2)*(1+coth(x)^2)^-1//2*coth(x)))
@test integrate((-1+-1*coth(x)^2)^-1//2, x) == :((1/2)*2^(1/2)*arctan(2^(1/2)*(-1+-1*coth(x)^2)^-1//2*coth(x)))
@test integrate((1+coth(x)^3)^-1, x) == :((1/2)*x+-1*(6+6*coth(x))^-1+-2//9*3^(1/2)*arctan(1//3*3^(1/2)*(1+-2*coth(x))))
@test integrate((a+b*coth(x)^4)^(1/2)*coth(x), x) == :(-1//2*(a+b*coth(x)^4)^(1/2)+(1/2)*(a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*coth(x)^4)^-1//2*(a+b*coth(x)^2))+-1//2*b^(1/2)*arctanh(b^(1/2)*(a+b*coth(x)^4)^-1//2*coth(x)^2))
@test integrate((a+b*coth(x)^4)^-1//2*coth(x), x) == :((1/2)*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*coth(x)^4)^-1//2*(a+b*coth(x)^2)))
@test integrate((a+b*coth(x)^4)^-3//2*coth(x), x) == :((1/2)*(a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*coth(x)^4)^-1//2*(a+b*coth(x)^2))+-1//2*a^-1*(a+b)^-1*(a+b*coth(x)^4)^-1//2*(a+-1*b*coth(x)^2))
