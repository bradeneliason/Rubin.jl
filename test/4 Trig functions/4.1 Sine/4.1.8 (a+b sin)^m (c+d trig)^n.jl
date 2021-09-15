using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*sin(x))^-1*(A+B*cos(x)), x) == :(B*b^-1*log(a+b*sin(x))+2*A*(a^2+-1*b^2)^-1//2*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x))))
@test integrate((1+sin(x))^-1*(A+B*cos(x)), x) == :(B*log(1+sin(x))+-1*A*(1+sin(x))^-1*cos(x))
@test integrate((1+-1*sin(x))^-1*(A+B*cos(x)), x) == :(-1*B*log(1+-1*sin(x))+A*(1+-1*sin(x))^-1*cos(x))
@test integrate((a+b*sin(x))^-1*(b+c+cos(x)), x) == :(b^-1*log(a+b*sin(x))+(a^2+-1*b^2)^-1//2*(2b+2c)*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x))))
@test integrate((a+-1*b*sin(x))^-1*(b+c+cos(x)), x) == :(-1*b^-1*log(a+-1*b*sin(x))+-1*(a^2+-1*b^2)^-1//2*(2b+2c)*arctan((a^2+-1*b^2)^-1//2*(b+-1*a*tan((1/2)*x))))
@test integrate((a+b*sin(x))^-1*(A+B*tan(x)), x) == :(-1*B*(-2b+2a)^-1*log(1+sin(x))+-1*B*(2a+2b)^-1*log(1+-1*sin(x))+2*A*(a^2+-1*b^2)^-1//2*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x)))+B*a*(a^2+-1*b^2)^-1*log(a+b*sin(x)))
@test integrate((a+b*sin(x))^-1*(A+B*cot(x)), x) == :(B*a^-1*log(sin(x))+-1*B*a^-1*log(a+b*sin(x))+2*A*(a^2+-1*b^2)^-1//2*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x))))
@test integrate((a+b*sin(x))^-1*(A+B*sec(x)), x) == :(B*(-2b+2a)^-1*log(1+sin(x))+-1*B*(2a+2b)^-1*log(1+-1*sin(x))+2*A*(a^2+-1*b^2)^-1//2*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x)))+-1*B*b*(a^2+-1*b^2)^-1*log(a+b*sin(x)))
@test integrate((a+b*sin(x))^-1*(A+B*csc(x)), x) == :(-1*B*a^-1*arctanh(cos(x))+a^-1*(a^2+-1*b^2)^-1//2*(-2*B*b+2*A*a)*arctan((a^2+-1*b^2)^-1//2*(b+a*tan((1/2)*x))))
