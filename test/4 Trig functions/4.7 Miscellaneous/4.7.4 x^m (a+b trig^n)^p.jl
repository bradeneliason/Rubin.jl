using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x*(a+b*sin(x)^2)^-1, x) == :(-1//4*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+1//4*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*x*a^-1//2*(a+b)^-1//2*log(1+-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*x*a^-1//2*(a+b)^-1//2*log(1+-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x^2*(a+b*sin(x)^2)^-1, x) == :((1/2)*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//4*im*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+1//4*im*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*a^-1//2*x^2*(a+b)^-1//2*log(1+-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*a^-1//2*x^2*(a+b)^-1//2*log(1+-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x^3*(a+b*sin(x)^2)^-1, x) == :(-3//8*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(4,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//8*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(4,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-3//4*a^-1//2*x^2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//4*a^-1//2*x^2*(a+b)^-1//2*Polylogarithms.polylog(2,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*a^-1//2*x^3*(a+b)^-1//2*log(1+-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-3//4*im*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*a^-1//2*x^3*(a+b)^-1//2*log(1+-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//4*im*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x*(a+b*sin(c+d*x)^2)^-2, x) == :(-1//4*a^-1*d^-2*(a+b)^-1*log(b+2a+-1*b*cos(2c+2*d*x))+-1//8*a^-3//2*d^-2*(a+b)^-3//2*(b+2a)*Polylogarithms.polylog(2,b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+1//8*a^-3//2*d^-2*(a+b)^-3//2*(b+2a)*Polylogarithms.polylog(2,b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+(1/2)*b*x*a^-1*d^-1*(a+b)^-1*(b+2a+-1*b*cos(2c+2*d*x))^-1*sin(2c+2*d*x)+-1//4*im*x*a^-3//2*d^-1*(a+b)^-3//2*(b+2a)*log(1+-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+1//4*im*x*a^-3//2*d^-1*(a+b)^-3//2*(b+2a)*log(1+-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x))))
@test integrate(x*(sin(x)^2)^(1/2), x) == :((sin(x)^2)^(1/2)+-1*x*(sin(x)^2)^(1/2)*cot(x))
@test integrate(x*(a+b*cos(x)^2)^-1, x) == :(-1//4*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+1//4*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*x*a^-1//2*(a+b)^-1//2*log(1+b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*x*a^-1//2*(a+b)^-1//2*log(1+b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x^2*(a+b*cos(x)^2)^-1, x) == :((1/2)*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//4*im*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+1//4*im*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*a^-1//2*x^2*(a+b)^-1//2*log(1+b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*a^-1//2*x^2*(a+b)^-1//2*log(1+b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x^3*(a+b*cos(x)^2)^-1, x) == :(-3//8*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(4,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//8*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(4,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-3//4*a^-1//2*x^2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//4*a^-1//2*x^2*(a+b)^-1//2*Polylogarithms.polylog(2,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+(1/2)*im*a^-1//2*x^3*(a+b)^-1//2*log(1+b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-3//4*im*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+-1//2*im*a^-1//2*x^3*(a+b)^-1//2*log(1+b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x))+3//4*im*x*a^-1//2*(a+b)^-1//2*Polylogarithms.polylog(3,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*x)))
@test integrate(x*(a+b*cos(c+d*x)^2)^-2, x) == :(-1//4*a^-1*d^-2*(a+b)^-1*log(b+2a+b*cos(2c+2*d*x))+-1//8*a^-3//2*d^-2*(a+b)^-3//2*(b+2a)*Polylogarithms.polylog(2,-1*b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+1//8*a^-3//2*d^-2*(a+b)^-3//2*(b+2a)*Polylogarithms.polylog(2,-1*b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+-1//2*b*x*a^-1*d^-1*(a+b)^-1*(b+2a+b*cos(2c+2*d*x))^-1*sin(2c+2*d*x)+-1//4*im*x*a^-3//2*d^-1*(a+b)^-3//2*(b+2a)*log(1+b*(b+2a+-2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x)))+1//4*im*x*a^-3//2*d^-1*(a+b)^-3//2*(b+2a)*log(1+b*(b+2a+2*a^(1/2)*(a+b)^(1/2))^-1*exp(2*im*(c+d*x))))
