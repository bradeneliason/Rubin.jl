using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((b*tan(c+d*x))^-1//2*(A+C*cot(c+d*x)^2), x) == :(-2//3*C*b*d^-1*(b*tan(c+d*x))^-3//2+(1/2)*2^(1/2)*b^-1//2*d^-1*(A+-1C)*arctan(1+2^(1/2)*b^-1//2*(b*tan(c+d*x))^(1/2))+-1//2*2^(1/2)*b^-1//2*d^-1*(A+-1C)*arctan(1+-1*2^(1/2)*b^-1//2*(b*tan(c+d*x))^(1/2))+-1//4*2^(1/2)*b^-1//2*d^-1*(A+-1C)*log(b^(1/2)+b^(1/2)*tan(c+d*x)+-1*2^(1/2)*(b*tan(c+d*x))^(1/2))+1//4*2^(1/2)*b^-1//2*d^-1*(A+-1C)*log(b^(1/2)+2^(1/2)*(b*tan(c+d*x))^(1/2)+b^(1/2)*tan(c+d*x)))
@test integrate(a+b*cot(c+d*x)^2, x) == :(a*x+-1*b*x+-1*b*d^-1*cot(c+d*x))
@test integrate((a+b*cot(c+d*x)^2)^2, x) == :(x*(a+-1b)^2+-1//3*b^2*d^-1*cot(c+d*x)^3+-1*b*d^-1*(-1b+2a)*cot(c+d*x))
@test integrate((a+b*cot(c+d*x)^2)^3, x) == :(x*(a+-1b)^3+-1//5*b^3*d^-1*cot(c+d*x)^5+-1*b*d^-1*(b^2+3*a^2+-3*a*b)*cot(c+d*x)+-1//3*b^2*d^-1*cot(c+d*x)^3*(-1b+3a))
@test integrate((a+b*cot(c+d*x)^2)^-1, x) == :(x*(a+-1b)^-1+a^-1//2*b^(1/2)*d^-1*(a+-1b)^-1*arctan(a^-1//2*b^(1/2)*cot(c+d*x)))
@test integrate((a+b*cot(c+d*x)^2)^-2, x) == :(x*(a+-1b)^-2+(1/2)*b*a^-1*d^-1*(a+-1b)^-1*(a+b*cot(c+d*x)^2)^-1*cot(c+d*x)+(1/2)*a^-3//2*b^(1/2)*d^-1*(a+-1b)^-2*(-1b+3a)*arctan(a^-1//2*b^(1/2)*cot(c+d*x)))
@test integrate((a+b*cot(c+d*x)^2)^-3, x) == :(x*(a+-1b)^-3+1//4*b*a^-1*d^-1*(a+-1b)^-1*(a+b*cot(c+d*x)^2)^-2*cot(c+d*x)+1//8*a^-5//2*b^(1/2)*d^-1*(a+-1b)^-3*(3*b^2+15*a^2+-10*a*b)*arctan(a^-1//2*b^(1/2)*cot(c+d*x))+1//8*b*a^-2*d^-1*(a+-1b)^-2*(a+b*cot(c+d*x)^2)^-1*(-3b+7a)*cot(c+d*x))
@test integrate((1+cot(x)^2)^3//2, x) == :(-1//2*arcsinh(cot(x))+-1//2*(csc(x)^2)^(1/2)*cot(x))
@test integrate((1+cot(x)^2)^(1/2), x) == :(-1*arcsinh(cot(x)))
@test integrate((1+cot(x)^2)^-1//2, x) == :(-1*(csc(x)^2)^-1//2*cot(x))
@test integrate((-1+-1*cot(x)^2)^3//2, x) == :(-1//2*arctan((-1*csc(x)^2)^-1//2*cot(x))+(1/2)*(-1*csc(x)^2)^(1/2)*cot(x))
@test integrate((-1+-1*cot(x)^2)^(1/2), x) == :(arctan((-1*csc(x)^2)^-1//2*cot(x)))
@test integrate((-1+-1*cot(x)^2)^-1//2, x) == :(-1*(-1*csc(x)^2)^-1//2*cot(x))
@test integrate((a+a*cot(x)^2)^-1//2*cot(x)^3, x) == :(-1*(a*csc(x)^2)^-1//2+-1*a^-1*(a*csc(x)^2)^(1/2))
@test integrate((a+a*cot(x)^2)^-1//2*cot(x)^2, x) == :((a*csc(x)^2)^-1//2*cot(x)+-1*(a*csc(x)^2)^-1//2*arctanh(cos(x))*csc(x))
@test integrate((a+a*cot(x)^2)^-1//2*cot(x), x) == :((a*csc(x)^2)^-1//2)
@test integrate((a+a*cot(x)^2)^-1//2*tan(x), x) == :(-1*(a*csc(x)^2)^-1//2+a^-1//2*arctanh(a^-1//2*(a*csc(x)^2)^(1/2)))
@test integrate((a+a*cot(x)^2)^-1//2*tan(x)^2, x) == :((a*csc(x)^2)^-1//2*cot(x)+(a*csc(x)^2)^-1//2*csc(x)*sec(x))
@test integrate((a+b*cot(x)^2)^(1/2)*cot(x)^3, x) == :((a+b*cot(x)^2)^(1/2)+-1*(a+-1b)^(1/2)*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+-1//3*b^-1*(a+b*cot(x)^2)^3//2)
@test integrate((a+b*cot(x)^2)^(1/2)*cot(x), x) == :(-1*(a+b*cot(x)^2)^(1/2)+(a+-1b)^(1/2)*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^(1/2)*tan(x), x) == :(a^(1/2)*arctanh(a^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^(1/2)*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^(1/2)*cot(x)^2, x) == :((a+-1b)^(1/2)*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1//2*(a+b*cot(x)^2)^(1/2)*cot(x)+-1//2*b^-1//2*(a+-2b)*arctanh(b^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x)))
@test integrate((a+b*cot(x)^2)^(1/2), x) == :(-1*b^(1/2)*arctanh(b^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*(a+-1b)^(1/2)*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x)))
@test integrate((a+b*cot(x)^2)^(1/2)*tan(x)^2, x) == :((a+-1b)^(1/2)*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+(a+b*cot(x)^2)^(1/2)*tan(x))
@test integrate((a+b*cot(x)^2)^(1/2)*tan(x)^4, x) == :(-1*(a+-1b)^(1/2)*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+1//3*(a+b*cot(x)^2)^(1/2)*tan(x)^3+-1//3*a^-1*(a+b*cot(x)^2)^(1/2)*(-1b+3a)*tan(x))
@test integrate((a+b*cot(x)^2)^3//2*cot(x)^3, x) == :(1//3*(a+b*cot(x)^2)^3//2+(a+b*cot(x)^2)^(1/2)*(a+-1b)+-1*(a+-1b)^3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+-1//5*b^-1*(a+b*cot(x)^2)^5//2)
@test integrate((a+b*cot(x)^2)^3//2*cot(x)^2, x) == :((a+-1b)^3//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*(a+b*cot(x)^2)^(1/2)*(-1//2*b+5//8*a)*cot(x)+-1//4*b*(a+b*cot(x)^2)^(1/2)*cot(x)^3+-1//8*b^-1//2*(3*a^2+8*b^2+-12*a*b)*arctanh(b^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x)))
@test integrate((a+b*cot(x)^2)^3//2*cot(x), x) == :(-1//3*(a+b*cot(x)^2)^3//2+(a+-1b)^3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+b*cot(x)^2)^(1/2)*(a+-1b))
@test integrate((a+b*cot(x)^2)^3//2*tan(x), x) == :(a^3//2*arctanh(a^-1//2*(a+b*cot(x)^2)^(1/2))+-1*b*(a+b*cot(x)^2)^(1/2)+-1*(a+-1b)^3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^3//2*tan(x)^2, x) == :((a+-1b)^3//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*b^3//2*arctanh(b^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+a*(a+b*cot(x)^2)^(1/2)*tan(x))
@test integrate((a+b*cot(c+d*x)^2)^5//2, x) == :(-1*d^-1*(a+-1b)^5//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+-1//4*b*d^-1*(a+b*cot(c+d*x)^2)^3//2*cot(c+d*x)+-1//8*b^(1/2)*d^-1*(8*b^2+15*a^2+-20*a*b)*arctanh(b^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+-1//8*b*d^-1*(a+b*cot(c+d*x)^2)^(1/2)*(-4b+7a)*cot(c+d*x))
@test integrate((a+b*cot(c+d*x)^2)^3//2, x) == :(-1*d^-1*(a+-1b)^3//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+-1//2*b*d^-1*(a+b*cot(c+d*x)^2)^(1/2)*cot(c+d*x)+-1//2*b^(1/2)*d^-1*(-2b+3a)*arctanh(b^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x)))
@test integrate((a+b*cot(c+d*x)^2)^(1/2), x) == :(-1*b^(1/2)*d^-1*arctanh(b^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+-1*d^-1*(a+-1b)^(1/2)*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x)))
@test integrate((a+b*cot(c+d*x)^2)^-1//2, x) == :(-1*d^-1*(a+-1b)^-1//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x)))
@test integrate((a+b*cot(c+d*x)^2)^-3//2, x) == :(-1*d^-1*(a+-1b)^-3//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+b*a^-1*d^-1*(a+-1b)^-1*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))
@test integrate((a+b*cot(c+d*x)^2)^-5//2, x) == :(-1*d^-1*(a+-1b)^-5//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+1//3*b*a^-1*d^-1*(a+-1b)^-1*(a+b*cot(c+d*x)^2)^-3//2*cot(c+d*x)+1//3*b*a^-2*d^-1*(a+-1b)^-2*(a+b*cot(c+d*x)^2)^-1//2*(-2b+5a)*cot(c+d*x))
@test integrate((a+b*cot(c+d*x)^2)^-7//2, x) == :(-1*d^-1*(a+-1b)^-7//2*arctan((a+-1b)^(1/2)*(a+b*cot(c+d*x)^2)^-1//2*cot(c+d*x))+1//5*b*a^-1*d^-1*(a+-1b)^-1*(a+b*cot(c+d*x)^2)^-5//2*cot(c+d*x)+1//15*b*a^-3*d^-1*(a+-1b)^-3*(a+b*cot(c+d*x)^2)^-1//2*(8*b^2+33*a^2+-26*a*b)*cot(c+d*x)+1//15*b*a^-2*d^-1*(a+-1b)^-2*(a+b*cot(c+d*x)^2)^-3//2*(-4b+9a)*cot(c+d*x))
@test integrate((1+-1*cot(x)^2)^3//2, x) == :(5//2*arcsin(cot(x))+(1/2)*(1+-1*cot(x)^2)^(1/2)*cot(x)+-2*2^(1/2)*arctan(2^(1/2)*(1+-1*cot(x)^2)^-1//2*cot(x)))
@test integrate((1+-1*cot(x)^2)^(1/2), x) == :(-1*2^(1/2)*arctan(2^(1/2)*(1+-1*cot(x)^2)^-1//2*cot(x))+arcsin(cot(x)))
@test integrate((1+-1*cot(x)^2)^-1//2, x) == :(-1//2*2^(1/2)*arctan(2^(1/2)*(1+-1*cot(x)^2)^-1//2*cot(x)))
@test integrate((-1+cot(x)^2)^3//2, x) == :(5//2*arctanh((-1+cot(x)^2)^-1//2*cot(x))+-2*2^(1/2)*arctanh(2^(1/2)*(-1+cot(x)^2)^-1//2*cot(x))+-1//2*(-1+cot(x)^2)^(1/2)*cot(x))
@test integrate((-1+cot(x)^2)^(1/2), x) == :(-1*arctanh((-1+cot(x)^2)^-1//2*cot(x))+2^(1/2)*arctanh(2^(1/2)*(-1+cot(x)^2)^-1//2*cot(x)))
@test integrate((-1+cot(x)^2)^-1//2, x) == :(-1//2*2^(1/2)*arctanh(2^(1/2)*(-1+cot(x)^2)^-1//2*cot(x)))
@test integrate((a+b*cot(x)^2)^-1//2*cot(x)^3, x) == :(-1*b^-1*(a+b*cot(x)^2)^(1/2)+-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^-1//2*cot(x)^2, x) == :((a+-1b)^-1//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*b^-1//2*arctanh(b^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x)))
@test integrate((a+b*cot(x)^2)^-1//2*cot(x), x) == :((a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^-1//2*tan(x), x) == :(a^-1//2*arctanh(a^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2)))
@test integrate((a+b*cot(x)^2)^-1//2*tan(x)^2, x) == :((a+-1b)^-1//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+a^-1*(a+b*cot(x)^2)^(1/2)*tan(x))
@test integrate((a+b*cot(x)^2)^-3//2*cot(x)^3, x) == :(-1*(a+-1b)^-3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+a*b^-1*(a+-1b)^-1*(a+b*cot(x)^2)^-1//2)
@test integrate((a+b*cot(x)^2)^-3//2*cot(x)^2, x) == :((a+-1b)^-3//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*(a+-1b)^-1*(a+b*cot(x)^2)^-1//2*cot(x))
@test integrate((a+b*cot(x)^2)^-3//2*cot(x), x) == :((a+-1b)^-3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^-1*(a+b*cot(x)^2)^-1//2)
@test integrate((a+b*cot(x)^2)^-3//2*tan(x), x) == :(a^-3//2*arctanh(a^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^-3//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+b*a^-1*(a+-1b)^-1*(a+b*cot(x)^2)^-1//2)
@test integrate((a+b*cot(x)^2)^-3//2*tan(x)^2, x) == :((a+-1b)^-3//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+b*a^-1*(a+-1b)^-1*(a+b*cot(x)^2)^-1//2*tan(x)+a^-2*(a+-1b)^-1*(a+b*cot(x)^2)^(1/2)*(a+-2b)*tan(x))
@test integrate((a+b*cot(x)^2)^-5//2*cot(x)^3, x) == :((a+-1b)^-2*(a+b*cot(x)^2)^-1//2+-1*(a+-1b)^-5//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+a*b^-1*(a+b*cot(x)^2)^-3//2*(-3b+3a)^-1)
@test integrate((a+b*cot(x)^2)^-5//2*cot(x)^2, x) == :((a+-1b)^-5//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+-1*(a+b*cot(x)^2)^-3//2*(-3b+3a)^-1*cot(x)+-1//3*a^-1*(a+-1b)^-2*(a+b*cot(x)^2)^-1//2*(b+2a)*cot(x))
@test integrate((a+b*cot(x)^2)^-5//2*cot(x), x) == :((a+-1b)^-5//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^-2*(a+b*cot(x)^2)^-1//2+-1*(a+b*cot(x)^2)^-3//2*(-3b+3a)^-1)
@test integrate((a+b*cot(x)^2)^-5//2*tan(x), x) == :(a^-5//2*arctanh(a^-1//2*(a+b*cot(x)^2)^(1/2))+-1*(a+-1b)^-5//2*arctanh((a+-1b)^-1//2*(a+b*cot(x)^2)^(1/2))+1//3*b*a^-1*(a+-1b)^-1*(a+b*cot(x)^2)^-3//2+b*a^-2*(a+-1b)^-2*(a+b*cot(x)^2)^-1//2*(-1b+2a))
@test integrate((a+b*cot(x)^2)^-5//2*tan(x)^2, x) == :((a+-1b)^-5//2*arctan((a+-1b)^(1/2)*(a+b*cot(x)^2)^-1//2*cot(x))+1//3*b*a^-1*(a+-1b)^-1*(a+b*cot(x)^2)^-3//2*tan(x)+1//3*b*a^-2*(a+-1b)^-2*(a+b*cot(x)^2)^-1//2*(-4b+7a)*tan(x)+1//3*a^-3*(a+-1b)^-2*(a+b*cot(x)^2)^(1/2)*(a+-4b)*(-2b+3a)*tan(x))
@test integrate((1+cot(x)^3)^-1, x) == :((1/2)*x+(1/2)*log(sin(x))+-1//6*log(1+cot(x))+1//3*log(1+cot(x)^2+-1*cot(x)))
@test integrate((a+b*cot(x)^4)^(1/2)*cot(x), x) == :(-1//2*(a+b*cot(x)^4)^(1/2)+(1/2)*b^(1/2)*arctanh(b^(1/2)*(a+b*cot(x)^4)^-1//2*cot(x)^2)+(1/2)*(a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*cot(x)^4)^-1//2*(a+-1*b*cot(x)^2)))
@test integrate((a+b*cot(x)^4)^3//2*cot(x), x) == :(-1//6*(a+b*cot(x)^4)^3//2+(1/2)*(a+b)^3//2*arctanh((a+b)^-1//2*(a+b*cot(x)^4)^-1//2*(a+-1*b*cot(x)^2))+-1*(a+b*cot(x)^4)^(1/2)*((1/2)*a+(1/2)*b+-1//4*b*cot(x)^2)+1//4*b^(1/2)*(2b+3a)*arctanh(b^(1/2)*(a+b*cot(x)^4)^-1//2*cot(x)^2))
@test integrate((a+b*cot(x)^4)^-1//2*cot(x), x) == :((1/2)*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*cot(x)^4)^-1//2*(a+-1*b*cot(x)^2)))
@test integrate((a+b*cot(x)^4)^-3//2*cot(x), x) == :((1/2)*(a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*cot(x)^4)^-1//2*(a+-1*b*cot(x)^2))+-1//2*a^-1*(a+b)^-1*(a+b*cot(x)^4)^-1//2*(a+b*cot(x)^2))
@test integrate((a+b*cot(x)^4)^-5//2*cot(x), x) == :((1/2)*(a+b)^-5//2*arctanh((a+b)^-1//2*(a+b*cot(x)^4)^-1//2*(a+-1*b*cot(x)^2))+-1//6*a^-1*(a+b)^-1*(a+b*cot(x)^4)^-3//2*(a+b*cot(x)^2)+-1//6*a^-2*(a+b)^-2*(a+b*cot(x)^4)^-1//2*(3*a^2+b*cot(x)^2*(2b+5a)))