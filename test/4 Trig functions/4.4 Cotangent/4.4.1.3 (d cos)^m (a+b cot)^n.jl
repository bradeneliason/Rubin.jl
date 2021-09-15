using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((im+cot(x))^-1*cos(x)^4, x) == :(1//32*(im+-1*cot(x))^-2+5//32*(im+cot(x))^-2+im*(-8*cot(x)+8im)^-1+3*im*(16im+16*cot(x))^-1+-1//16*im*x+-1//24*im*(im+cot(x))^-3)
@test integrate((im+cot(x))^-1*cos(x)^3, x) == :(-1//5*cos(x)^5+-1//3*im*sin(x)^3+1//5*im*sin(x)^5)
@test integrate((im+cot(x))^-1*cos(x)^2, x) == :(1//8*(im+cot(x))^-2+im*(-8*cot(x)+8im)^-1+im*(4im+4*cot(x))^-1+-1//8*im*x)
@test integrate((im+cot(x))^-1*cos(x), x) == :(-1//3*cos(x)^3+-1//3*im*sin(x)^3)
@test integrate((im+cot(x))^-1*sec(x), x) == :(-1*cos(x)+im*sin(x)+-1*im*arctanh(sin(x)))
@test integrate((im+cot(x))^-1*sec(x)^2, x) == :(-1*log(sin(x))+im*x+-1*im*tan(x)+log(tan(x)))
@test integrate((im+cot(x))^-1*sec(x)^3, x) == :((1/2)*im*arctanh(sin(x))+-1//2*im*sec(x)*tan(x)+sec(x))
@test integrate((im+cot(x))^-1*sec(x)^4, x) == :((1/2)*tan(x)^2+-1//3*im*tan(x)^3)
@test integrate((im+cot(x))^-1*sec(x)^5, x) == :(1//3*sec(x)^3+1//8*im*arctanh(sin(x))+-1//4*im*sec(x)^3*tan(x)+1//8*im*sec(x)*tan(x))
@test integrate((im+cot(x))^-1*sec(x)^6, x) == :((1/2)*tan(x)^2+1//4*tan(x)^4+-1//3*im*tan(x)^3+-1//5*im*tan(x)^5)
@test integrate((a+b*cot(x))^-1*cos(x)^4, x) == :(-1*(4*a^2+4*b^2)^-1*sin(x)^4*(b+a*cot(x))+1//8*(a^2+b^2)^-2*sin(x)^2*(4*b*(b^2+2*a^2)+a*(b^2+5*a^2)*cot(x))+-1*b*a^4*(a^2+b^2)^-3*log(a*sin(x)+b*cos(x))+1//8*a*x*(a^2+b^2)^-3*(-1*b^4+3*a^4+-6*a^2*b^2))
@test integrate((a+b*cot(x))^-1*cos(x)^3, x) == :(a*(a^2+b^2)^-1*sin(x)+-1*a*(3*a^2+3*b^2)^-1*sin(x)^3+-1*b*(3*a^2+3*b^2)^-1*cos(x)^3+b*a^3*(a^2+b^2)^-5//2*arctanh((a^2+b^2)^-1//2*(a*cos(x)+-1*b*sin(x)))+-1*a*b^2*(a^2+b^2)^-2*sin(x)+-1*b*a^2*(a^2+b^2)^-2*cos(x))
@test integrate((a+b*cot(x))^-1*cos(x)^2, x) == :((2*a^2+2*b^2)^-1*sin(x)^2*(b+a*cot(x))+(1/2)*a*x*(a^2+b^2)^-2*(a^2+-1*b^2)+-1*b*a^2*(a^2+b^2)^-2*log(a*sin(x)+b*cos(x)))
@test integrate((a+b*cot(x))^-1*cos(x), x) == :(a*(a^2+b^2)^-1*sin(x)+-1*b*(a^2+b^2)^-1*cos(x)+a*b*(a^2+b^2)^-3//2*arctanh((a^2+b^2)^-1//2*(a*cos(x)+-1*b*sin(x))))
@test integrate((a+b*cot(x))^-1*sec(x), x) == :(a^-1*arctanh(sin(x))+b*a^-1*(a^2+b^2)^-1//2*arctanh((a^2+b^2)^-1//2*(a*cos(x)+-1*b*sin(x))))
@test integrate((a+b*cot(x))^-1*sec(x)^2, x) == :(a^-1*tan(x)+-1*b*a^-2*log(a+b*cot(x))+-1*b*a^-2*log(tan(x)))
@test integrate((a+b*cot(x))^-1*sec(x)^3, x) == :((1/2)*a^-1*arctanh(sin(x))+a^-3*b^2*arctanh(sin(x))+(1/2)*a^-1*sec(x)*tan(x)+-1*b*a^-2*sec(x)+b*a^-3*(a^2+b^2)^(1/2)*arctanh((a^2+b^2)^-1//2*(a*cos(x)+-1*b*sin(x))))
@test integrate((a+b*cot(x))^-1*sec(x)^4, x) == :(1//3*a^-1*tan(x)^3+a^-3*(a^2+b^2)*tan(x)+-1//2*b*a^-2*tan(x)^2+-1*b*a^-4*(a^2+b^2)*log(a+b*cot(x))+-1*b*a^-4*(a^2+b^2)*log(tan(x)))
@test integrate((1+2*cot(x))^-1*sec(x), x) == :(2//5*5^(1/2)*arctanh(1//5*5^(1/2)*(-2*sin(x)+cos(x)))+arctanh(sin(x)))
