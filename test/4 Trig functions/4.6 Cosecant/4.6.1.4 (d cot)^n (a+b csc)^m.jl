using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+a*csc(x))^-1*tan(x)^4, x) == :(x*a^-1+-1//5*a^-1*tan(x)^5*(1+-1*csc(x))+-1//15*a^-1*(15+-8*csc(x))*tan(x)+1//15*a^-1*tan(x)^3*(5+-4*csc(x)))
@test integrate((a+a*csc(x))^-1*tan(x)^3, x) == :(-1//8*a^-1*(1+sin(x))^-2+1//8*a^-1*(1+-1*sin(x))^-1+3//4*a^-1*(1+sin(x))^-1+5//16*a^-1*log(1+-1*sin(x))+11//16*a^-1*log(1+sin(x)))
@test integrate((a+a*csc(x))^-1*tan(x)^2, x) == :(-1*x*a^-1+-1//3*a^-1*tan(x)^3*(1+-1*csc(x))+1//3*a^-1*(3+-2*csc(x))*tan(x))
@test integrate((a+a*csc(x))^-1*tan(x), x) == :(-3//4*a^-1*log(1+sin(x))+-1//2*a^-1*(1+sin(x))^-1+-1//4*a^-1*log(1+-1*sin(x)))
@test integrate((a+a*csc(x))^-1*cot(x), x) == :(a^-1*log(1+sin(x)))
@test integrate((a+a*csc(x))^-1*cot(x)^2, x) == :(-1*x*a^-1+-1*a^-1*arctanh(cos(x)))
@test integrate((a+a*csc(x))^-1*cot(x)^3, x) == :(-1*a^-1*csc(x)+-1*a^-1*log(sin(x)))
@test integrate((a+a*csc(x))^-1*cot(x)^4, x) == :(x*a^-1+(1/2)*a^-1*arctanh(cos(x))+(1/2)*a^-1*(2+-1*csc(x))*cot(x))
@test integrate((a+a*csc(x))^-1*cot(x)^5, x) == :(a^-1*csc(x)+a^-1*log(sin(x))+(1/2)*a^-1*csc(x)^2+-1//3*a^-1*csc(x)^3)
@test integrate((a+a*csc(x))^-1*cot(x)^6, x) == :(-1*x*a^-1+-3//8*a^-1*arctanh(cos(x))+-1//8*a^-1*(8+-3*csc(x))*cot(x)+1//12*a^-1*cot(x)^3*(4+-3*csc(x)))
@test integrate((a+a*csc(x))^-1*cot(x)^7, x) == :(-1*a^-1*csc(x)^2+-1*a^-1*csc(x)+-1*a^-1*log(sin(x))+-1//5*a^-1*csc(x)^5+1//4*a^-1*csc(x)^4+2//3*a^-1*csc(x)^3)
@test integrate((a+b*csc(x))^-1*tan(x)^5, x) == :((1+-1*csc(x))^-2*(16a+16b)^-1+(1+csc(x))^-2*(-16b+16a)^-1+-1*a^-1*log(sin(x))+-1//16*(a+b)^-3*(8*a^2+15*b^2+21*a*b)*log(1+-1*csc(x))+-1//16*(a+-1b)^-3*(8*a^2+15*b^2+-21*a*b)*log(1+csc(x))+1//16*(1+-1*csc(x))^-1*(a+b)^-2*(5a+7b)+1//16*(1+csc(x))^-1*(a+-1b)^-2*(-7b+5a)+a^-1*b^6*(a^2+-1*b^2)^-3*log(a+b*csc(x)))
@test integrate((a+b*csc(x))^-1*tan(x)^3, x) == :(a^-1*log(sin(x))+-1*(1+-1*csc(x))^-1*(4a+4b)^-1+-1*(1+csc(x))^-1*(-4b+4a)^-1+1//4*(a+b)^-2*(2a+3b)*log(1+-1*csc(x))+1//4*(a+-1b)^-2*(-3b+2a)*log(1+csc(x))+a^-1*b^4*(a^2+-1*b^2)^-2*log(a+b*csc(x)))
@test integrate((a+b*csc(x))^-1*tan(x), x) == :(-1*a^-1*log(sin(x))+-1*(-2b+2a)^-1*log(1+csc(x))+-1*(2a+2b)^-1*log(1+-1*csc(x))+a^-1*b^2*(a^2+-1*b^2)^-1*log(a+b*csc(x)))
@test integrate((a+b*csc(x))^-1*cot(x), x) == :(a^-1*log(a+b*csc(x))+a^-1*log(sin(x)))
@test integrate((a+b*csc(x))^-1*cot(x)^3, x) == :(-1*a^-1*log(sin(x))+-1*b^-1*csc(x)+-1*a^-1*(1+-1*a^2*b^-2)*log(a+b*csc(x)))
@test integrate((a+b*csc(x))^-1*cot(x)^5, x) == :(a^-1*log(sin(x))+-1//3*b^-1*csc(x)^3+(1/2)*a*b^-2*csc(x)^2+-1*b^-3*(a^2+-2*b^2)*csc(x)+a^-1*b^-4*(a^2+-1*b^2)^2*log(a+b*csc(x)))
@test integrate((a+b*csc(x))^-1*cot(x)^7, x) == :(-1*a^-1*log(sin(x))+-1//5*b^-1*csc(x)^5+-1*b^-5*(a^4+3*b^4+-3*a^2*b^2)*csc(x)+-1//3*b^-3*csc(x)^3*(a^2+-3*b^2)+1//4*a*b^-2*csc(x)^4+a^-1*b^-6*(a^2+-1*b^2)^3*log(a+b*csc(x))+(1/2)*a*b^-4*csc(x)^2*(a^2+-3*b^2))
@test integrate((a+b*csc(x))^-1*cot(x)^2, x) == :(-1*x*a^-1+-1*b^-1*arctanh(cos(x))+2*a^-1*b^-1*(a^2+-1*b^2)^(1/2)*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
@test integrate((a+b*csc(x))^-1*cot(x)^4, x) == :(x*a^-1+a*b^-2*cot(x)+-1//2*b^-1*cot(x)*csc(x)+-1//2*b^-3*(-3*b^2+2*a^2)*arctanh(cos(x))+2*a^-1*b^-3*(a^2+-1*b^2)^3//2*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
@test integrate((a+b*csc(x))^-1*cot(x)^6, x) == :(-1*x*a^-1+-3//8*b^-1*arctanh(cos(x))+a*b^-2*cot(x)+-1*b^-5*(a^4+3*b^4+-3*a^2*b^2)*arctanh(cos(x))+-3//8*b^-1*cot(x)*csc(x)+-1//2*b^-3*(a^2+-3*b^2)*arctanh(cos(x))+-1//4*b^-1*csc(x)^3*cot(x)+1//3*a*b^-2*cot(x)^3+a*b^-4*(a^2+-3*b^2)*cot(x)+2*a^-1*b^-5*(a^2+-1*b^2)^5//2*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x)))+-1//2*b^-3*(a^2+-3*b^2)*cot(x)*csc(x))
