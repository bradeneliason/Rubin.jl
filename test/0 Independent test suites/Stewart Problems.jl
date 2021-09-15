using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x^n, x) == :(x^(1+n)*(1+n)^-1)
@test integrate(exp(x), x) == :(exp(x))
@test integrate(x^-1, x) == :(log(x))
@test integrate(a^x, x) == :(a^x*log(a)^-1)
@test integrate(sin(x), x) == :(-1*cos(x))
@test integrate(cos(x), x) == :(sin(x))
@test integrate(sec(x)^2, x) == :(tan(x))
@test integrate(csc(x)^2, x) == :(-1*cot(x))
@test integrate(sec(x)*tan(x), x) == :(sec(x))
@test integrate(cot(x)*csc(x), x) == :(-1*csc(x))
@test integrate(sinh(x), x) == :(cosh(x))
@test integrate(cosh(x), x) == :(sinh(x))
@test integrate(tan(x), x) == :(-1*log(cos(x)))
@test integrate(cot(x), x) == :(log(sin(x)))
@test integrate(x*sin(x), x) == :(-1*x*cos(x)+sin(x))
@test integrate(log(x), x) == :(-1x+x*log(x))
@test integrate(x^2*exp(x), x) == :(2*exp(x)+x^2*exp(x)+-2*x*exp(x))
@test integrate(exp(x)*sin(x), x) == :((1/2)*exp(x)*sin(x)+-1//2*cos(x)*exp(x))
@test integrate(arctan(x), x) == :(-1//2*log(1+x^2)+x*arctan(x))
@test integrate(x*exp(2x), x) == :(-1//4*exp(2x)+(1/2)*x*exp(2x))
@test integrate(x*cos(x), x) == :(x*sin(x)+cos(x))
@test integrate(x*sin(4x), x) == :(1//16*sin(4x)+-1//4*x*cos(4x))
@test integrate(x*log(x), x) == :(-1//4*x^2+(1/2)*x^2*log(x))
@test integrate(x^2*cos(3x), x) == :(-2//27*sin(3x)+1//3*x^2*sin(3x)+2//9*x*cos(3x))
@test integrate(x^2*sin(2x), x) == :(1//4*cos(2x)+(1/2)*x*sin(2x)+-1//2*x^2*cos(2x))
@test integrate(log(x)^2, x) == :(2x+x*log(x)^2+-2*x*log(x))
@test integrate(arcsin(x), x) == :((1+-1*x^2)^(1/2)+x*arcsin(x))
@test integrate(t*cos(t)*sin(t), t) == :(-1//4*t+(1/2)*t*sin(t)^2+1//4*cos(t)*sin(t))
@test integrate(t*sec(t)^2, t) == :(t*tan(t)+log(cos(t)))
@test integrate(t^2*log(t), t) == :(-1//9*t^3+1//3*t^3*log(t))
@test integrate(t^3*exp(t), t) == :(-6*exp(t)+t^3*exp(t)+-3*t^2*exp(t)+6*t*exp(t))
@test integrate(exp(2t)*sin(3t), t) == :(-3//13*cos(3t)*exp(2t)+2//13*exp(2t)*sin(3t))
@test integrate(cos(3t)*exp(-1t), t) == :(-1//10*cos(3t)*exp(-1t)+3//10*exp(-1t)*sin(3t))
@test integrate(y*sinh(y), y) == :(-1*sinh(y)+y*cosh(y))
@test integrate(y*cosh(a*y), y) == :(-1*a^-2*cosh(a*y)+y*a^-1*sinh(a*y))
@test integrate(t*exp(-1t), t) == :(-1*exp(-1t)+-1*t*exp(-1t))
@test integrate(t^(1/2)*log(t), t) == :(-4//9*t^3//2+2//3*t^3//2*log(t))
@test integrate(x*cos(2x), x) == :(1//4*cos(2x)+(1/2)*x*sin(2x))
@test integrate(x^2*exp(-1x), x) == :(-2*exp(-1x)+-1*x^2*exp(-1x)+-2*x*exp(-1x))
@test integrate(arccos(x), x) == :(-1*(1+-1*x^2)^(1/2)+x*arccos(x))
@test integrate(x*csc(x)^2, x) == :(-1*x*cot(x)+log(sin(x)))
@test integrate(cos(5x)*sin(3x), x) == :(-1//16*cos(8x)+1//4*cos(2x))
@test integrate(sin(2x)*sin(4x), x) == :(-1//12*sin(6x)+1//4*sin(2x))
@test integrate(cos(x)*log(sin(x)), x) == :(-1*sin(x)+log(sin(x))*sin(x))
@test integrate(x^3*exp(x^2), x) == :(-1//2*exp(x^2)+(1/2)*x^2*exp(x^2))
@test integrate((3+2x)*exp(x), x) == :(-2*exp(x)+(3+2x)*exp(x))
@test integrate(x*5^x, x) == :(-1*5^x*log(5)^-2+x*5^x*log(5)^-1)
@test integrate(cos(log(x)), x) == :((1/2)*x*cos(log(x))+(1/2)*x*sin(log(x)))
@test integrate(exp(x^(1/2)), x) == :(-2*exp(x^(1/2))+2*x^(1/2)*exp(x^(1/2)))
@test integrate(log(x^(1/2)), x) == :(-1//2*x+x*log(x^(1/2)))
@test integrate(sin(log(x)), x) == :((1/2)*x*sin(log(x))+-1//2*x*cos(log(x)))
@test integrate(sin(x^(1/2)), x) == :(2*sin(x^(1/2))+-2*x^(1/2)*cos(x^(1/2)))
@test integrate(x^5*cos(x^3), x) == :(1//3*cos(x^3)+1//3*x^3*sin(x^3))
@test integrate(x^5*exp(x^2), x) == :((1/2)*x^4*exp(x^2)+-1*x^2*exp(x^2)+exp(x^2))
@test integrate(x*arctan(x), x) == :((1/2)*arctan(x)+-1//2*x+(1/2)*x^2*arctan(x))
@test integrate(x*cos(pi*x), x) == :(pi^-2*cos(pi*x)+x*pi^-1*sin(pi*x))
@test integrate(x^(1/2)*log(x), x) == :(-4//9*x^3//2+2//3*x^3//2*log(x))
@test integrate(sin(3x)^2, x) == :((1/2)*x+-1//6*cos(3x)*sin(3x))
@test integrate(cos(x)^2, x) == :((1/2)*x+(1/2)*cos(x)*sin(x))
@test integrate(cos(x)^4, x) == :(3//8*x+1//4*cos(x)^3*sin(x)+3//8*cos(x)*sin(x))
@test integrate(sin(x)^3, x) == :(-1*cos(x)+1//3*cos(x)^3)
@test integrate(cos(x)^4*sin(x)^3, x) == :(-1//5*cos(x)^5+1//7*cos(x)^7)
@test integrate(cos(x)^3*sin(x)^4, x) == :(-1//7*sin(x)^7+1//5*sin(x)^5)
@test integrate(cos(x)^2*sin(x)^4, x) == :(1//16*x+-1//6*cos(x)^3*sin(x)^3+-1//8*cos(x)^3*sin(x)+1//16*cos(x)*sin(x))
@test integrate(cos(x)^2*sin(x)^2, x) == :(1//8*x+-1//4*cos(x)^3*sin(x)+1//8*cos(x)*sin(x))
@test integrate((1+-1*sin(2x))^2, x) == :(3//2*x+-1//4*cos(2x)*sin(2x)+cos(2x))
@test integrate(cos(x)*sin(x+1//6*pi), x) == :(-1//4*cos(2x+1//6*pi)+1//4*x)
@test integrate(cos(x)^5*sin(x)^5, x) == :(-1//4*sin(x)^8+1//6*sin(x)^6+1//10*sin(x)^10)
@test integrate(sin(x)^6, x) == :(5//16*x+-5//16*cos(x)*sin(x)+-5//24*sin(x)^3*cos(x)+-1//6*sin(x)^5*cos(x))
@test integrate(cos(x)^6, x) == :(5//16*x+1//6*cos(x)^5*sin(x)+5//16*cos(x)*sin(x)+5//24*cos(x)^3*sin(x))
@test integrate(cos(2x)^4*sin(2x)^2, x) == :(1//16*x+-1//12*cos(2x)^5*sin(2x)+1//32*cos(2x)*sin(2x)+1//48*cos(2x)^3*sin(2x))
@test integrate(sin(x)^5, x) == :(-1*cos(x)+-1//5*cos(x)^5+2//3*cos(x)^3)
@test integrate(cos(x)^4*sin(x)^4, x) == :(3//128*x+-1//8*cos(x)^5*sin(x)^3+-1//16*cos(x)^5*sin(x)+1//64*cos(x)^3*sin(x)+3//128*cos(x)*sin(x))
@test integrate(cos(x)^(1/2)*sin(x)^3, x) == :(-2//3*cos(x)^3//2+2//7*cos(x)^7//2)
@test integrate(cos(x)^3*sin(x)^(1/2), x) == :(-2//7*sin(x)^7//2+2//3*sin(x)^3//2)
@test integrate(x^-1//2*cos(x^(1/2))^2, x) == :(x^(1/2)+cos(x^(1/2))*sin(x^(1/2)))
@test integrate(x*sin(x^2)^3, x) == :(-1//2*cos(x^2)+1//6*cos(x^2)^3)
@test integrate(cos(x)^2*tan(x)^3, x) == :((1/2)*cos(x)^2+-1*log(cos(x)))
@test integrate(cot(x)^5*sin(x)^2, x) == :((1/2)*sin(x)^2+-2*log(sin(x))+-1//2*csc(x)^2)
@test integrate(cos(x)^-1*(1+-1*sin(x)), x) == :(log(1+sin(x)))
@test integrate((1+-1*sin(x))^-1, x) == :((1+-1*sin(x))^-1*cos(x))
@test integrate(tan(x)^2, x) == :(-1x+tan(x))
@test integrate(tan(x)^4, x) == :(x+-1*tan(x)+1//3*tan(x)^3)
@test integrate(sec(x)^4, x) == :(1//3*tan(x)^3+tan(x))
@test integrate(sec(x)^6, x) == :(1//5*tan(x)^5+2//3*tan(x)^3+tan(x))
@test integrate(sec(x)^2*tan(x)^4, x) == :(1//5*tan(x)^5)
@test integrate(sec(x)^4*tan(x)^2, x) == :(1//3*tan(x)^3+1//5*tan(x)^5)
@test integrate(sec(x)^3*tan(x), x) == :(1//3*sec(x)^3)
@test integrate(sec(x)^3*tan(x)^3, x) == :(-1//3*sec(x)^3+1//5*sec(x)^5)
@test integrate(tan(x)^5, x) == :(-1*log(cos(x))+-1//2*tan(x)^2+1//4*tan(x)^4)
@test integrate(tan(x)^6, x) == :(-1x+-1//3*tan(x)^3+1//5*tan(x)^5+tan(x))
@test integrate(tan(x)^5*sec(x), x) == :(-2//3*sec(x)^3+1//5*sec(x)^5+sec(x))
@test integrate(sec(x)^3*tan(x)^5, x) == :(-2//5*sec(x)^5+1//3*sec(x)^3+1//7*sec(x)^7)
@test integrate(sec(x)^6*tan(x), x) == :(1//6*sec(x)^6)
@test integrate(sec(x)^6*tan(x)^3, x) == :(-1//6*sec(x)^6+1//8*sec(x)^8)
@test integrate(cot(x)^-1*sec(x)^2, x) == :((1/2)*sec(x)^2)
@test integrate(tan(x)^2*sec(x), x) == :(-1//2*arctanh(sin(x))+(1/2)*sec(x)*tan(x))
@test integrate(cot(x)^2, x) == :(-1x+-1*cot(x))
@test integrate(cot(x)^3, x) == :(-1*log(sin(x))+-1//2*cot(x)^2)
@test integrate(cot(x)^4*csc(x)^4, x) == :(-1//5*cot(x)^5+-1//7*cot(x)^7)
@test integrate(cot(x)^3*csc(x)^4, x) == :(-1//6*csc(x)^6+1//4*csc(x)^4)
@test integrate(csc(x), x) == :(-1*arctanh(cos(x)))
@test integrate(csc(x)^3, x) == :(-1//2*arctanh(cos(x))+-1//2*cot(x)*csc(x))
@test integrate(cos(x)^2*sin(x)^-1, x) == :(-1*arctanh(cos(x))+cos(x))
@test integrate(sin(x)^-4, x) == :(-1*cot(x)+-1//3*cot(x)^3)
@test integrate(sin(2x)*sin(5x), x) == :(-1//14*sin(7x)+1//6*sin(3x))
@test integrate(cos(x)*sin(3x), x) == :(-1//4*cos(2x)+-1//8*cos(4x))
@test integrate(cos(3x)*cos(4x), x) == :((1/2)*sin(x)+1//14*sin(7x))
@test integrate(sin(3x)*sin(6x), x) == :(-1//18*sin(9x)+1//6*sin(3x))
@test integrate(cos(x)^5*sin(x), x) == :(-1//6*cos(x)^6)
@test integrate(cos(x)*cos(2x)*cos(3x), x) == :(1//4*x+1//8*sin(2x)+1//16*sin(4x)+1//24*sin(6x))
@test integrate(sec(x)^-2*(1+-1*tan(x)^2), x) == :(cos(x)*sin(x))
@test integrate(sin(2x)^-1*(cos(x)+sin(x)), x) == :((1/2)*arctanh(sin(x))+-1//2*arctanh(cos(x)))
@test integrate(sin(x)^2*tan(x), x) == :((1/2)*cos(x)^2+-1*log(cos(x)))
@test integrate(cos(x)^2*cot(x)^3, x) == :((1/2)*sin(x)^2+-2*log(sin(x))+-1//2*csc(x)^2)
@test integrate(sec(x)^3*tan(x), x) == :(1//3*sec(x)^3)
@test integrate(sec(x)^3*tan(x)^3, x) == :(-1//3*sec(x)^3+1//5*sec(x)^5)
@test integrate(x^-2*(9+-1*x^2)^(1/2), x) == :(-1*arcsin(1//3*x)+-1*x^-1*(9+-1*x^2)^(1/2))
@test integrate(x^-2*(4+x^2)^-1//2, x) == :(-1//4*x^-1*(4+x^2)^(1/2))
@test integrate(x*(4+x^2)^-1//2, x) == :((4+x^2)^(1/2))
@test integrate((x^2+-1*a^2)^-1//2, x) == :(arctanh(x*(x^2+-1*a^2)^-1//2))
@test integrate(x^3*(9+4*x^2)^-3//2, x) == :(1//16*(9+4*x^2)^(1/2)+9//16*(9+4*x^2)^-1//2)
@test integrate(x*(3+-1*x^2+-2x)^-1//2, x) == :(-1*(3+-1*x^2+-2x)^(1/2)+arcsin(-1//2+-1//2*x))
@test integrate(x^-2*(1+-1*x^2)^-1//2, x) == :(-1*x^-1*(1+-1*x^2)^(1/2))
@test integrate(x^3*(4+-1*x^2)^(1/2), x) == :(-4//3*(4+-1*x^2)^3//2+1//5*(4+-1*x^2)^5//2)
@test integrate(x*(1+-1*x^2)^-1//2, x) == :(-1*(1+-1*x^2)^(1/2))
@test integrate(x*(4+-1*x^2)^(1/2), x) == :(-1//3*(4+-1*x^2)^3//2)
@test integrate((1+-4*x^2)^(1/2), x) == :(1//4*arcsin(2x)+(1/2)*x*(1+-4*x^2)^(1/2))
@test integrate(x^3*(4+x^2)^-1//2, x) == :(-4*(4+x^2)^(1/2)+1//3*(4+x^2)^3//2)
@test integrate((9+x^2)^-1//2, x) == :(arcsinh(1//3*x))
@test integrate((1+x^2)^(1/2), x) == :((1/2)*arcsinh(x)+(1/2)*x*(1+x^2)^(1/2))
@test integrate(x^-3*(-16+x^2)^-1//2, x) == :(1//128*arctan(1//4*(-16+x^2)^(1/2))+1//32*x^-2*(-16+x^2)^(1/2))
@test integrate(x^-4*(x^2+-1*a^2)^(1/2), x) == :(1//3*a^-2*x^-3*(x^2+-1*a^2)^3//2)
@test integrate(x^-1*(-4+9*x^2)^(1/2), x) == :((-4+9*x^2)^(1/2)+-2*arctan((1/2)*(-4+9*x^2)^(1/2)))
@test integrate(x^-2*(-9+16*x^2)^-1//2, x) == :(1//9*x^-1*(-9+16*x^2)^(1/2))
@test integrate(x^2*(a^2+-1*x^2)^-3//2, x) == :(-1*arctan(x*(a^2+-1*x^2)^-1//2)+x*(a^2+-1*x^2)^-1//2)
@test integrate(x^2*(5+-1*x^2)^-1//2, x) == :(5//2*arcsin(1//5*x*5^(1/2))+-1//2*x*(5+-1*x^2)^(1/2))
@test integrate(x^-1*(3+x^2)^-1//2, x) == :(-1//3*3^(1/2)*arctanh(1//3*3^(1/2)*(3+x^2)^(1/2)))
@test integrate(x*(4+x^2)^-5//2, x) == :(-1//3*(4+x^2)^-3//2)
@test integrate(x^3*(4+-9*x^2)^(1/2), x) == :(-4//243*(4+-9*x^2)^3//2+1//405*(4+-9*x^2)^5//2)
@test integrate(x^2*(9+-1*x^2)^(1/2), x) == :(81//8*arcsin(1//3*x)+-9//8*x*(9+-1*x^2)^(1/2)+1//4*x^3*(9+-1*x^2)^(1/2))
@test integrate(5*x*(1+x^2)^(1/2), x) == :(5//3*(1+x^2)^3//2)
@test integrate((-25+4*x^2)^-3//2, x) == :(-1//25*x*(-25+4*x^2)^-1//2)
@test integrate((-1*x^2+2x)^(1/2), x) == :(-1//2*arcsin(1+-1x)+(-1*x^2+2x)^(1/2)*(-1//2+(1/2)*x))
@test integrate((8+x^2+4x)^-1//2, x) == :(arcsinh(1+(1/2)*x))
@test integrate((-8+6x+9*x^2)^-1//2, x) == :(1//3*arctanh((-8+6x+9*x^2)^-1//2*(1+3x)))
@test integrate(x^2*(-1*x^2+4x)^-1//2, x) == :(-6*arcsin(1+-1//2*x)+-3*(-1*x^2+4x)^(1/2)+-1//2*x*(-1*x^2+4x)^(1/2))
@test integrate((2+x^2+2x)^-2, x) == :((1/2)*arctan(1+x)+(4+2*x^2+4x)^-1*(1+x))
@test integrate((5+-1*x^2+-4x)^-5//2, x) == :(1//27*(5+-1*x^2+-4x)^-3//2*(2+x)+1//243*(5+-1*x^2+-4x)^-1//2*(4+2x))
@test integrate((9+-1*exp(2t))^(1/2)*exp(t), t) == :(9//2*arcsin(1//3*exp(t))+(1/2)*(9+-1*exp(2t))^(1/2)*exp(t))
@test integrate((-9+exp(2t))^(1/2), t) == :((-9+exp(2t))^(1/2)+-3*arctan(1//3*(-9+exp(2t))^(1/2)))
@test integrate((a^2+x^2)^-1//2, x) == :(arctanh(x*(a^2+x^2)^-1//2))
@test integrate((-2+x+x^2)^-1*(5+x), x) == :(-1*log(2+x)+2*log(1+-1x))
@test integrate((-1+x)^-1*(x+x^3), x) == :((1/2)*x^2+2x+2*log(1+-1x)+1//3*x^3)
@test integrate((-2x+2*x^3+3*x^2)^-1*(-1+x^2+2x), x) == :((1/2)*log(x)+-1//10*log(2+x)+1//10*log(1+-2x))
@test integrate((1+x^3+-1x+-1*x^2)^-1*(1+x^4+-2*x^2+4x), x) == :(x+(1/2)*x^2+-1*log(1+x)+2*(1+-1x)^-1+log(1+-1x))
@test integrate((x^3+4x)^-1*(4+-1x+2*x^2), x) == :((1/2)*log(4+x^2)+-1//2*arctan((1/2)*x)+log(x))
@test integrate((3+-4x+4*x^2)^-1*(2+-3x+4*x^2), x) == :(x+1//8*log(3+-4x+4*x^2)+1//8*2^(1/2)*arctan((1/2)*2^(1/2)*(1+-2x)))
@test integrate(x^-1*(1+x^2)^-3*(-1+x)^-1*(1+x+x^2)^-1*(1+x^2+x^3), x) == :(-1*log(x)+-1//2*log(1+x+x^2)+1//8*log(1+-1x)+7//16*arctan(x)+15//16*log(1+x^2)+-1*(8+8*x^2)^-1*(3+-3x)+3*x*(16+16*x^2)^-1+-1//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x))+1//8*(1+x^2)^-2*(1+x))
@test integrate(x^-1*(1+x^2)^-2*(1+-1*x^3+-3x+2*x^2), x) == :(-2*arctan(x)+-1//2*log(1+x^2)+-1*(2+2*x^2)^-1*(1+2x)+log(x))
@test integrate((1+x^2)^-2, x) == :((1/2)*arctan(x)+x*(2+2*x^2)^-1)
@test integrate((-1+x)^-1*(2+x)^-1, x) == :(-1//3*log(2+x)+1//3*log(1+-1x))
@test integrate(7*(-12+2*x^2+5x)^-1, x) == :(-7//11*log(4+x)+7//11*log(3+-2x))
@test integrate((-1+2x)^-2*(3+2x)^-1*(-4+x^2+3x), x) == :(-9*(32+-64x)^-1+-25//128*log(3+2x)+41//128*log(1+-2x))
@test integrate((-6+x)^-1*(3+5x)^-3*(x^3+-1*x^2), x) == :(201*(45375+75625x)^-1+-12//1375*(3+5x)^-2+20//3993*log(6+-1x)+1493//499125*log(3+5x))
@test integrate((x^4+-1*x^3)^-1, x) == :(x^-1+(1/2)*x^-2+-1*log(x)+log(1+-1x))
@test integrate((x^3+-1x)^-1*(1+x^3+x^4+-1x+-1*x^2), x) == :(x+(1/2)*x^2+(1/2)*log(1+-1*x^2)+-1*log(x))
@test integrate(x^-1*(2+x^2)^-1*(-2+x^2), x) == :(-1*log(x)+log(2+x^2))
@test integrate((1+x^2)^-1*(2+x^2)^-1*(2+x^3+-4*x^2), x) == :(6*arctan(x)+-1//2*log(1+x^2)+-5*2^(1/2)*arctan((1/2)*x*2^(1/2))+log(2+x^2))
@test integrate((1+x^2)^-1*(4+x^2)^-2*(1+x^2+x^4), x) == :(1//9*arctan(x)+25//144*arctan((1/2)*x)+-13*x*(96+24*x^2)^-1)
@test integrate((-3+2x)^-1*(5+x)^-2*(1+x+x^2)^-1*(1+16x), x) == :(-79*(1365+273x)^-1+-481//5586*log(1+x+x^2)+200//3211*log(3+-2x)+2731//24843*log(5+x)+451//8379*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x)))
@test integrate(x^4*(9+x^2)^-3, x) == :(1//8*arctan(1//3*x)+-3*x*(72+8*x^2)^-1+-1//4*x^3*(9+x^2)^-2)
@test integrate(19*x*(-1+x)^-3*(3+4*x^2+5x)^-2, x) == :(-1843*(4416+-4416x)^-1+-399//736*(1+-1x)^-2+-209//4608*log(3+4*x^2+5x)+209//2304*log(1+-1x)+114437//1218816*23^(1/2)*arctan(1//23*23^(1/2)*(5+8x))+1//276*(1+-1x)^-2*(3+4*x^2+5x)^-1*(741+836x))
@test integrate((x^3+x^4+2*x^2)^-1*(1+x^2+x^3), x) == :(-1//2*x^-1+-1//4*log(x)+5//8*log(2+x+x^2)+1//28*7^(1/2)*arctan(1//7*7^(1/2)*(1+2x)))
@test integrate((x^6+-1*x^3)^-1, x) == :((1/2)*x^-2+-1//6*log(1+x+x^2)+1//3*log(1+-1x)+-1//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x)))
@test integrate(x^2*(1+x)^-1, x) == :((1/2)*x^2+-1x+log(1+x))
@test integrate(x*(-5+x)^-1, x) == :(x+5*log(5+-1x))
@test integrate((-1+x)^-1*(2+x)^-1*(-1+4x), x) == :(3*log(2+x)+log(1+-1x))
@test integrate((1+x)^-1*(2+x)^-1, x) == :(-1*log(2+x)+log(1+x))
@test integrate((3+2x)^-1*(-5+6x), x) == :(-7*log(3+2x)+3x)
@test integrate((a+x)^-1*(b+x)^-1, x) == :((a+-1b)^-1*log(b+x)+-1*(a+-1b)^-1*log(a+x))
@test integrate((x^2+-1x)^-1*(1+x^2), x) == :(x+-1*log(x)+2*log(1+-1x))
@test integrate((-12+x+x^2)^-1*(1+x^2+x^3+-12x), x) == :((1/2)*x^2+-1//7*log(4+x)+1//7*log(3+-1x))
@test integrate((1+x)^-2*(3+2x), x) == :(-1*(1+x)^-1+2*log(1+x))
@test integrate(x^-1*(1+x)^-1*(3+2x)^-1, x) == :(-1*log(1+x)+1//3*log(x)+2//3*log(3+2x))
@test integrate((x^3+-3x+2*x^2)^-1*(-3+5x+6*x^2), x) == :(2*log(1+-1x)+3*log(3+x)+log(x))
@test integrate(x*(4+x^2+4x)^-1, x) == :(2*(2+x)^-1+log(2+x))
@test integrate((-1+x)^-2*(4+x)^-1, x) == :((5+-5x)^-1+-1//25*log(1+-1x)+1//25*log(4+x))
@test integrate(x^2*(-3+x)^-1*(2+x)^-2, x) == :(4*(10+5x)^-1+9//25*log(3+-1x)+16//25*log(2+x))
@test integrate((x^3+2*x^2)^-1*(-2+3x+5*x^2), x) == :(x^-1+2*log(x)+3*log(2+x))
@test integrate((-6+x+x^3+4*x^2)^-1*(18+-4*x^2+-2x), x) == :(-3*log(3+x)+-2*log(2+x)+log(1+-1x))
@test integrate((4+x^3+3*x^2)^-1*(x^2+2x), x) == :(1//3*log(4+x^3+3*x^2))
@test integrate(x^-2*(-1+x)^-2, x) == :((1+-1x)^-1+-1*x^-1+-2*log(1+-1x)+2*log(x))
@test integrate(x^2*(1+x)^-3, x) == :(2*(1+x)^-1+-1//2*(1+x)^-2+log(1+x))
@test integrate((x^4+-1*x^2)^-1, x) == :(x^-1+-1*arctanh(x))
@test integrate((1+x^4+-1*x^2)^-1*(-1x+2*x^3), x) == :((1/2)*log(1+x^4+-1*x^2))
@test integrate(x^3*(1+x^2)^-1, x) == :((1/2)*x^2+-1//2*log(1+x^2))
@test integrate((2+x^2+2x)^-1*(-1+x), x) == :((1/2)*log(2+x^2+2x)+-2*arctan(1+x))
@test integrate(x*(1+x+x^2)^-1, x) == :((1/2)*log(1+x+x^2)+-1//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x)))
@test integrate((5+4x+4*x^2)^-1*(7+4*x^2+5x), x) == :(x+1//8*log(5+4x+4*x^2)+3//8*arctan(1/2+x))
@test integrate((1+x^2)^-1*(-1+x)^-1*(5+-4x+3*x^2), x) == :((1/2)*log(1+x^2)+-3*arctan(x)+2*log(1+-1x))
@test integrate((x^3+3x)^-1*(3+2x), x) == :(-1//2*log(3+x^2)+2//3*3^(1/2)*arctan(1//3*x*3^(1/2))+log(x))
@test integrate((-1+x^3)^-1, x) == :(-1//6*log(1+x+x^2)+1//3*log(1+-1x)+-1//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x)))
@test integrate(x^3*(1+x^3)^-1, x) == :(x+-1//3*log(1+x)+1//6*log(1+x^2+-1x)+1//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+-2x)))
@test integrate((1+x^2)^-1*(-1+x)^-2*(-1+x^2+-2x), x) == :((-1+x)^-1+-1//2*log(1+x^2)+arctan(x)+log(1+-1x))
@test integrate(x^4*(-1+x^4)^-1, x) == :(x+-1//2*arctan(x)+-1//2*arctanh(x))
@test integrate((1+x^2)^-1*(2+x^2)^-1*(-4+-1*x^2+3*x^3+6x), x) == :(-3*arctan(x)+3//2*log(1+x^2)+2^(1/2)*arctan((1/2)*x*2^(1/2)))
@test integrate((4+x^4+5*x^2)^-1*(1+x+x^3+-2*x^2), x) == :((1/2)*log(4+x^2)+-3//2*arctan((1/2)*x)+arctan(x))
@test integrate((4+x^2+2x)^-2*(-3+x), x) == :((24+6*x^2+12x)^-1*(-7+-4x)+-2//9*3^(1/2)*arctan(1//3*3^(1/2)*(1+x)))
@test integrate(x^-1*(1+x^2)^-2*(1+x^4), x) == :((1+x^2)^-1+log(x))
@test integrate((2+sin(x)^2+-3*sin(x))^-1*(-3+2*sin(x))*cos(x), x) == :(log(2+sin(x)^2+-3*sin(x)))
@test integrate((5+cos(x)^2)^-1*cos(x)^2*sin(x), x) == :(-1*cos(x)+5^(1/2)*arctan(1//5*5^(1/2)*cos(x)))
@test integrate((-3+x^2+2x)^-1, x) == :(-1//4*log(3+x)+1//4*log(1+-1x))
@test integrate((x^2+-2x)^-1, x) == :((1/2)*log(2+-1x)+-1//2*log(x))
@test integrate((-7+4*x^2+12x)^-1*(1+2x), x) == :(1//8*log(1+-2x)+3//8*log(7+2x))
@test integrate(x*(-1+x+x^2)^-1, x) == :(1//10*(5+5^(1/2))*log(1+5^(1/2)+2x)+1//10*(5+-1*5^(1/2))*log(1+-1*5^(1/2)+2x))
@test integrate((-70+-299x+-286*x^2+-13*x^4+30*x^5+50*x^3)^-1*(-32+-27*x^2+4*x^3+5x), x) == :(-3146//80155*log(7+-3x)+-334//323*log(1+2x)+4822//4879*log(2+5x)+11049//260015*log(5+x+x^2)+3988//260015*19^(1/2)*arctan(1//19*19^(1/2)*(1+2x)))
@test integrate((4+-80*x^3+-80*x^5+-20x+41*x^2+100*x^6+116*x^4)^-1*(8+-13*x^2+-7*x^3+12*x^5), x) == :(5828*(18150+-45375x)^-1+-59096//99825*log(2+-5x)+2843//7986*log(1+2*x^2)+-1*(1452+2904*x^2)^-1*(313+502x)+503//15972*2^(1/2)*arctan(x*2^(1/2)))
@test integrate(x^-1*(4+x)^(1/2), x) == :(-4*arctanh((1/2)*(4+x)^(1/2))+2*(4+x)^(1/2))
@test integrate((x^(1/2)+-1*x^-1//3)^-1, x) == :(2*x^(1/2)+6//5*log(1+-1*x^1//6)+-1*(3//10+-3//10*5^(1/2))*log(2+x^1//6+2*x^1//3+5^(1/2)*x^1//6)+-1*(3//10+3//10*5^(1/2))*log(2+x^1//6+2*x^1//3+-1*5^(1/2)*x^1//6)+-3//5*(10+2*5^(1/2))^(1/2)*arctan((1/2)*(1/2+1//10*5^(1/2))^(1/2)*(1+5^(1/2)+4*x^1//6))+3//5*(10+-2*5^(1/2))^(1/2)*arctan((10+2*5^(1/2))^-1//2*(1+-1*5^(1/2)+4*x^1//6)))
@test integrate((-4*cos(x)+3*sin(x))^-1, x) == :(-1//5*arctanh(3//5*cos(x)+4//5*sin(x)))
@test integrate((1+x^(1/2))^-1, x) == :(-2*log(1+x^(1/2))+2*x^(1/2))
@test integrate((1+x^-1//3)^-1, x) == :(x+-1*log(x)+-3*log(1+x^-1//3)+3*x^1//3+-3//2*x^2//3)
@test integrate(x^(1/2)*(1+x)^-1, x) == :(-2*arctan(x^(1/2))+2*x^(1/2))
@test integrate(x^-1*(1+x)^-1//2, x) == :(-2*arctanh((1+x)^(1/2)))
@test integrate((x+-1*x^1//3)^-1, x) == :(3//2*log(1+-1*x^2//3))
@test integrate((x+-1*(2+x)^(1/2))^-1, x) == :(2//3*log(1+(2+x)^(1/2))+4//3*log(2+-1*(2+x)^(1/2)))
@test integrate(x^2*(-1+x)^-1//2, x) == :(2*(-1+x)^(1/2)+2//5*(-1+x)^5//2+4//3*(-1+x)^3//2)
@test integrate((1+x)^-1*(-1+x)^(1/2), x) == :(2*(-1+x)^(1/2)+-2*2^(1/2)*arctan((1/2)*2^(1/2)*(-1+x)^(1/2)))
@test integrate((1+x^(1/2))^-1//2, x) == :(-4*(1+x^(1/2))^(1/2)+4//3*(1+x^(1/2))^3//2)
@test integrate(x^(1/2)*(x+x^2)^-1, x) == :(2*arctan(x^(1/2)))
@test integrate((-1+x^(1/2))^-1*(1+x^(1/2)), x) == :(x+4*x^(1/2)+4*log(1+-1*x^(1/2)))
@test integrate((-1+x^-1//3)^-1*(1+x^-1//3), x) == :(-1x+-6*x^1//3+-6*log(1+-1*x^1//3)+-3*x^2//3)
@test integrate(x^3*(1+x^2)^-1//3, x) == :(-3//4*(1+x^2)^2//3+3//10*(1+x^2)^5//3)
@test integrate(x^(1/2)*(x^(1/2)+-1*x^-1//3)^-1, x) == :(x+6*x^1//6+6//5*log(1+-1*x^1//6)+-1*(3//10+-3//10*5^(1/2))*log(2+x^1//6+2*x^1//3+-1*5^(1/2)*x^1//6)+-1*(3//10+3//10*5^(1/2))*log(2+x^1//6+2*x^1//3+5^(1/2)*x^1//6)+-3//5*(10+-2*5^(1/2))^(1/2)*arctan((1/2)*(1/2+1//10*5^(1/2))^(1/2)*(1+5^(1/2)+4*x^1//6))+-3//5*(10+2*5^(1/2))^(1/2)*arctan((10+2*5^(1/2))^-1//2*(1+-1*5^(1/2)+4*x^1//6)))
@test integrate((x^(1/2)+x^-1//4)^-1, x) == :(2*x^(1/2)+-2//3*log(1+x^(1/2)+-1*x^1//4)+4//3*log(1+x^1//4)+4//3*3^(1/2)*arctan(1//3*3^(1/2)*(1+-2*x^1//4)))
@test integrate((x^-1//3+x^-1//4)^-1, x) == :(-1x+-12*log(1+x^1//12)+-6*x^1//6+-3*x^1//3+-2*x^(1/2)+4*x^1//4+12*x^1//12+-6//5*x^5//6+-6//7*x^7//6+-3//2*x^2//3+4//3*x^3//4+4//5*x^5//4+12//5*x^5//12+12//7*x^7//12+12//11*x^11//12+12//13*x^13//12)
@test integrate((x^-1*(1+-1x))^(1/2), x) == :(-1*arctan((-1+x^-1)^(1/2))+x*(-1+x^-1)^(1/2))
@test integrate((sin(x)^2+sin(x))^-1*cos(x), x) == :(-1*log(1+sin(x))+log(sin(x)))
@test integrate((2+3*exp(x)+exp(2x))^-1*exp(2x), x) == :(-1*log(1+exp(x))+2*log(2+exp(x)))
@test integrate((1+exp(x))^-1//2, x) == :(-2*arctanh((1+exp(x))^(1/2)))
@test integrate((1+-1*exp(x))^(1/2), x) == :(-2*arctanh((1+-1*exp(x))^(1/2))+2*(1+-1*exp(x))^(1/2))
@test integrate((3+-5*sin(x))^-1, x) == :(-1//4*log(-3*sin((1/2)*x)+cos((1/2)*x))+1//4*log(-1*sin((1/2)*x)+3*cos((1/2)*x)))
@test integrate((cos(x)+sin(x))^-1, x) == :(-1//2*2^(1/2)*arctanh((1/2)*2^(1/2)*(-1*sin(x)+cos(x))))
@test integrate((1+-1*cos(x)+sin(x))^-1, x) == :(-1*log(1+cot((1/2)*x)))
@test integrate((3*sin(x)+4*cos(x))^-1, x) == :(-1//5*arctanh(-4//5*sin(x)+3//5*cos(x)))
@test integrate((sin(x)+tan(x))^-1, x) == :(-1//2*csc(x)^2+-1//2*arctanh(cos(x))+(1/2)*cot(x)*csc(x))
@test integrate((2*sin(x)+sin(2x))^-1, x) == :(1//4*log(tan((1/2)*x))+1//8*tan((1/2)*x)^2)
@test integrate((1+sin(x))^-1*sec(x), x) == :((1/2)*arctanh(sin(x))+-1*(2+2*sin(x))^-1)
@test integrate((a*sin(x)+b*cos(x))^-1, x) == :(-1*(a^2+b^2)^-1//2*arctanh((a^2+b^2)^-1//2*(a*cos(x)+-1*b*sin(x))))
@test integrate((a^2*sin(x)^2+b^2*cos(x)^2)^-1, x) == :(a^-1*b^-1*arctan(a*b^-1*tan(x)))
@test integrate(x*(-1+x^2)^-1, x) == :((1/2)*log(1+-1*x^2))
@test integrate(x^(1/2)*(1+x^(1/2)), x) == :((1/2)*x^2+2//3*x^3//2)
@test integrate((1+-1*cos(x))^-1, x) == :(-1*(1+-1*cos(x))^-1*sin(x))
@test integrate(tan(x)^2*sec(x), x) == :(-1//2*arctanh(sin(x))+(1/2)*sec(x)*tan(x))
@test integrate(sec(x)^3*tan(x)^3, x) == :(-1//3*sec(x)^3+1//5*sec(x)^5)
@test integrate(exp(x^(1/2)), x) == :(-2*exp(x^(1/2))+2*x^(1/2)*exp(x^(1/2)))
@test integrate((x^3+-10x+-3*x^2)^-1*(1+x^5), x) == :(19x+-31//14*log(2+x)+-1//10*log(x)+1//3*x^3+3//2*x^2+3126//35*log(5+-1x))
@test integrate(x^-1*log(x)^-1//2, x) == :(2*log(x)^(1/2))
@test integrate((-3+x)^-1*(5+2x), x) == :(2x+11*log(3+-1x))
@test integrate(exp(x+exp(x)), x) == :(exp(exp(x)))
@test integrate(cos(x)^2*sin(x)^2, x) == :(1//8*x+-1//4*cos(x)^3*sin(x)+1//8*cos(x)*sin(x))
@test integrate((cos(x)+sin(x))^-1*(-1*cos(x)+sin(x)), x) == :(-1*log(cos(x)+sin(x)))
@test integrate(x*(1+-1*x^2)^-1//2, x) == :(-1*(1+-1*x^2)^(1/2))
@test integrate(x^3*log(x), x) == :(-1//16*x^4+1//4*x^4*log(x))
@test integrate((-2+x)^(1/2)*(2+x)^-1, x) == :(-4*arctan((1/2)*(-2+x)^(1/2))+2*(-2+x)^(1/2))
@test integrate(x*(2+x)^-2, x) == :(2*(2+x)^-1+log(2+x))
@test integrate(log(1+x^2), x) == :(-2x+2*arctan(x)+x*log(1+x^2))
@test integrate(x^-1*(1+log(x))^(1/2)*log(x)^-1, x) == :(-2*arctanh((1+log(x))^(1/2))+2*(1+log(x))^(1/2))
@test integrate((1+x^(1/2))^8, x) == :(-2//9*(1+x^(1/2))^9+1//5*(1+x^(1/2))^10)
@test integrate(sec(x)^4*tan(x)^3, x) == :(-1//4*sec(x)^4+1//6*sec(x)^6)
@test integrate(x*(2+x^2+-2x)^-1, x) == :((1/2)*log(2+x^2+-2x)+-1*arctan(1+-1x))
@test integrate(x*arcsin(x), x) == :(-1//4*arcsin(x)+(1/2)*x^2*arcsin(x)+1//4*x*(1+-1*x^2)^(1/2))
@test integrate(x^-1*(9+-1*x^2)^(1/2), x) == :((9+-1*x^2)^(1/2)+-3*arctanh(1//3*(9+-1*x^2)^(1/2)))
@test integrate(x*(2+x^2+3x)^-1, x) == :(-1*log(1+x)+2*log(2+x))
@test integrate(x^2*cosh(x), x) == :(2*sinh(x)+x^2*sinh(x)+-2*x*cosh(x))
@test integrate((x^4+2*x^2+4x)^-1*(1+x+x^3), x) == :(1//4*log(x^4+2*x^2+4x))
@test integrate((1+sin(x)^2)^-1*cos(x), x) == :(arctan(sin(x)))
@test integrate(cos(x^(1/2)), x) == :(2*cos(x^(1/2))+2*x^(1/2)*sin(x^(1/2)))
@test integrate(sin(pi*x), x) == :(-1*pi^-1*cos(pi*x))
@test integrate((1+exp(x))^-1*exp(2x), x) == :(-1*log(1+exp(x))+exp(x))
@test integrate(cos(5x)*exp(3x), x) == :(3//34*cos(5x)*exp(3x)+5//34*exp(3x)*sin(5x))
@test integrate(cos(3x)*cos(5x), x) == :(1//4*sin(2x)+1//16*sin(8x))
@test integrate((1+x+x^2+x^3)^-1, x) == :((1/2)*arctan(x)+(1/2)*log(1+x)+-1//4*log(1+x^2))
@test integrate(x^2*log(1+x), x) == :(-1//3*x+-1//9*x^3+1//3*log(1+x)+1//6*x^2+1//3*x^3*log(1+x))
@test integrate(x^5*exp(-1*x^3), x) == :(-1//3*exp(-1*x^3)+-1//3*x^3*exp(-1*x^3))
@test integrate(tan(4x)^2, x) == :(-1x+1//4*tan(4x))
@test integrate((-5+9*x^2+12x)^-1//2, x) == :(1//3*arctanh((-5+9*x^2+12x)^-1//2*(2+3x)))
@test integrate(x^2*arctan(x), x) == :(-1//6*x^2+1//6*log(1+x^2)+1//3*x^3*arctan(x))
@test integrate(x^-1//3*(1+-1*x^(1/2)), x) == :(-6//7*x^7//6+3//2*x^2//3)
@test integrate((-1*exp(-1x)+exp(x))^-1, x) == :(-1*arctanh(exp(x)))
@test integrate(x*(10+x^4+2*x^2)^-1, x) == :(1//6*arctan(1//3+1//3*x^2))
@test integrate((x+x^-1//3)^-1, x) == :(3//4*log(1+x^4//3))
@test integrate(cos(x)^4*sin(x)^2, x) == :(1//16*x+-1//6*cos(x)^5*sin(x)+1//16*cos(x)*sin(x)+1//24*cos(x)^3*sin(x))
@test integrate((5+-1*x^2+-4x)^-1//2, x) == :(-1*arcsin(-2//3+-1//3*x))
@test integrate(x*(1+(1+-1*x^2)^(1/2)+-1*x^2)^-1, x) == :(-1*log(1+(1+-1*x^2)^(1/2)))
@test integrate((1+cos(x))*csc(x), x) == :(log(1+-1*cos(x)))
@test integrate((-1+exp(2x))^-1*exp(x), x) == :(-1*arctanh(exp(x)))
@test integrate((-8+x^3)^-1, x) == :(-1//24*log(4+x^2+2x)+1//12*log(2+-1x)+-1//12*3^(1/2)*arctan(1//3*3^(1/2)*(1+x)))
@test integrate(x^5*cosh(x), x) == :(-120*cosh(x)+x^5*sinh(x)+-60*x^2*cosh(x)+-5*x^4*cosh(x)+20*x^3*sinh(x)+120*x*sinh(x))
@test integrate(cos(x)^-1*sin(x)^-1*log(tan(x)), x) == :((1/2)*log(tan(x))^2)
@test integrate(x^2+x^3+-2x, x) == :(-1*x^2+1//3*x^3+1//4*x^4)
@test integrate((1+-1*exp(x))^-1*(1+exp(x)), x) == :(x+-2*log(1+-1*exp(x)))
@test integrate(x*(1+x^2)^-1*(4+x^2)^-1, x) == :(-1//6*log(4+x^2)+1//6*log(1+x^2))
@test integrate((4+-5*sin(x))^-1, x) == :(-1//3*log(-2*sin((1/2)*x)+cos((1/2)*x))+1//3*log(-1*sin((1/2)*x)+2*cos((1/2)*x)))
@test integrate(x*(c+x)^1//3, x) == :(3//7*(c+x)^7//3+-3//4*c*(c+x)^4//3)
@test integrate(exp(x^1//3), x) == :(6*exp(x^1//3)+-6*x^1//3*exp(x^1//3)+3*x^2//3*exp(x^1//3))
@test integrate((4+x+(1+x)^(1/2))^-1, x) == :(-2//11*11^(1/2)*arctan(1//11*11^(1/2)*(1+2*(1+x)^(1/2)))+log(4+x+(1+x)^(1/2)))
@test integrate((x^3+-1*x^2)^-1*(1+x^3), x) == :(x+x^-1+-1*log(x)+2*log(1+-1x))
@test integrate((-3+x^2+4x)*sin(2x), x) == :(7//4*cos(2x)+(1/2)*x*sin(2x)+-2*x*cos(2x)+-1//2*x^2*cos(2x)+sin(2x))
@test integrate(cos(cos(x))*sin(x), x) == :(-1*sin(cos(x)))
@test integrate((16+-1*x^2)^-1//2, x) == :(arcsin(1//4*x))
@test integrate(x^3*(1+x)^-10, x) == :(-3//8*(1+x)^-8+-1//6*(1+x)^-6+1//9*(1+x)^-9+3//7*(1+x)^-7)
@test integrate(cot(2x)^3*csc(2x)^3, x) == :(-1//10*csc(2x)^5+1//6*csc(2x)^3)
@test integrate((x+sin(x))^2, x) == :((1/2)*x+2*sin(x)+1//3*x^3+-2*x*cos(x)+-1//2*cos(x)*sin(x))
@test integrate((1+x^2)^-1*exp(arctan(x)), x) == :(exp(arctan(x)))
@test integrate(x^-1*(1+x^4)^-1, x) == :(-1//4*log(1+x^4)+log(x))
@test integrate(t^3*exp(-2t), t) == :(-3//8*exp(-2t)+-3//4*t*exp(-2t)+-3//4*t^2*exp(-2t)+-1//2*t^3*exp(-2t))
@test integrate(t^(1/2)*(1+t^1//3)^-1, t) == :(-6*t^1//6+2*t^(1/2)+6*arctan(t^1//6)+-6//5*t^5//6+6//7*t^7//6)
@test integrate(sin(x)*sin(2x)*sin(3x), x) == :(-1//8*cos(2x)+-1//16*cos(4x)+1//24*cos(6x))
@test integrate(log((1/2)*x), x) == :(-1x+x*log((1/2)*x))
@test integrate(((1+-1x)^-1*(1+x))^(1/2), x) == :(2*arctan(((1+-1x)^-1*(1+x))^(1/2))+-1*((1+-1x)^-1*(1+x))^(1/2)*(1+-1x))
@test integrate(x*(-1+x^2)^-1//2*log(x), x) == :(-1*(-1+x^2)^(1/2)+(-1+x^2)^(1/2)*log(x)+arctan((-1+x^2)^(1/2)))
@test integrate((a^2+x^2)^-1*(a+x), x) == :((1/2)*log(a^2+x^2)+arctan(x*a^-1))
@test integrate((1+x+-1*x^2)^(1/2), x) == :(-5//8*arcsin(1//5*5^(1/2)*(1+-2x))+-1//4*(1+x+-1*x^2)^(1/2)*(1+-2x))
@test integrate(x^4*(16+x^10)^-1, x) == :(1//20*arctan(1//4*x^5))
@test integrate((2+x+x^2)^-1*(2+x), x) == :((1/2)*log(2+x+x^2)+3//7*7^(1/2)*arctan(1//7*7^(1/2)*(1+2x)))
@test integrate(x*sec(x)*tan(x), x) == :(-1*arctanh(sin(x))+x*sec(x))
@test integrate(x*(x^4+-1*a^4)^-1, x) == :(-1//2*a^-2*arctanh(a^-2*x^2))
@test integrate((x^(1/2)+(1+x)^(1/2))^-1, x) == :(-2//3*x^3//2+2//3*(1+x)^3//2)
@test integrate((1+-1*exp(-1x)+2*exp(x))^-1, x) == :(-1//3*log(1+exp(x))+1//3*log(1+-2*exp(x)))
@test integrate(x^-1//2*arctan(x^(1/2)), x) == :(-1*log(1+x)+2*x^(1/2)*arctan(x^(1/2)))
@test integrate(x^-2*log(1+x), x) == :(-1*log(1+x)+-1*x^-1*log(1+x)+log(x))
@test integrate((-1*exp(x)+exp(3x))^-1, x) == :(-1*arctanh(exp(x))+exp(-1x))
@test integrate((1+-1*cos(x)^2)^-1*(1+cos(x)^2), x) == :(-1x+-2*cot(x))
@test integrate(x^-1*(-25+2x)^-1//2, x) == :(2//5*arctan(1//5*(-25+2x)^(1/2)))
@test integrate((9+-1*cos(x)^4)^-1//2*sin(2x), x) == :(-1*arcsin(1//3*cos(x)^2))
@test integrate(x^2*(5+-4*x^2)^-1//2, x) == :(5//16*arcsin(2//5*x*5^(1/2))+-1//8*x*(5+-4*x^2)^(1/2))
@test integrate(x^3*sin(x), x) == :(-6*sin(x)+-1*x^3*cos(x)+3*x^2*sin(x)+6*x*cos(x))
@test integrate(x*(4+x^2+2x)^(1/2), x) == :(-3//2*arcsinh(1//3*3^(1/2)*(1+x))+1//3*(4+x^2+2x)^3//2+-1//2*(4+x^2+2x)^(1/2)*(1+x))
@test integrate(x*(5+x^2)^8, x) == :(1//18*(5+x^2)^9)
@test integrate(cos(x)^2*sin(x)^5, x) == :(-1//3*cos(x)^3+-1//7*cos(x)^7+2//5*cos(x)^5)
@test integrate(cos(4x)*exp(-3x), x) == :(-3//25*cos(4x)*exp(-3x)+4//25*exp(-3x)*sin(4x))
@test integrate(csc((1/2)*x)^3, x) == :(-1*arctanh(cos((1/2)*x))+-1*cot((1/2)*x)*csc((1/2)*x))
@test integrate(x^-2*(-1+9*x^2)^(1/2), x) == :(3*arctanh(3*x*(-1+9*x^2)^-1//2)+-1*x^-1*(-1+9*x^2)^(1/2))
@test integrate(x^-1*(4+-3*x^2)^(1/2), x) == :((4+-3*x^2)^(1/2)+-2*arctanh((1/2)*(4+-3*x^2)^(1/2)))
@test integrate(x^2*exp(3x), x) == :(2//27*exp(3x)+-2//9*x*exp(3x)+1//3*x^2*exp(3x))
@test integrate((1+sin(x))^-1//2*cos(x)*sin(x), x) == :(-2*(1+sin(x))^(1/2)+2//3*(1+sin(x))^3//2)
@test integrate(x*arcsin(x^2), x) == :((1/2)*(1+-1*x^4)^(1/2)+(1/2)*x^2*arcsin(x^2))
@test integrate(x^3*arcsin(x^2), x) == :(-1//8*arcsin(x^2)+1//4*x^4*arcsin(x^2)+1//8*x^2*(1+-1*x^4)^(1/2))
@test integrate(exp(x)*sech(exp(x)), x) == :(arctan(sinh(exp(x))))
@test integrate(x^2*cos(3x), x) == :(-2//27*sin(3x)+1//3*x^2*sin(3x)+2//9*x*cos(3x))
@test integrate((5+-1*x^2+-4x)^(1/2), x) == :(-9//2*arcsin(-2//3+-1//3*x)+(1/2)*(5+-1*x^2+-4x)^(1/2)*(2+x))
@test integrate(x^5*(2^(1/2)+x^2)^-1, x) == :(1//4*x^4+-1//2*2^(1/2)*x^2+log(2^(1/2)+x^2))
@test integrate(sec(x)^5, x) == :(3//8*arctanh(sin(x))+1//4*sec(x)^3*tan(x)+3//8*sec(x)*tan(x))
@test integrate(sin(2x)^6, x) == :(5//16*x+-5//32*cos(2x)*sin(2x)+-5//48*sin(2x)^3*cos(2x)+-1//12*sin(2x)^5*cos(2x))
@test integrate(sin(x)^2*cos(x)*log(sin(x)), x) == :(-1//9*sin(x)^3+1//3*sin(x)^3*log(sin(x)))
@test integrate((1+2*exp(x))^-1*exp(-1x), x) == :(-1*exp(-1x)+-2x+2*log(1+2*exp(x)))
@test integrate((2+3*cos(x))^(1/2)*tan(x), x) == :(-2*(2+3*cos(x))^(1/2)+2*2^(1/2)*arctanh((1/2)*2^(1/2)*(2+3*cos(x))^(1/2)))
@test integrate(x*(x^2+-4x)^-1//2, x) == :((x^2+-4x)^(1/2)+4*arctanh(x*(x^2+-4x)^-1//2))
@test integrate(cos(x)^5, x) == :(-2//3*sin(x)^3+1//5*sin(x)^5+sin(x))
@test integrate(x^4*exp(-1x), x) == :(-24*exp(-1x)+-1*x^4*exp(-1x)+-24*x*exp(-1x)+-12*x^2*exp(-1x)+-4*x^3*exp(-1x))
@test integrate(x^4*(-2+x^10)^-1//2, x) == :(1//5*arctanh(x^5*(-2+x^10)^-1//2))
@test integrate(cos(4+3x)*exp(x), x) == :(1//10*cos(4+3x)*exp(x)+3//10*exp(x)*sin(4+3x))
@test integrate(x^2*arctan(x), x) == :(-1//6*x^2+1//6*log(1+x^2)+1//3*x^3*arctan(x))
@test integrate((-1+exp(2x))^(1/2), x) == :((-1+exp(2x))^(1/2)+-1*arctan((-1+exp(2x))^(1/2)))
@test integrate(exp(sin(x))*sin(2x), x) == :(-2*exp(sin(x))+2*exp(sin(x))*sin(x))
@test integrate(x^2*(5+-1*x^2)^(1/2), x) == :(25//8*arcsin(1//5*x*5^(1/2))+-5//8*x*(5+-1*x^2)^(1/2)+1//4*x^3*(5+-1*x^2)^(1/2))
@test integrate(x^2*(1+x^3)^4, x) == :(1//15*(1+x^3)^5)
@test integrate(cos(x)^3*sin(x)^3, x) == :(-1//6*sin(x)^6+1//4*sin(x)^4)
@test integrate(sec(x)^4*tan(x)^2, x) == :(1//3*tan(x)^3+1//5*tan(x)^5)
@test integrate(x*(1+2x)^(1/2), x) == :(-1//6*(1+2x)^3//2+1//10*(1+2x)^5//2)
@test integrate(sin(x)^4, x) == :(3//8*x+-3//8*cos(x)*sin(x)+-1//4*sin(x)^3*cos(x))
@test integrate(tan(x)^3, x) == :((1/2)*tan(x)^2+log(cos(x)))
@test integrate(x^5*(1+x^2)^(1/2), x) == :(-2//5*(1+x^2)^5//2+1//3*(1+x^2)^3//2+1//7*(1+x^2)^7//2)