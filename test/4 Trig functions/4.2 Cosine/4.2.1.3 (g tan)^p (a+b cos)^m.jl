using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+a*cos(x))^-1*tan(x)^4, x) == :((1/2)*a^-1*arctanh(sin(x))+1//3*a^-1*tan(x)^3+-1//2*a^-1*sec(x)*tan(x))
@test integrate((a+a*cos(x))^-1*tan(x)^3, x) == :((1/2)*a^-1*sec(x)^2+-1*a^-1*sec(x))
@test integrate((a+a*cos(x))^-1*tan(x)^2, x) == :(a^-1*tan(x)+-1*a^-1*arctanh(sin(x)))
@test integrate((a+a*cos(x))^-1*tan(x), x) == :(a^-1*log(1+cos(x))+-1*a^-1*log(cos(x)))
@test integrate((a+a*cos(x))^-1*cot(x), x) == :(-1//2*a^-1*csc(x)^2+-1//2*a^-1*arctanh(cos(x))+(1/2)*a^-1*cot(x)*csc(x))
@test integrate((a+a*cos(x))^-1*cot(x)^2, x) == :(-1*a^-1*csc(x)+-1//3*a^-1*cot(x)^3+1//3*a^-1*csc(x)^3)
@test integrate((a+a*cos(x))^-1*cot(x)^3, x) == :(-1//4*a^-1*cot(x)^4+3//8*a^-1*arctanh(cos(x))+-3//8*a^-1*cot(x)*csc(x)+1//4*a^-1*cot(x)^3*csc(x))
@test integrate((a+a*cos(x))^-1*cot(x)^4, x) == :(a^-1*csc(x)+-2//3*a^-1*csc(x)^3+-1//5*a^-1*cot(x)^5+1//5*a^-1*csc(x)^5)
@test integrate((1+cos(3x))^-2*tan(3x), x) == :(-1*(3+3*cos(3x))^-1+-1//3*log(cos(3x))+1//3*log(1+cos(3x)))
@test integrate((a+b*cos(x))^-1*tan(x)^4, x) == :(-1//3*a^-3*(-3*b^2+4*a^2)*tan(x)+1//3*a^-1*sec(x)^2*tan(x)+(1/2)*b*a^-4*(-2*b^2+3*a^2)*arctanh(sin(x))+2*a^-4*(a+b)^3//2*(a+-1b)^3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tan((1/2)*x))+-1//2*b*a^-2*sec(x)*tan(x))
@test integrate((a+b*cos(x))^-1*tan(x)^3, x) == :((1/2)*a^-1*sec(x)^2+a^-3*(a^2+-1*b^2)*log(cos(x))+-1*b*a^-2*sec(x)+-1*a^-3*(a^2+-1*b^2)*log(a+b*cos(x)))
@test integrate((a+b*cos(x))^-1*tan(x)^2, x) == :(a^-1*tan(x)+-1*b*a^-2*arctanh(sin(x))+-2*a^-2*(a+b)^(1/2)*(a+-1b)^(1/2)*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tan((1/2)*x)))
@test integrate((a+b*cos(x))^-1*tan(x), x) == :(a^-1*log(a+b*cos(x))+-1*a^-1*log(cos(x)))
@test integrate((a+b*cos(x))^-1*cot(x), x) == :((-2b+2a)^-1*log(1+cos(x))+(2a+2b)^-1*log(1+-1*cos(x))+-1*a*(a^2+-1*b^2)^-1*log(a+b*cos(x)))
@test integrate((a+b*cos(x))^-1*cot(x)^2, x) == :(b*(a^2+-1*b^2)^-1*csc(x)+-1*a*(a^2+-1*b^2)^-1*cot(x)+-2*a^2*(a+b)^-3//2*(a+-1b)^-3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tan((1/2)*x)))
@test integrate((a+b*cos(x))^-1*cot(x)^3, x) == :(a^3*(a^2+-1*b^2)^-2*log(a+b*cos(x))+-1*(-2*b^2+2*a^2)^-1*csc(x)^2*(a+-1*b*cos(x))+-1//4*(a+b)^-2*(b+2a)*log(1+-1*cos(x))+-1//4*(a+-1b)^-2*(-1b+2a)*log(1+cos(x)))
@test integrate((a+b*cos(x))^-1*cot(x)^4, x) == :(b*(-3*b^2+3*a^2)^-1*csc(x)^3+a^3*(a^2+-1*b^2)^-2*cot(x)+-1*a*(-3*b^2+3*a^2)^-1*cot(x)^3+-1*b*(a^2+-1*b^2)^-1*csc(x)+-1*b*a^2*(a^2+-1*b^2)^-2*csc(x)+2*a^4*(a+b)^-5//2*(a+-1b)^-5//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tan((1/2)*x)))
@test integrate((3+-1*cos(x))^-1//2*cot(x), x) == :(-1//2*arctanh((1/2)*(3+-1*cos(x))^(1/2))+-1//2*2^(1/2)*arctanh((1/2)*2^(1/2)*(3+-1*cos(x))^(1/2)))
@test integrate((a+b*cos(x))^(1/2)*tan(x), x) == :(-2*(a+b*cos(x))^(1/2)+2*a^(1/2)*arctanh(a^-1//2*(a+b*cos(x))^(1/2)))
@test integrate((a+b*cos(x))^-1//2*tan(x), x) == :(2*a^-1//2*arctanh(a^-1//2*(a+b*cos(x))^(1/2)))
