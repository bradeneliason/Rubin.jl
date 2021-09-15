using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+a*csc(x))^-1*cos(x)^4, x) == :(-1//3*a^-1*cos(x)^3+-1//8*x*a^-1+-1//8*a^-1*cos(x)*sin(x)+1//4*a^-1*cos(x)^3*sin(x))
@test integrate((a+a*csc(x))^-1*cos(x)^3, x) == :((1/2)*a^-1*sin(x)^2+-1//3*a^-1*sin(x)^3)
@test integrate((a+a*csc(x))^-1*cos(x)^2, x) == :(-1*a^-1*cos(x)+-1//2*x*a^-1+(1/2)*a^-1*cos(x)*sin(x))
@test integrate((a+a*csc(x))^-1*cos(x), x) == :(a^-1*sin(x)+-1*a^-1*log(1+sin(x)))
@test integrate((a+a*csc(x))^-1*sec(x), x) == :((1/2)*a^-1*sec(x)^2+(1/2)*a^-1*arctanh(sin(x))+-1//2*a^-1*sec(x)*tan(x))
@test integrate((a+a*csc(x))^-1*sec(x)^2, x) == :(-1//3*a^-1*tan(x)^3+1//3*a^-1*sec(x)^3)
@test integrate((a+a*csc(x))^-1*sec(x)^3, x) == :(1//4*a^-1*sec(x)^4+1//8*a^-1*arctanh(sin(x))+-1//4*a^-1*sec(x)^3*tan(x)+1//8*a^-1*sec(x)*tan(x))
@test integrate((a+a*csc(x))^-1*sec(x)^4, x) == :(-1//3*a^-1*tan(x)^3+-1//5*a^-1*tan(x)^5+1//5*a^-1*sec(x)^5)
@test integrate((a+b*csc(x))^-1*cos(x)^4, x) == :(-1//8*a^-4*(8*b*(a^2+-1*b^2)+-1*a*(-4*b^2+3*a^2)*sin(x))*cos(x)+-1//12*a^-2*cos(x)^3*(4b+-3*a*sin(x))+1//8*x*a^-5*(3*a^4+8*b^4+-12*a^2*b^2)+2*b*a^-5*(a^2+-1*b^2)^3//2*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
@test integrate((a+b*csc(x))^-1*cos(x)^3, x) == :(-1//3*a^-1*sin(x)^3+a^-3*(a^2+-1*b^2)*sin(x)+(1/2)*b*a^-2*sin(x)^2+-1*b*a^-4*(a^2+-1*b^2)*log(b+a*sin(x)))
@test integrate((a+b*csc(x))^-1*cos(x)^2, x) == :((1/2)*x*a^-3*(a^2+-2*b^2)+-1//2*a^-2*(2b+-1*a*sin(x))*cos(x)+2*b*a^-3*(a^2+-1*b^2)^(1/2)*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
@test integrate((a+b*csc(x))^-1*cos(x), x) == :(a^-1*sin(x)+-1*b*a^-2*log(b+a*sin(x)))
@test integrate((a+b*csc(x))^-1*sec(x), x) == :((-2b+2a)^-1*log(1+sin(x))+-1*(2a+2b)^-1*log(1+-1*sin(x))+-1*b*(a^2+-1*b^2)^-1*log(b+a*sin(x)))
@test integrate((a+b*csc(x))^-1*sec(x)^2, x) == :(-1*(a^2+-1*b^2)^-1*(b+-1*a*sin(x))*sec(x)+2*a*b*(a^2+-1*b^2)^-3//2*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
@test integrate((a+b*csc(x))^-1*sec(x)^3, x) == :(-1*(-2*b^2+2*a^2)^-1*sec(x)^2*(b+-1*a*sin(x))+-1//4*a*(a+b)^-2*log(1+-1*sin(x))+1//4*a*(a+-1b)^-2*log(1+sin(x))+-1*b*a^2*(a^2+-1*b^2)^-2*log(b+a*sin(x)))
@test integrate((a+b*csc(x))^-1*sec(x)^4, x) == :(-1*(-3*b^2+3*a^2)^-1*sec(x)^3*(b+-1*a*sin(x))+-1//3*(a^2+-1*b^2)^-2*(3*b*a^2+-1*a*(b^2+2*a^2)*sin(x))*sec(x)+2*b*a^3*(a^2+-1*b^2)^-5//2*arctanh((a^2+-1*b^2)^-1//2*(a+b*tan((1/2)*x))))
