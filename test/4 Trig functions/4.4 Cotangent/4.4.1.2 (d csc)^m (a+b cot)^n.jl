using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((im+cot(x))^-1*sin(x)^4, x) == :(-3//32*(im+cot(x))^-2+1//32*(im+-1*cot(x))^-2+-1*im*(-8*cot(x)+8im)^-1+3*im*(16im+16*cot(x))^-1+-5//16*im*x+-1//24*im*(im+cot(x))^-3)
@test integrate((im+cot(x))^-1*sin(x)^3, x) == :(-4//15*im*cos(x)^3+4//5*im*cos(x)+im*(5im+5*cot(x))^-1*sin(x)^3)
@test integrate((im+cot(x))^-1*sin(x)^2, x) == :(-1//8*(im+cot(x))^-2+im*(4im+4*cot(x))^-1+-1*im*(-8*cot(x)+8im)^-1+-3//8*im*x)
@test integrate((im+cot(x))^-1*sin(x), x) == :(2//3*im*cos(x)+im*(3im+3*cot(x))^-1*sin(x))
@test integrate((im+cot(x))^-1*csc(x), x) == :(im*(im+cot(x))^-1*csc(x))
@test integrate((im+cot(x))^-1*csc(x)^2, x) == :(-1*im*x+log(sin(x)))
@test integrate((im+cot(x))^-1*csc(x)^3, x) == :(-1*csc(x)+im*arctanh(cos(x)))
@test integrate((im+cot(x))^-1*csc(x)^4, x) == :(-1//2*cot(x)^2+im*cot(x))
@test integrate((im+cot(x))^-1*csc(x)^5, x) == :(-1//3*csc(x)^3+(1/2)*im*arctanh(cos(x))+(1/2)*im*cot(x)*csc(x))
@test integrate((im+cot(x))^-1*csc(x)^6, x) == :(-1//2*cot(x)^2+-1//4*cot(x)^4+im*cot(x)+1//3*im*cot(x)^3)
@test integrate((im+cot(x))^-1*csc(x)^7, x) == :(-1//5*csc(x)^5+3//8*im*arctanh(cos(x))+1//4*im*csc(x)^3*cot(x)+3//8*im*cot(x)*csc(x))
@test integrate((a+b*cot(x))^-1*csc(x)^6, x) == :(-1//4*b^-1*cot(x)^4+-1*b^-5*(a^2+b^2)^2*log(a+b*cot(x))+-1//2*b^-3*cot(x)^2*(a^2+2*b^2)+1//3*a*b^-2*cot(x)^3+a*b^-4*(a^2+2*b^2)*cot(x))
@test integrate((a+b*cot(x))^-1*csc(x)^4, x) == :(-1//2*b^-1*cot(x)^2+a*b^-2*cot(x)+-1*b^-3*(a^2+b^2)*log(a+b*cot(x)))
@test integrate((a+b*cot(x))^-1*csc(x)^2, x) == :(-1*b^-1*log(a+b*cot(x)))
@test integrate((a+b*cot(x))^-1*sin(x)^2, x) == :(-1*b^3*(a^2+b^2)^-2*log(a*sin(x)+b*cos(x))+-1*(2*a^2+2*b^2)^-1*sin(x)^2*(b+a*cot(x))+(1/2)*a*x*(a^2+b^2)^-2*(a^2+3*b^2))
@test integrate((a+b*cot(x))^-1*sin(x)^4, x) == :(-1*b^5*(a^2+b^2)^-3*log(a*sin(x)+b*cos(x))+-1*(4*a^2+4*b^2)^-1*sin(x)^4*(b+a*cot(x))+-1//8*(a^2+b^2)^-2*sin(x)^2*(4*b^3+a*(3*a^2+7*b^2)*cot(x))+1//8*a*x*(a^2+b^2)^-3*(3*a^4+15*b^4+10*a^2*b^2))
@test integrate((a+b*cot(x))^-1*csc(x)^5, x) == :(-1//3*b^-1*csc(x)^3+b^-4*(a^2+b^2)^3//2*arctanh((a^2+b^2)^-1//2*(b+-1*a*cot(x))*sin(x))+(1/2)*a*b^-2*arctanh(cos(x))+-1*b^-3*(a^2+b^2)*csc(x)+a*b^-4*(a^2+b^2)*arctanh(cos(x))+(1/2)*a*b^-2*cot(x)*csc(x))
@test integrate((a+b*cot(x))^-1*csc(x)^3, x) == :(-1*b^-1*csc(x)+a*b^-2*arctanh(cos(x))+b^-2*(a^2+b^2)^(1/2)*arctanh((a^2+b^2)^-1//2*(b+-1*a*cot(x))*sin(x)))
@test integrate((a+b*cot(x))^-1*csc(x), x) == :(-1*(a^2+b^2)^-1//2*arctanh((a^2+b^2)^-1//2*(-1b+a*cot(x))*sin(x)))
@test integrate((a+b*cot(x))^-1*sin(x), x) == :(b^2*(a^2+b^2)^-3//2*arctanh((a^2+b^2)^-1//2*(b+-1*a*cot(x))*sin(x))+-1*a*(a^2+b^2)^-1*cos(x)+-1*b*(a^2+b^2)^-1*sin(x))
@test integrate((a+b*cot(x))^-1*sin(x)^3, x) == :(a*(3*a^2+3*b^2)^-1*cos(x)^3+b^4*(a^2+b^2)^-5//2*arctanh((a^2+b^2)^-1//2*(b+-1*a*cot(x))*sin(x))+-1*a*(a^2+b^2)^-1*cos(x)+-1*b*(3*a^2+3*b^2)^-1*sin(x)^3+-1*b^3*(a^2+b^2)^-2*sin(x)+-1*a*b^2*(a^2+b^2)^-2*cos(x))
@test integrate((a+b*cot(x))^-2*csc(x)^2, x) == :(b^-1*(a+b*cot(x))^-1)
@test integrate((a+b*cot(x))^n*csc(x)^2, x) == :(-1*b^-1*(1+n)^-1*(a+b*cot(x))^(1+n))
