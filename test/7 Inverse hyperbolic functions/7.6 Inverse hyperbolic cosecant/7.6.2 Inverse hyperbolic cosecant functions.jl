using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x^3*arccsch(a+b*x), x) == :(1//4*x^4*arccsch(a+b*x)+-1//4*a^4*b^-4*arccsch(a+b*x)+(1/2)*a*b^-4*(1+-2*a^2)*arctanh((1+(a+b*x)^-2)^(1/2))+-1//3*a*b^-4*(1+(a+b*x)^-2)^(1/2)*(a+b*x)^2+-1//12*b^-4*(1+(a+b*x)^-2)^(1/2)*(2+-17*a^2)*(a+b*x)+1//12*b^-2*x^2*(1+(a+b*x)^-2)^(1/2)*(a+b*x))
@test integrate(x^2*arccsch(a+b*x), x) == :(1//3*x^3*arccsch(a+b*x)+-1//6*b^-3*(1+-6*a^2)*arctanh((1+(a+b*x)^-2)^(1/2))+1//3*a^3*b^-3*arccsch(a+b*x)+-5//6*a*b^-3*(1+(a+b*x)^-2)^(1/2)*(a+b*x)+1//6*x*b^-2*(1+(a+b*x)^-2)^(1/2)*(a+b*x))
@test integrate(x*arccsch(a+b*x), x) == :((1/2)*x^2*arccsch(a+b*x)+(1/2)*b^-2*(1+(a+b*x)^-2)^(1/2)*(a+b*x)+-1*a*b^-2*arctanh((1+(a+b*x)^-2)^(1/2))+-1//2*a^2*b^-2*arccsch(a+b*x))
@test integrate(x^-1*arccsch(a+b*x), x) == :(-1//2*Polylogarithms.polylog(2,exp(2*arccsch(a+b*x)))+arccsch(a+b*x)*log(1+-1*a*(1+(1+a^2)^(1/2))^-1*exp(arccsch(a+b*x)))+arccsch(a+b*x)*log(1+-1*a*(1+-1*(1+a^2)^(1/2))^-1*exp(arccsch(a+b*x)))+-1*arccsch(a+b*x)*log(1+-1*exp(2*arccsch(a+b*x)))+Polylogarithms.polylog(2,a*(1+(1+a^2)^(1/2))^-1*exp(arccsch(a+b*x)))+Polylogarithms.polylog(2,a*(1+-1*(1+a^2)^(1/2))^-1*exp(arccsch(a+b*x))))
@test integrate(x^-2*arccsch(a+b*x), x) == :(-1*x^-1*arccsch(a+b*x)+-1*b*a^-1*arccsch(a+b*x)+2*b*a^-1*(1+a^2)^-1//2*arctanh((1+a^2)^-1//2*(a+tanh((1/2)*arccsch(a+b*x)))))
@test integrate(x^-3*arccsch(a+b*x), x) == :(-1//2*x^-2*arccsch(a+b*x)+(1/2)*a^-2*b^2*arccsch(a+b*x)+-1*a^-2*b^2*(1+a^2)^-3//2*(1+2*a^2)*arctanh((1+a^2)^-1//2*(a+tanh((1/2)*arccsch(a+b*x))))+(1/2)*b*a^-1*x^-1*(1+a^2)^-1*(1+(a+b*x)^-2)^(1/2)*(a+b*x))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x)^3, x) == :(1//4*f^-1*(a+b*arccsch(c+d*x))^2*(e+f*x)^4+-2*b^2*d^-4*(d*e+-1*c*f)^3*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+2*b^2*d^-4*(d*e+-1*c*f)^3*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+-1//3*b^2*d^-4*f^3*log(c+d*x)+-1//4*d^-4*f^-1*(a+b*arccsch(c+d*x))^2*(d*e+-1*c*f)^4+1//12*b^2*d^-4*f^3*(c+d*x)^2+x*b^2*d^-3*f^2*(d*e+-1*c*f)+b^2*d^-4*f^2*(d*e+-1*c*f)*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+-1*b^2*d^-4*f^2*(d*e+-1*c*f)*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+3*f*b^2*d^-4*(d*e+-1*c*f)^2*log(c+d*x)+4*b*d^-4*(d*e+-1*c*f)^3*(a+b*arccsch(c+d*x))*arctanh(exp(arccsch(c+d*x)))+-2*b*d^-4*f^2*(a+b*arccsch(c+d*x))*(d*e+-1*c*f)*arctanh(exp(arccsch(c+d*x)))+-1//3*b*d^-4*f^3*(1+(c+d*x)^-2)^(1/2)*(a+b*arccsch(c+d*x))*(c+d*x)+1//6*b*d^-4*f^3*(1+(c+d*x)^-2)^(1/2)*(c+d*x)^3*(a+b*arccsch(c+d*x))+b*d^-4*f^2*(1+(c+d*x)^-2)^(1/2)*(c+d*x)^2*(a+b*arccsch(c+d*x))*(d*e+-1*c*f)+3*b*f*d^-4*(1+(c+d*x)^-2)^(1/2)*(d*e+-1*c*f)^2*(a+b*arccsch(c+d*x))*(c+d*x))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x)^2, x) == :(1//3*f^-1*(a+b*arccsch(c+d*x))^2*(e+f*x)^3+-2*b^2*d^-3*(d*e+-1*c*f)^2*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+2*b^2*d^-3*(d*e+-1*c*f)^2*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+-1//3*b^2*d^-3*f^2*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+-1//3*d^-3*f^-1*(a+b*arccsch(c+d*x))^2*(d*e+-1*c*f)^3+1//3*x*b^2*d^-2*f^2+1//3*b^2*d^-3*f^2*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+2*f*b^2*d^-3*(d*e+-1*c*f)*log(c+d*x)+4*b*d^-3*(d*e+-1*c*f)^2*(a+b*arccsch(c+d*x))*arctanh(exp(arccsch(c+d*x)))+-2//3*b*d^-3*f^2*(a+b*arccsch(c+d*x))*arctanh(exp(arccsch(c+d*x)))+1//3*b*d^-3*f^2*(1+(c+d*x)^-2)^(1/2)*(c+d*x)^2*(a+b*arccsch(c+d*x))+2*b*f*d^-3*(1+(c+d*x)^-2)^(1/2)*(a+b*arccsch(c+d*x))*(c+d*x)*(d*e+-1*c*f))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x), x) == :((1/2)*f^-1*(a+b*arccsch(c+d*x))^2*(e+f*x)^2+f*b^2*d^-2*log(c+d*x)+-2*b^2*d^-2*(d*e+-1*c*f)*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+2*b^2*d^-2*(d*e+-1*c*f)*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+-1//2*d^-2*f^-1*(a+b*arccsch(c+d*x))^2*(d*e+-1*c*f)^2+4*b*d^-2*(a+b*arccsch(c+d*x))*(d*e+-1*c*f)*arctanh(exp(arccsch(c+d*x)))+b*f*d^-2*(1+(c+d*x)^-2)^(1/2)*(a+b*arccsch(c+d*x))*(c+d*x))
@test integrate((a+b*arccsch(c+d*x))^2, x) == :(d^-1*(a+b*arccsch(c+d*x))^2*(c+d*x)+-2*b^2*d^-1*Polylogarithms.polylog(2,exp(arccsch(c+d*x)))+2*b^2*d^-1*Polylogarithms.polylog(2,-1*exp(arccsch(c+d*x)))+4*b*d^-1*(a+b*arccsch(c+d*x))*arctanh(exp(arccsch(c+d*x))))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x)^-1, x) == :(f^-1*(a+b*arccsch(c+d*x))^2*log(1+(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+f^-1*(a+b*arccsch(c+d*x))^2*log(1+(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+(1/2)*b^2*f^-1*Polylogarithms.polylog(3,exp(2*arccsch(c+d*x)))+-1*f^-1*(a+b*arccsch(c+d*x))^2*log(1+-1*exp(2*arccsch(c+d*x)))+-2*b^2*f^-1*Polylogarithms.polylog(3,-1*(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-2*b^2*f^-1*Polylogarithms.polylog(3,-1*(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-1*b*f^-1*(a+b*arccsch(c+d*x))*Polylogarithms.polylog(2,exp(2*arccsch(c+d*x)))+2*b*f^-1*(a+b*arccsch(c+d*x))*Polylogarithms.polylog(2,-1*(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+2*b*f^-1*(a+b*arccsch(c+d*x))*Polylogarithms.polylog(2,-1*(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x))))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x)^-2, x) == :(-1*f^-1*(a+b*arccsch(c+d*x))^2*(e+f*x)^-1+d*f^-1*(a+b*arccsch(c+d*x))^2*(d*e+-1*c*f)^-1+-2*d*b^2*(d*e+-1*c*f)^-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*Polylogarithms.polylog(2,-1*(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+2*d*b^2*(d*e+-1*c*f)^-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*Polylogarithms.polylog(2,-1*(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-2*b*d*(d*e+-1*c*f)^-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*(a+b*arccsch(c+d*x))*log(1+(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+2*b*d*(d*e+-1*c*f)^-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*(a+b*arccsch(c+d*x))*log(1+(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x))))
@test integrate((a+b*arccsch(c+d*x))^2*(e+f*x)^-3, x) == :(-1//2*f^-1*(a+b*arccsch(c+d*x))^2*(e+f*x)^-2+(1/2)*d^2*f^-1*(a+b*arccsch(c+d*x))^2*(d*e+-1*c*f)^-2+-2*b^2*d^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*Polylogarithms.polylog(2,-1*(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+2*b^2*d^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*Polylogarithms.polylog(2,-1*(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+f*b^2*d^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1*log(f+(c+d*x)^-1*(d*e+-1*c*f))+b^2*d^2*f^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-3//2*Polylogarithms.polylog(2,-1*(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-1*b^2*d^2*f^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-3//2*Polylogarithms.polylog(2,-1*(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-2*b*d^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*(a+b*arccsch(c+d*x))*log(1+(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+2*b*d^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1//2*(a+b*arccsch(c+d*x))*log(1+(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+b*d^2*f^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-3//2*(a+b*arccsch(c+d*x))*log(1+(f+-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-1*b*d^2*f^2*(d*e+-1*c*f)^-2*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-3//2*(a+b*arccsch(c+d*x))*log(1+(f+(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^(1/2))^-1*(d*e+-1*c*f)*exp(arccsch(c+d*x)))+-1*b*f*d^2*(1+(c+d*x)^-2)^(1/2)*(f+(c+d*x)^-1*(d*e+-1*c*f))^-1*(d*e+-1*c*f)^-1*(d^2*e^2+f^2*(1+c^2)+-2*c*d*e*f)^-1*(a+b*arccsch(c+d*x)))
@test integrate(x^3*arccsch(x^(1/2)), x) == :(1//4*x^4*arccsch(x^(1/2))+-3//20*x^(1/2)*(-1x)^-1//2*(-1+-1x)^5//2+-1//4*x^(1/2)*(-1x)^-1//2*(-1+-1x)^(1/2)+-1//4*x^(1/2)*(-1x)^-1//2*(-1+-1x)^3//2+-1//28*x^(1/2)*(-1x)^-1//2*(-1+-1x)^7//2)
@test integrate(x^2*arccsch(x^(1/2)), x) == :(1//3*x^3*arccsch(x^(1/2))+1//3*x^(1/2)*(-1x)^-1//2*(-1+-1x)^(1/2)+1//15*x^(1/2)*(-1x)^-1//2*(-1+-1x)^5//2+2//9*x^(1/2)*(-1x)^-1//2*(-1+-1x)^3//2)
@test integrate(x*arccsch(x^(1/2)), x) == :((1/2)*x^2*arccsch(x^(1/2))+-1//2*x^(1/2)*(-1x)^-1//2*(-1+-1x)^(1/2)+-1//6*x^(1/2)*(-1x)^-1//2*(-1+-1x)^3//2)
@test integrate(arccsch(x^(1/2)), x) == :(x*arccsch(x^(1/2))+x^(1/2)*(-1x)^-1//2*(-1+-1x)^(1/2))
@test integrate(x^-1*arccsch(x^(1/2)), x) == :(arccsch(x^(1/2))^2+-1*Polylogarithms.polylog(2,exp(2*arccsch(x^(1/2))))+-2*arccsch(x^(1/2))*log(1+-1*exp(2*arccsch(x^(1/2)))))
@test integrate(x^-2*arccsch(x^(1/2)), x) == :(-1*x^-1*arccsch(x^(1/2))+(1/2)*x^-1//2*(-1x)^-1//2*(-1+-1x)^(1/2)+-1//2*x^(1/2)*(-1x)^-1//2*arctan((-1+-1x)^(1/2)))
@test integrate(x^-3*arccsch(x^(1/2)), x) == :(-1//2*x^-2*arccsch(x^(1/2))+-3//16*x^-1//2*(-1x)^-1//2*(-1+-1x)^(1/2)+1//8*x^-3//2*(-1x)^-1//2*(-1+-1x)^(1/2)+3//16*x^(1/2)*(-1x)^-1//2*arctan((-1+-1x)^(1/2)))
@test integrate(x^-4*arccsch(x^(1/2)), x) == :(-1//3*x^-3*arccsch(x^(1/2))+-5//48*x^(1/2)*(-1x)^-1//2*arctan((-1+-1x)^(1/2))+-5//72*x^-3//2*(-1x)^-1//2*(-1+-1x)^(1/2)+1//18*x^-5//2*(-1x)^-1//2*(-1+-1x)^(1/2)+5//48*x^-1//2*(-1x)^-1//2*(-1+-1x)^(1/2))
@test integrate(arccsch(x^-1), x) == :(-1*(1+x^2)^(1/2)+x*arcsinh(x))
@test integrate(x^-1*arccsch(a*x^n), x) == :((1/2)*n^-1*arccsch(a*x^n)^2+-1//2*n^-1*Polylogarithms.polylog(2,exp(2*arccsch(a*x^n)))+-1*n^-1*arccsch(a*x^n)*log(1+-1*exp(2*arccsch(a*x^n))))
@test integrate(x^-1*arccsch(a*x^5), x) == :(-1//10*Polylogarithms.polylog(2,exp(2*arccsch(a*x^5)))+1//10*arccsch(a*x^5)^2+-1//5*arccsch(a*x^5)*log(1+-1*exp(2*arccsch(a*x^5))))
@test integrate(arccsch(c*exp(a+b*x)), x) == :((1/2)*b^-1*arccsch(c*exp(a+b*x))^2+-1//2*b^-1*Polylogarithms.polylog(2,exp(2*arccsch(c*exp(a+b*x))))+-1*b^-1*arccsch(c*exp(a+b*x))*log(1+-1*exp(2*arccsch(c*exp(a+b*x)))))
@test integrate(x^4*exp(arccsch(a*x)), x) == :(1//4*a^-1*x^4+1//5*x^5*(1+a^-2*x^-2)^3//2+-2//15*a^-2*x^3*(1+a^-2*x^-2)^3//2)
@test integrate(x^3*exp(arccsch(a*x)), x) == :(-1//8*a^-4*arctanh((1+a^-2*x^-2)^(1/2))+1//3*a^-1*x^3+1//4*x^4*(1+a^-2*x^-2)^(1/2)+1//8*a^-2*x^2*(1+a^-2*x^-2)^(1/2))
@test integrate(x^2*exp(arccsch(a*x)), x) == :((1/2)*a^-1*x^2+1//3*x^3*(1+a^-2*x^-2)^3//2)
@test integrate(x*exp(arccsch(a*x)), x) == :(x*a^-1+(1/2)*a^-2*arctanh((1+a^-2*x^-2)^(1/2))+(1/2)*x^2*(1+a^-2*x^-2)^(1/2))
@test integrate(x^-1*exp(arccsch(a*x)), x) == :(-1*(1+a^-2*x^-2)^(1/2)+-1*a^-1*x^-1+arctanh((1+a^-2*x^-2)^(1/2)))
@test integrate(x^-2*exp(arccsch(a*x)), x) == :(-1//2*a*arccsch(a*x)+-1//2*a^-1*x^-2+-1//2*x^-1*(1+a^-2*x^-2)^(1/2))
@test integrate(x^-3*exp(arccsch(a*x)), x) == :(-1//3*a^-1*x^-3+-1//3*a^2*(1+a^-2*x^-2)^3//2)
@test integrate(x^-4*exp(arccsch(a*x)), x) == :(-1//4*a^-1*x^-4+-1//4*x^-3*(1+a^-2*x^-2)^(1/2)+1//8*a^3*arccsch(a*x)+-1//8*a^2*x^-1*(1+a^-2*x^-2)^(1/2))
@test integrate(x^-5*exp(arccsch(a*x)), x) == :(-1//5*a^-1*x^-5+-1//5*a^4*(1+a^-2*x^-2)^5//2+1//3*a^4*(1+a^-2*x^-2)^3//2)
@test integrate(x^4*exp(arccsch(a*x^2)), x) == :(1//3*a^-1*x^3+1//5*x^5*(1+a^-2*x^-4)^(1/2)+2//5*x*a^-2*(1+a^-2*x^-4)^(1/2)+-2//5*a^-2*x^-1*(1+a^-2*x^-4)^(1/2)*(a+x^-2)^-1+-1//5*a^-7//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.F(2*arccot(x*a^(1/2)),1/2)+2//5*a^-7//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.E(2*arccot(x*a^(1/2)),1/2))
@test integrate(x^3*exp(arccsch(a*x^2)), x) == :((1/2)*a^-1*x^2+1//4*a^-2*arctanh((1+a^-2*x^-4)^(1/2))+1//4*x^4*(1+a^-2*x^-4)^(1/2))
@test integrate(x^2*exp(arccsch(a*x^2)), x) == :(x*a^-1+1//3*x^3*(1+a^-2*x^-4)^(1/2)+-1//3*a^-5//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.F(2*arccot(x*a^(1/2)),1/2))
@test integrate(x*exp(arccsch(a*x^2)), x) == :(a^-1*log(x)+(1/2)*x^2*(1+a^-2*x^-4)^(1/2)+-1//2*a^-1*arccsch(a*x^2))
@test integrate(exp(arccsch(a*x^2)), x) == :(x*(1+a^-2*x^-4)^(1/2)+-1*a^-1*x^-1+-2*x^-1*(1+a^-2*x^-4)^(1/2)*(a+x^-2)^-1+-1*a^-3//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.F(2*arccot(x*a^(1/2)),1/2)+2*a^-3//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.E(2*arccot(x*a^(1/2)),1/2))
@test integrate(x^-1*exp(arccsch(a*x^2)), x) == :((1/2)*arctanh((1+a^-2*x^-4)^(1/2))+-1//2*(1+a^-2*x^-4)^(1/2)+-1//2*a^-1*x^-2)
@test integrate(x^-2*exp(arccsch(a*x^2)), x) == :(-1//3*a^-1*x^-3+-1//3*x^-1*(1+a^-2*x^-4)^(1/2)+-1//3*a^-1//2*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.F(2*arccot(x*a^(1/2)),1/2))
@test integrate(x^-3*exp(arccsch(a*x^2)), x) == :(-1//4*a*arccsch(a*x^2)+-1//4*a^-1*x^-4+-1//4*x^-2*(1+a^-2*x^-4)^(1/2))
@test integrate(x^-4*exp(arccsch(a*x^2)), x) == :(-1//5*a^-1*x^-5+-1//5*x^-3*(1+a^-2*x^-4)^(1/2)+-2*a^2*x^-1*(1+a^-2*x^-4)^(1/2)*(5a+5*x^-2)^-1+-1//5*a^(1/2)*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.F(2*arccot(x*a^(1/2)),1/2)+2//5*a^(1/2)*((a+x^-2)^-2*(a^2+x^-4))^(1/2)*(1+a^-2*x^-4)^-1//2*(a+x^-2)*Elliptic.E(2*arccot(x*a^(1/2)),1/2))
@test integrate(x^-5*exp(arccsch(a*x^2)), x) == :(-1//6*a^-1*x^-6+-1//6*a^2*(1+a^-2*x^-4)^3//2)
@test integrate(x^4*exp(2*arccsch(a*x)), x) == :(1//5*x^5+-1//4*a^-5*arctanh((1+a^-2*x^-2)^(1/2))+2//3*a^-2*x^3+(1/2)*a^-1*x^4*(1+a^-2*x^-2)^(1/2)+1//4*a^-3*x^2*(1+a^-2*x^-2)^(1/2))
@test integrate(x^3*exp(2*arccsch(a*x)), x) == :(1//4*x^4+a^-2*x^2+2//3*a^-1*x^3*(1+a^-2*x^-2)^3//2)
@test integrate(x^2*exp(2*arccsch(a*x)), x) == :(1//3*x^3+a^-3*arctanh((1+a^-2*x^-2)^(1/2))+2*x*a^-2+a^-1*x^2*(1+a^-2*x^-2)^(1/2))
@test integrate(x*exp(2*arccsch(a*x)), x) == :((1/2)*x^2+-2*a^-2*arccsch(a*x)+2*a^-2*log(x)+2*x*a^-1*(1+a^-2*x^-2)^(1/2))
@test integrate(exp(2*arccsch(a*x)), x) == :(x+-2*a^-1*(1+a^-2*x^-2)^(1/2)+-2*a^-2*x^-1+2*a^-1*arctanh((1+a^-2*x^-2)^(1/2)))
@test integrate(x^-1*exp(2*arccsch(a*x)), x) == :(-1*arccsch(a*x)+-1*a^-2*x^-2+-1*a^-1*x^-1*(1+a^-2*x^-2)^(1/2)+log(x))
@test integrate(x^-3*exp(2*arccsch(a*x)), x) == :(-1//2*x^-2+-1//2*a^-2*x^-4+1//4*a^2*arccsch(a*x)+-1//2*a^-1*x^-3*(1+a^-2*x^-2)^(1/2)+-1//4*a*x^-1*(1+a^-2*x^-2)^(1/2))
@test integrate(x^-4*exp(2*arccsch(a*x)), x) == :(-1//3*x^-3+-2//5*a^-2*x^-5+-2//5*a^3*(1+a^-2*x^-2)^5//2+2//3*a^3*(1+a^-2*x^-2)^3//2)
@test integrate(x^-5*exp(2*arccsch(a*x)), x) == :(-1//4*x^-4+-1//3*a^-2*x^-6+-1//8*a^4*arccsch(a*x)+-1//3*a^-1*x^-5*(1+a^-2*x^-2)^(1/2)+-1//12*a*x^-3*(1+a^-2*x^-2)^(1/2)+1//8*a^3*x^-1*(1+a^-2*x^-2)^(1/2))
@test integrate(x^5*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(c^-6*arctan(c*x)+-1*x*c^-5+1//3*c^-3*x^3+3//8*c^-6*arctanh((1+c^-2*x^-2)^(1/2))+-3//8*c^-4*x^2*(1+c^-2*x^-2)^(1/2)+1//4*c^-2*x^4*(1+c^-2*x^-2)^(1/2))
@test integrate(x^4*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :((1/2)*c^-3*x^2+-1//2*c^-5*log(1+c^2*x^2)+-2//3*x*c^-4*(1+c^-2*x^-2)^(1/2)+1//3*c^-2*x^3*(1+c^-2*x^-2)^(1/2))
@test integrate(x^3*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(x*c^-3+-1*c^-4*arctan(c*x)+-1//2*c^-4*arctanh((1+c^-2*x^-2)^(1/2))+(1/2)*c^-2*x^2*(1+c^-2*x^-2)^(1/2))
@test integrate(x^2*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :((1/2)*c^-3*log(1+c^2*x^2)+x*c^-2*(1+c^-2*x^-2)^(1/2))
@test integrate(x*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(c^-2*arctan(c*x)+c^-2*arctanh((1+c^-2*x^-2)^(1/2)))
@test integrate((1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(c^-1*log(x)+-1*c^-1*arccsch(c*x)+-1//2*c^-1*log(1+c^2*x^2))
@test integrate(x^-1*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(-1*(1+c^-2*x^-2)^(1/2)+-1*arctan(c*x)+-1*c^-1*x^-1)
@test integrate(x^-2*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :((1/2)*c*arccsch(c*x)+(1/2)*c*log(1+c^2*x^2)+-1*c*log(x)+-1//2*c^-1*x^-2+-1//2*x^-1*(1+c^-2*x^-2)^(1/2))
@test integrate(x^-3*(1+c^2*x^2)^-1*exp(arccsch(c*x)), x) == :(c*x^-1+c^2*(1+c^-2*x^-2)^(1/2)+c^2*arctan(c*x)+-1//3*c^-1*x^-3+-1//3*c^2*(1+c^-2*x^-2)^3//2)
@test integrate((d*x+a*d*b^-1)^-1*arccsch(a+b*x), x) == :((1/2)*d^-1*arccsch(a+b*x)^2+-1//2*d^-1*Polylogarithms.polylog(2,exp(2*arccsch(a+b*x)))+-1*d^-1*arccsch(a+b*x)*log(1+-1*exp(2*arccsch(a+b*x))))
@test integrate(x^3*arccsch(a+b*x^4), x) == :(1//4*b^-1*arctanh((1+(a+b*x^4)^-2)^(1/2))+1//4*b^-1*(a+b*x^4)*arccsch(a+b*x^4))
@test integrate(x^(-1+n)*arccsch(a+b*x^n), x) == :(b^-1*n^-1*arctanh((1+(a+b*x^n)^-2)^(1/2))+b^-1*n^-1*(a+b*x^n)*arccsch(a+b*x^n))