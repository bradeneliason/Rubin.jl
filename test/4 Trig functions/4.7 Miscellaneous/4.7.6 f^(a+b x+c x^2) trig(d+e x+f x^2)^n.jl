using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(F^(c*(a+b*x))*sin(d+e*x)^3, x) == :(-6*F^(c*(a+b*x))*e^3*(9*e^4+b^4*c^4*log(F)^4+10*b^2*c^2*e^2*log(F)^2)^-1*cos(d+e*x)+-3*e*F^(c*(a+b*x))*(9*e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)^2*cos(d+e*x)+b*c*F^(c*(a+b*x))*(9*e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)^3*log(F)+6*b*c*F^(c*(a+b*x))*e^2*(9*e^4+b^4*c^4*log(F)^4+10*b^2*c^2*e^2*log(F)^2)^-1*log(F)*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*sin(d+e*x)^2, x) == :(-2*e*F^(c*(a+b*x))*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*sin(d+e*x)+b*c*F^(c*(a+b*x))*(4*e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)^2*log(F)+2*F^(c*(a+b*x))*b^-1*c^-1*e^2*(4*e^2+b^2*c^2*log(F)^2)^-1*log(F)^-1)
@test integrate(F^(c*(a+b*x))*sin(d+e*x), x) == :(-1*e*F^(c*(a+b*x))*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)+b*c*F^(c*(a+b*x))*(e^2+b^2*c^2*log(F)^2)^-1*log(F)*sin(d+e*x))
@test integrate(sin(x)^4*exp(x), x) == :(24//85*exp(x)+1//17*sin(x)^4*exp(x)+12//85*sin(x)^2*exp(x)+-24//85*cos(x)*exp(x)*sin(x)+-4//17*sin(x)^3*cos(x)*exp(x))
@test integrate(F^(c*(a+b*x))*cos(d+e*x)^3, x) == :(6*F^(c*(a+b*x))*e^3*(9*e^4+b^4*c^4*log(F)^4+10*b^2*c^2*e^2*log(F)^2)^-1*sin(d+e*x)+3*e*F^(c*(a+b*x))*(9*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)^2*sin(d+e*x)+b*c*F^(c*(a+b*x))*(9*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)^3*log(F)+6*b*c*F^(c*(a+b*x))*e^2*(9*e^4+b^4*c^4*log(F)^4+10*b^2*c^2*e^2*log(F)^2)^-1*cos(d+e*x)*log(F))
@test integrate(F^(c*(a+b*x))*cos(d+e*x)^2, x) == :(2*e*F^(c*(a+b*x))*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*sin(d+e*x)+b*c*F^(c*(a+b*x))*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)^2*log(F)+2*F^(c*(a+b*x))*b^-1*c^-1*e^2*(4*e^2+b^2*c^2*log(F)^2)^-1*log(F)^-1)
@test integrate(F^(c*(a+b*x))*cos(d+e*x), x) == :(e*F^(c*(a+b*x))*(e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)+b*c*F^(c*(a+b*x))*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*log(F))
@test integrate(cos(x)^4*exp(x), x) == :(24//85*exp(x)+1//17*cos(x)^4*exp(x)+12//85*cos(x)^2*exp(x)+4//17*cos(x)^3*exp(x)*sin(x)+24//85*cos(x)*exp(x)*sin(x))
@test integrate(F^(c*(a+b*x))*(f*x)^m*sin(d+e*x)^2, x) == :(F^(a*c)*(f*x)^m*(x*(2*im*e+-1*b*c*log(F)))^(-1m)*(8*im*e+-4*b*c*log(F))^-1*SpecialFunctions.gamma(1+m,x*(2*im*e+-1*b*c*log(F)))*exp(-2*im*d)+-1*F^(a*c)*(f*x)^m*(-1*x*(2*im*e+b*c*log(F)))^(-1m)*(8*im*e+4*b*c*log(F))^-1*SpecialFunctions.gamma(1+m,-1*x*(2*im*e+b*c*log(F)))*exp(2*im*d)+(1/2)*F^(a*c)*b^-1*c^-1*(f*x)^m*(-1*b*c*x*log(F))^(-1m)*log(F)^-1*SpecialFunctions.gamma(1+m,-1*b*c*x*log(F)))
@test integrate(F^(c*(a+b*x))*(f*x)^m*sin(d+e*x), x) == :(-1*F^(a*c)*(f*x)^m*(x*(im*e+-1*b*c*log(F)))^(-1m)*(2*e+2*im*b*c*log(F))^-1*SpecialFunctions.gamma(1+m,x*(im*e+-1*b*c*log(F)))*exp(-1*im*d)+-1*F^(a*c)*(f*x)^m*(-1*x*(im*e+b*c*log(F)))^(-1m)*(2*e+-2*im*b*c*log(F))^-1*SpecialFunctions.gamma(1+m,-1*x*(im*e+b*c*log(F)))*exp(im*d))
@test integrate(f*F^(c*(a+b*x))*(f*x)^(-2+m)*((-1+m+b*c*x*log(F))*sin(d+e*x)+e*x*cos(d+e*x)), x) == :(F^(a*c+b*c*x)*(f*x)^(-1+m)*sin(d+e*x))
@test integrate(f*F^(c*(a+b*x))*(f*x)^m*((1+m+b*c*x*log(F))*sin(d+e*x)+e*x*cos(d+e*x)), x) == :(f*x*F^(c*(a+b*x))*(f*x)^m*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*x^-1*(f*x)^m*((m+b*c*x*log(F))*sin(d+e*x)+e*x*cos(d+e*x)), x) == :(F^(a*c+b*c*x)*(f*x)^m*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*(e*cos(d+e*x)+b*c*log(F)*sin(d+e*x)), x) == :(F^(c*(a+b*x))*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*x^-2*((-1+b*c*x*log(F))*sin(d+e*x)+e*x*cos(d+e*x)), x) == :(F^(a*c+b*c*x)*x^-1*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*x^-3*((-2+b*c*x*log(F))*sin(d+e*x)+e*x*cos(d+e*x)), x) == :(F^(a*c+b*c*x)*x^-2*sin(d+e*x))
@test integrate(cos(c+d*x)*exp(a+b*x)*sin(c+d*x), x) == :(b*(2*b^2+8*d^2)^-1*exp(a+b*x)*sin(2c+2*d*x)+-1*d*(b^2+4*d^2)^-1*cos(2c+2*d*x)*exp(a+b*x))
@test integrate(sin(c+d*x)^2*cos(c+d*x)*exp(a+b*x), x) == :(b*(4*b^2+4*d^2)^-1*cos(c+d*x)*exp(a+b*x)+d*(4*b^2+4*d^2)^-1*exp(a+b*x)*sin(c+d*x)+-1*b*(4*b^2+36*d^2)^-1*cos(3c+3*d*x)*exp(a+b*x)+-3*d*(4*b^2+36*d^2)^-1*exp(a+b*x)*sin(3c+3*d*x))
@test integrate(sin(c+d*x)^3*cos(c+d*x)*exp(a+b*x), x) == :(b*(4*b^2+16*d^2)^-1*exp(a+b*x)*sin(2c+2*d*x)+d*(2*b^2+32*d^2)^-1*cos(4c+4*d*x)*exp(a+b*x)+-1*b*(8*b^2+128*d^2)^-1*exp(a+b*x)*sin(4c+4*d*x)+-1*d*(2*b^2+8*d^2)^-1*cos(2c+2*d*x)*exp(a+b*x))
@test integrate(cos(c+d*x)^2*exp(a+b*x)*sin(c+d*x), x) == :(b*(4*b^2+4*d^2)^-1*exp(a+b*x)*sin(c+d*x)+b*(4*b^2+36*d^2)^-1*exp(a+b*x)*sin(3c+3*d*x)+-1*d*(4*b^2+4*d^2)^-1*cos(c+d*x)*exp(a+b*x)+-3*d*(4*b^2+36*d^2)^-1*cos(3c+3*d*x)*exp(a+b*x))
@test integrate(cos(c+d*x)^2*sin(c+d*x)^2*exp(a+b*x), x) == :(1//8*b^-1*exp(a+b*x)+-1*b*(8*b^2+128*d^2)^-1*cos(4c+4*d*x)*exp(a+b*x)+-1*d*(2*b^2+32*d^2)^-1*exp(a+b*x)*sin(4c+4*d*x))
@test integrate(cos(c+d*x)^2*sin(c+d*x)^3*exp(a+b*x), x) == :(b*(8*b^2+8*d^2)^-1*exp(a+b*x)*sin(c+d*x)+b*(16*b^2+144*d^2)^-1*exp(a+b*x)*sin(3c+3*d*x)+-1*b*(16*b^2+400*d^2)^-1*exp(a+b*x)*sin(5c+5*d*x)+-1*d*(8*b^2+8*d^2)^-1*cos(c+d*x)*exp(a+b*x)+-3*d*(16*b^2+144*d^2)^-1*cos(3c+3*d*x)*exp(a+b*x)+5*d*(16*b^2+400*d^2)^-1*cos(5c+5*d*x)*exp(a+b*x))
@test integrate(cos(c+d*x)^3*exp(a+b*x)*sin(c+d*x), x) == :(b*(4*b^2+16*d^2)^-1*exp(a+b*x)*sin(2c+2*d*x)+b*(8*b^2+128*d^2)^-1*exp(a+b*x)*sin(4c+4*d*x)+-1*d*(2*b^2+8*d^2)^-1*cos(2c+2*d*x)*exp(a+b*x)+-1*d*(2*b^2+32*d^2)^-1*cos(4c+4*d*x)*exp(a+b*x))
@test integrate(cos(c+d*x)^3*sin(c+d*x)^2*exp(a+b*x), x) == :(b*(8*b^2+8*d^2)^-1*cos(c+d*x)*exp(a+b*x)+d*(8*b^2+8*d^2)^-1*exp(a+b*x)*sin(c+d*x)+-1*b*(16*b^2+144*d^2)^-1*cos(3c+3*d*x)*exp(a+b*x)+-1*b*(16*b^2+400*d^2)^-1*cos(5c+5*d*x)*exp(a+b*x)+-5*d*(16*b^2+400*d^2)^-1*exp(a+b*x)*sin(5c+5*d*x)+-3*d*(16*b^2+144*d^2)^-1*exp(a+b*x)*sin(3c+3*d*x))
@test integrate(cos(c+d*x)^3*sin(c+d*x)^3*exp(a+b*x), x) == :(-1*b*(32*b^2+1152*d^2)^-1*exp(a+b*x)*sin(6c+6*d*x)+-3*d*(16*b^2+64*d^2)^-1*cos(2c+2*d*x)*exp(a+b*x)+3*b*(32*b^2+128*d^2)^-1*exp(a+b*x)*sin(2c+2*d*x)+3*d*(16*b^2+576*d^2)^-1*cos(6c+6*d*x)*exp(a+b*x))
@test integrate(x*exp(x)*sin(x), x) == :((1/2)*cos(x)*exp(x)+(1/2)*x*exp(x)*sin(x)+-1//2*x*cos(x)*exp(x))
@test integrate(x^2*exp(x)*sin(x), x) == :(-1//2*cos(x)*exp(x)+-1//2*exp(x)*sin(x)+x*cos(x)*exp(x)+(1/2)*x^2*exp(x)*sin(x)+-1//2*x^2*cos(x)*exp(x))
@test integrate(x*cos(x)*exp(x), x) == :(-1//2*exp(x)*sin(x)+(1/2)*x*cos(x)*exp(x)+(1/2)*x*exp(x)*sin(x))
@test integrate(x^2*cos(x)*exp(x), x) == :((1/2)*exp(x)*sin(x)+-1//2*cos(x)*exp(x)+(1/2)*x^2*cos(x)*exp(x)+(1/2)*x^2*exp(x)*sin(x)+-1*x*exp(x)*sin(x))
@test integrate((-5*cos(4x)+2*sin(4x))*exp(3x), x) == :(-23//25*cos(4x)*exp(3x)+-14//25*exp(3x)*sin(4x))
@test integrate(exp(x)*sin(x)+exp(-1x)*sin(x), x) == :((1/2)*exp(x)*sin(x)+-1//2*cos(x)*exp(x)+-1//2*cos(x)*exp(-1x)+-1//2*exp(-1x)*sin(x))
@test integrate(exp(x^2)*sin(b*x), x) == :(-1//4*im*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2)+-1//4*im*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2))
@test integrate(cos(b*x)*exp(x^2), x) == :(-1//4*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2)+1//4*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2))
@test integrate(exp(x^2)*sin(a+b*x), x) == :(-1//4*im*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2+im*a)+-1//4*im*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2+-1*im*a))
@test integrate(cos(a+b*x)*exp(x^2), x) == :(-1//4*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2+-1*im*a)+1//4*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2+im*a))
@test integrate(x*cos(2*x^2)*exp(2*x^2), x) == :(1//8*cos(2*x^2)*exp(2*x^2)+1//8*exp(2*x^2)*sin(2*x^2))
@test integrate(exp(x)*sin(exp(x)), x) == :(-1*cos(exp(x)))
@test integrate(csc(exp(x))*exp(x)*sec(exp(x)), x) == :(log(tan(exp(x))))
@test integrate(cos(exp(x))*exp(x), x) == :(sin(exp(x)))
@test integrate(cos(exp(2x))*exp(2x), x) == :((1/2)*sin(exp(2x)))
@test integrate(cos(exp(-2x))*exp(-2x), x) == :(-1//2*sin(exp(-2x)))
@test integrate(cos(exp(x))*exp(2x), x) == :(exp(x)*sin(exp(x))+cos(exp(x)))
@test integrate(cos(exp(-1+3x))*exp(-1+3x)*sin(1+exp(-1+3x)), x) == :(-1//12*cos(1+2*exp(-1+3x))+1//6*exp(-1+3x)*sin(1))
@test integrate(exp(x)*tan(exp(x)), x) == :(-1*log(cos(exp(x))))
@test integrate(exp(x)*sec(exp(x)), x) == :(arctanh(sin(exp(x))))
@test integrate(exp(x)*sec(exp(x))*tan(exp(x)), x) == :(sec(exp(x)))
@test integrate(csc(exp(x))^2*exp(x), x) == :(-1*cot(exp(x)))
@test integrate(exp(x)*sin(a+b*x), x) == :((1+b^2)^-1*exp(x)*sin(a+b*x)+-1*b*(1+b^2)^-1*cos(a+b*x)*exp(x))
@test integrate(exp(x)*sin(a+c*x^2), x) == :(1//4*(-1)^3//4*pi^(1/2)*c^-1//2*erf((1/2)*(-1)^1//4*c^-1//2*(1+2*im*c*x))*exp(1//4*im*(c^-1+4a))+1//4*(-1)^3//4*pi^(1/2)*c^-1//2*erfi((1/2)*(-1)^1//4*c^-1//2*(1+-2*im*c*x))*exp(-1//4*im*(c^-1+4a)))
@test integrate(exp(x)*sin(a+b*x+c*x^2), x) == :(1//4*(-1)^3//4*pi^(1/2)*c^-1//2*erf((1/2)*(-1)^1//4*c^-1//2*(1+im*b+2*im*c*x))*exp(1//4*im*(4a+c^-1*(1+im*b)^2))+1//4*(-1)^3//4*pi^(1/2)*c^-1//2*erfi((1/2)*(-1)^1//4*c^-1//2*(1+-1*im*b+-2*im*c*x))*exp(-1*im*a+1//4*im*c^-1*(im+b)^2))
@test integrate(exp(x^2)*sin(a+b*x), x) == :(-1//4*im*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2+im*a)+-1//4*im*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2+-1*im*a))
@test integrate(exp(x^2)*sin(a+c*x^2), x) == :(-1//4*im*pi^(1/2)*(1+im*c)^-1//2*erfi(x*(1+im*c)^(1/2))*exp(im*a)+1//4*im*pi^(1/2)*(1+-1*im*c)^-1//2*erfi(x*(1+-1*im*c)^(1/2))*exp(-1*im*a))
@test integrate(exp(x^2)*sin(a+b*x+c*x^2), x) == :(-1//4*im*pi^(1/2)*(1+im*c)^-1//2*erfi((1/2)*(1+im*c)^-1//2*(im*b+x*(2+2*im*c)))*exp(im*a+b^2*(4+4*im*c)^-1)+-1//4*im*pi^(1/2)*(1+-1*im*c)^-1//2*erfi((1/2)*(1+-1*im*c)^-1//2*(im*b+-1*x*(2+-2*im*c)))*exp(-1*im*(a+-1*b^2*(4im+4c)^-1)))
@test integrate(f^(a+b*x)*sin(d+f*x^2), x) == :(-1//4*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(-1*b*log(f)+2*im*f*x))*exp(-1//4*im*(4d+b^2*f^-1*log(f)^2))+1//4*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(b*log(f)+2*im*f*x))*exp(1//4*im*(4d+b^2*f^-1*log(f)^2)))
@test integrate(f^(a+b*x)*sin(d+f*x^2)^2, x) == :((1/2)*b^-1*f^(a+b*x)*log(f)^-1+pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erf(f^-1//2*(1//4+1//4*im)*(b*log(f)+4*im*f*x))*exp(2*im*d+1//8*im*b^2*f^-1*log(f)^2)+pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(f^-1//2*(1//4+1//4*im)*(-1*b*log(f)+4*im*f*x))*exp(-1//8*im*(16d+b^2*f^-1*log(f)^2)))
@test integrate(f^(a+b*x)*sin(d+f*x^2)^3, x) == :(-3//16*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(-1*b*log(f)+2*im*f*x))*exp(-1//4*im*(4d+b^2*f^-1*log(f)^2))+3//16*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(b*log(f)+2*im*f*x))*exp(1//4*im*(4d+b^2*f^-1*log(f)^2))+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+-1//16*im)*erfi(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(-1*b*log(f)+6*im*f*x))*exp(-1//12*im*(36d+b^2*f^-1*log(f)^2))+1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+-1//16*im)*erf(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(b*log(f)+6*im*f*x))*exp(3*im*d+1//12*im*b^2*f^-1*log(f)^2))
@test integrate(f^(a+b*x)*sin(d+e*x+f*x^2), x) == :(-1//4*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(im*e+-1*b*log(f)+2*im*f*x))*exp(-1*im*d+1//4*im*f^-1*(e+im*b*log(f))^2)+1//4*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(im*e+b*log(f)+2*im*f*x))*exp(1//4*im*(4d+f^-1*(im*e+b*log(f))^2)))
@test integrate(f^(a+b*x)*sin(d+e*x+f*x^2)^2, x) == :((1/2)*b^-1*f^(a+b*x)*log(f)^-1+pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erf(f^-1//2*(1//4+1//4*im)*(b*log(f)+2*im*e+4*im*f*x))*exp(2*im*d+1//8*im*f^-1*(b*log(f)+2*im*e)^2)+pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(f^-1//2*(1//4+1//4*im)*(-1*b*log(f)+2*im*e+4*im*f*x))*exp(-2*im*d+1//8*im*f^-1*(2*e+im*b*log(f))^2))
@test integrate(f^(a+b*x)*sin(d+e*x+f*x^2)^3, x) == :(-3//16*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(im*e+-1*b*log(f)+2*im*f*x))*exp(-1*im*d+1//4*im*f^-1*(e+im*b*log(f))^2)+3//16*(-1)^3//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(im*e+b*log(f)+2*im*f*x))*exp(1//4*im*(4d+f^-1*(im*e+b*log(f))^2))+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+-1//16*im)*erfi(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(-1*b*log(f)+3*im*e+6*im*f*x))*exp(-3*im*d+1//12*im*f^-1*(3*e+im*b*log(f))^2)+1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+-1//16*im)*erf(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(b*log(f)+3*im*e+6*im*f*x))*exp(3*im*d+1//12*im*f^-1*(b*log(f)+3*im*e)^2))
@test integrate(f^(a+c*x^2)*sin(d+f*x^2), x) == :(-1//4*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi(x*(im*f+c*log(f))^(1/2))*exp(im*d)+1//4*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf(x*(im*f+-1*c*log(f))^(1/2))*exp(-1*im*d))
@test integrate(f^(a+c*x^2)*sin(d+f*x^2)^2, x) == :(-1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi(x*(c*log(f)+2*im*f)^(1/2))*exp(2*im*d)+-1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf(x*(-1*c*log(f)+2*im*f)^(1/2))*exp(-2*im*d)+1//4*pi^(1/2)*c^-1//2*f^a*log(f)^-1//2*erfi(x*c^(1/2)*log(f)^(1/2)))
@test integrate(f^(a+c*x^2)*sin(d+f*x^2)^3, x) == :(-3//16*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi(x*(im*f+c*log(f))^(1/2))*exp(im*d)+-1//16*im*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf(x*(-1*c*log(f)+3*im*f)^(1/2))*exp(-3*im*d)+1//16*im*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi(x*(c*log(f)+3*im*f)^(1/2))*exp(3*im*d)+3//16*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf(x*(im*f+-1*c*log(f))^(1/2))*exp(-1*im*d))
@test integrate(f^(a+c*x^2)*sin(d+e*x+f*x^2), x) == :(-1//4*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+2*x*(im*f+c*log(f))))*exp(im*d+e^2*(4*im*f+4*c*log(f))^-1)+1//4*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*e^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+c*x^2)*sin(d+e*x+f*x^2)^2, x) == :(-1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((c*log(f)+2*im*f)^-1//2*(im*e+x*(c*log(f)+2*im*f)))*exp(e^2*(c*log(f)+2*im*f)^-1+2*im*d)+-1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((-1*c*log(f)+2*im*f)^-1//2*(im*e+x*(-1*c*log(f)+2*im*f)))*exp(-1*e^2*(-1*c*log(f)+2*im*f)^-1+-2*im*d)+1//4*pi^(1/2)*c^-1//2*f^a*log(f)^-1//2*erfi(x*c^(1/2)*log(f)^(1/2)))
@test integrate(f^(a+c*x^2)*sin(d+e*x+f*x^2)^3, x) == :(-3//16*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+2*x*(im*f+c*log(f))))*exp(im*d+e^2*(4*im*f+4*c*log(f))^-1)+-1//16*im*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(2*x*(-1*c*log(f)+3*im*f)+3*im*e))*exp(-9*e^2*(-4*c*log(f)+12*im*f)^-1+-3*im*d)+1//16*im*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(2*x*(c*log(f)+3*im*f)+3*im*e))*exp(3*im*d+9*e^2*(4*c*log(f)+12*im*f)^-1)+3//16*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*e^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+b*x+c*x^2)*sin(d+f*x^2), x) == :(-1//4*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+-1*b^2*(4*im*f+4*c*log(f))^-1*log(f)^2)+-1//4*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(b*log(f)+-2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+b^2*(-4*c*log(f)+4*im*f)^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*sin(d+f*x^2)^2, x) == :(-1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((1/2)*(c*log(f)+2*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+2*im*f)))*exp(2*im*d+-1*b^2*(4*c*log(f)+8*im*f)^-1*log(f)^2)+1//4*pi^(1/2)*c^-1//2*f^(a+-1//4*b^2*c^-1)*log(f)^-1//2*erfi((1/2)*c^-1//2*log(f)^(1/2)*(b+2*c*x))+1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+2*im*f)^-1//2*(b*log(f)+-2*x*(-1*c*log(f)+2*im*f)))*exp(-2*im*d+b^2*(-4*c*log(f)+8*im*f)^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*sin(d+f*x^2)^3, x) == :(-3//16*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+-1*b^2*(4*im*f+4*c*log(f))^-1*log(f)^2)+-3//16*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(b*log(f)+-2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+b^2*(-4*c*log(f)+4*im*f)^-1*log(f)^2)+1//16*im*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+3*im*f)))*exp(3*im*d+-1*b^2*(4*c*log(f)+12*im*f)^-1*log(f)^2)+1//16*im*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(b*log(f)+-2*x*(-1*c*log(f)+3*im*f)))*exp(-3*im*d+b^2*(-4*c*log(f)+12*im*f)^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*sin(d+e*x+f*x^2), x) == :(-1//4*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+(e+-1*im*b*log(f))^2*(4*im*f+4*c*log(f))^-1)+1//4*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+-1*b*log(f)+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*(e+im*b*log(f))^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+b*x+c*x^2)*sin(d+e*x+f*x^2)^2, x) == :(-1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((1/2)*(c*log(f)+2*im*f)^-1//2*(b*log(f)+2*im*e+2*x*(c*log(f)+2*im*f)))*exp((2*e+-1*im*b*log(f))^2*(4*c*log(f)+8*im*f)^-1+2*im*d)+-1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+2*im*f)^-1//2*(-1*b*log(f)+2*im*e+2*x*(-1*c*log(f)+2*im*f)))*exp(-1*(2*e+im*b*log(f))^2*(-4*c*log(f)+8*im*f)^-1+-2*im*d)+1//4*pi^(1/2)*c^-1//2*f^(a+-1//4*b^2*c^-1)*log(f)^-1//2*erfi((1/2)*c^-1//2*log(f)^(1/2)*(b+2*c*x)))
@test integrate(f^(a+b*x+c*x^2)*sin(d+e*x+f*x^2)^3, x) == :(-3//16*im*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+(e+-1*im*b*log(f))^2*(4*im*f+4*c*log(f))^-1)+-1//16*im*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(-1*b*log(f)+2*x*(-1*c*log(f)+3*im*f)+3*im*e))*exp(-1*(3*e+im*b*log(f))^2*(-4*c*log(f)+12*im*f)^-1+-3*im*d)+1//16*im*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+3*im*f)+3*im*e))*exp(-1*(b*log(f)+3*im*e)^2*(4*c*log(f)+12*im*f)^-1+3*im*d)+3//16*im*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+-1*b*log(f)+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*(e+im*b*log(f))^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(cos(a+b*x)*exp(x), x) == :((1+b^2)^-1*cos(a+b*x)*exp(x)+b*(1+b^2)^-1*exp(x)*sin(a+b*x))
@test integrate(cos(a+c*x^2)*exp(x), x) == :(-1//4*(-1)^1//4*pi^(1/2)*c^-1//2*erf((1/2)*(-1)^1//4*c^-1//2*(1+2*im*c*x))*exp(1//4*im*(c^-1+4a))+1//4*(-1)^1//4*pi^(1/2)*c^-1//2*erfi((1/2)*(-1)^1//4*c^-1//2*(1+-2*im*c*x))*exp(-1//4*im*(c^-1+4a)))
@test integrate(cos(a+b*x+c*x^2)*exp(x), x) == :(-1//4*(-1)^1//4*pi^(1/2)*c^-1//2*erf((1/2)*(-1)^1//4*c^-1//2*(1+im*b+2*im*c*x))*exp(1//4*im*(4a+c^-1*(1+im*b)^2))+1//4*(-1)^1//4*pi^(1/2)*c^-1//2*erfi((1/2)*(-1)^1//4*c^-1//2*(1+-1*im*b+-2*im*c*x))*exp(-1*im*a+1//4*im*c^-1*(im+b)^2))
@test integrate(cos(a+b*x)*exp(x^2), x) == :(-1//4*pi^(1/2)*erfi(-1x+(1/2)*im*b)*exp(1//4*b^2+-1*im*a)+1//4*pi^(1/2)*erfi(x+(1/2)*im*b)*exp(1//4*b^2+im*a))
@test integrate(cos(a+c*x^2)*exp(x^2), x) == :(1//4*pi^(1/2)*(1+im*c)^-1//2*erfi(x*(1+im*c)^(1/2))*exp(im*a)+1//4*pi^(1/2)*(1+-1*im*c)^-1//2*erfi(x*(1+-1*im*c)^(1/2))*exp(-1*im*a))
@test integrate(cos(a+b*x+c*x^2)*exp(x^2), x) == :(-1//4*pi^(1/2)*(1+-1*im*c)^-1//2*erfi((1/2)*(1+-1*im*c)^-1//2*(im*b+-1*x*(2+-2*im*c)))*exp(-1*im*(a+-1*b^2*(4im+4c)^-1))+1//4*pi^(1/2)*(1+im*c)^-1//2*erfi((1/2)*(1+im*c)^-1//2*(im*b+x*(2+2*im*c)))*exp(im*a+b^2*(4+4*im*c)^-1))
@test integrate(f^(a+b*x)*cos(d+f*x^2), x) == :(-1//4*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(b*log(f)+2*im*f*x))*exp(1//4*im*(4d+b^2*f^-1*log(f)^2))+-1//4*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(-1*b*log(f)+2*im*f*x))*exp(-1//4*im*(4d+b^2*f^-1*log(f)^2)))
@test integrate(f^(a+b*x)*cos(d+f*x^2)^2, x) == :((1/2)*b^-1*f^(a+b*x)*log(f)^-1+pi^(1/2)*f^(-1//2+a)*(-1//16+-1//16*im)*erf(f^-1//2*(1//4+1//4*im)*(b*log(f)+4*im*f*x))*exp(2*im*d+1//8*im*b^2*f^-1*log(f)^2)+-1*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(f^-1//2*(1//4+1//4*im)*(-1*b*log(f)+4*im*f*x))*exp(-1//8*im*(16d+b^2*f^-1*log(f)^2)))
@test integrate(f^(a+b*x)*cos(d+f*x^2)^3, x) == :(-3//16*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(b*log(f)+2*im*f*x))*exp(1//4*im*(4d+b^2*f^-1*log(f)^2))+-3//16*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(-1*b*log(f)+2*im*f*x))*exp(-1//4*im*(4d+b^2*f^-1*log(f)^2))+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erf(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(b*log(f)+6*im*f*x))*exp(3*im*d+1//12*im*b^2*f^-1*log(f)^2)+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(-1*b*log(f)+6*im*f*x))*exp(-1//12*im*(36d+b^2*f^-1*log(f)^2)))
@test integrate(f^(a+b*x)*cos(d+e*x+f*x^2), x) == :(-1//4*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(im*e+b*log(f)+2*im*f*x))*exp(1//4*im*(4d+f^-1*(im*e+b*log(f))^2))+-1//4*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(im*e+-1*b*log(f)+2*im*f*x))*exp(-1*im*d+1//4*im*f^-1*(e+im*b*log(f))^2))
@test integrate(f^(a+b*x)*cos(d+e*x+f*x^2)^2, x) == :((1/2)*b^-1*f^(a+b*x)*log(f)^-1+pi^(1/2)*f^(-1//2+a)*(-1//16+-1//16*im)*erf(f^-1//2*(1//4+1//4*im)*(b*log(f)+2*im*e+4*im*f*x))*exp(2*im*d+1//8*im*f^-1*(b*log(f)+2*im*e)^2)+-1*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(f^-1//2*(1//4+1//4*im)*(-1*b*log(f)+2*im*e+4*im*f*x))*exp(-2*im*d+1//8*im*f^-1*(2*e+im*b*log(f))^2))
@test integrate(f^(a+b*x)*cos(d+e*x+f*x^2)^3, x) == :(-3//16*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erf((1/2)*(-1)^1//4*f^-1//2*(im*e+b*log(f)+2*im*f*x))*exp(1//4*im*(4d+f^-1*(im*e+b*log(f))^2))+-3//16*(-1)^1//4*pi^(1/2)*f^(-1//2+a)*erfi((1/2)*(-1)^1//4*f^-1//2*(im*e+-1*b*log(f)+2*im*f*x))*exp(-1*im*d+1//4*im*f^-1*(e+im*b*log(f))^2)+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erf(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(b*log(f)+3*im*e+6*im*f*x))*exp(3*im*d+1//12*im*f^-1*(b*log(f)+3*im*e)^2)+-1//6*6^(1/2)*pi^(1/2)*f^(-1//2+a)*(1//16+1//16*im)*erfi(1//6*6^(1/2)*f^-1//2*(1/2+(1/2)*im)*(-1*b*log(f)+3*im*e+6*im*f*x))*exp(-3*im*d+1//12*im*f^-1*(3*e+im*b*log(f))^2))
@test integrate(f^(a+c*x^2)*cos(d+f*x^2), x) == :(1//4*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi(x*(im*f+c*log(f))^(1/2))*exp(im*d)+1//4*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf(x*(im*f+-1*c*log(f))^(1/2))*exp(-1*im*d))
@test integrate(f^(a+c*x^2)*cos(d+f*x^2)^2, x) == :(1//4*pi^(1/2)*c^-1//2*f^a*log(f)^-1//2*erfi(x*c^(1/2)*log(f)^(1/2))+1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi(x*(c*log(f)+2*im*f)^(1/2))*exp(2*im*d)+1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf(x*(-1*c*log(f)+2*im*f)^(1/2))*exp(-2*im*d))
@test integrate(f^(a+c*x^2)*cos(d+f*x^2)^3, x) == :(1//16*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi(x*(c*log(f)+3*im*f)^(1/2))*exp(3*im*d)+1//16*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf(x*(-1*c*log(f)+3*im*f)^(1/2))*exp(-3*im*d)+3//16*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi(x*(im*f+c*log(f))^(1/2))*exp(im*d)+3//16*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf(x*(im*f+-1*c*log(f))^(1/2))*exp(-1*im*d))
@test integrate(f^(a+c*x^2)*cos(d+e*x+f*x^2), x) == :(1//4*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+2*x*(im*f+c*log(f))))*exp(im*d+e^2*(4*im*f+4*c*log(f))^-1)+1//4*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*e^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+c*x^2)*cos(d+e*x+f*x^2)^2, x) == :(1//4*pi^(1/2)*c^-1//2*f^a*log(f)^-1//2*erfi(x*c^(1/2)*log(f)^(1/2))+1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((c*log(f)+2*im*f)^-1//2*(im*e+x*(c*log(f)+2*im*f)))*exp(e^2*(c*log(f)+2*im*f)^-1+2*im*d)+1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((-1*c*log(f)+2*im*f)^-1//2*(im*e+x*(-1*c*log(f)+2*im*f)))*exp(-1*e^2*(-1*c*log(f)+2*im*f)^-1+-2*im*d))
@test integrate(f^(a+c*x^2)*cos(d+e*x+f*x^2)^3, x) == :(1//16*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(2*x*(c*log(f)+3*im*f)+3*im*e))*exp(3*im*d+9*e^2*(4*c*log(f)+12*im*f)^-1)+1//16*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(2*x*(-1*c*log(f)+3*im*f)+3*im*e))*exp(-9*e^2*(-4*c*log(f)+12*im*f)^-1+-3*im*d)+3//16*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+2*x*(im*f+c*log(f))))*exp(im*d+e^2*(4*im*f+4*c*log(f))^-1)+3//16*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*e^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+b*x+c*x^2)*cos(d+f*x^2), x) == :(-1//4*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(b*log(f)+-2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+b^2*(-4*c*log(f)+4*im*f)^-1*log(f)^2)+1//4*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+-1*b^2*(4*im*f+4*c*log(f))^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*cos(d+f*x^2)^2, x) == :(-1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+2*im*f)^-1//2*(b*log(f)+-2*x*(-1*c*log(f)+2*im*f)))*exp(-2*im*d+b^2*(-4*c*log(f)+8*im*f)^-1*log(f)^2)+1//4*pi^(1/2)*c^-1//2*f^(a+-1//4*b^2*c^-1)*log(f)^-1//2*erfi((1/2)*c^-1//2*log(f)^(1/2)*(b+2*c*x))+1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((1/2)*(c*log(f)+2*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+2*im*f)))*exp(2*im*d+-1*b^2*(4*c*log(f)+8*im*f)^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*cos(d+f*x^2)^3, x) == :(-3//16*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(b*log(f)+-2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+b^2*(-4*c*log(f)+4*im*f)^-1*log(f)^2)+-1//16*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(b*log(f)+-2*x*(-1*c*log(f)+3*im*f)))*exp(-3*im*d+b^2*(-4*c*log(f)+12*im*f)^-1*log(f)^2)+1//16*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+3*im*f)))*exp(3*im*d+-1*b^2*(4*c*log(f)+12*im*f)^-1*log(f)^2)+3//16*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+-1*b^2*(4*im*f+4*c*log(f))^-1*log(f)^2))
@test integrate(f^(a+b*x+c*x^2)*cos(d+e*x+f*x^2), x) == :(1//4*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+(e+-1*im*b*log(f))^2*(4*im*f+4*c*log(f))^-1)+1//4*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+-1*b*log(f)+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*(e+im*b*log(f))^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(f^(a+b*x+c*x^2)*cos(d+e*x+f*x^2)^2, x) == :(1//4*pi^(1/2)*c^-1//2*f^(a+-1//4*b^2*c^-1)*log(f)^-1//2*erfi((1/2)*c^-1//2*log(f)^(1/2)*(b+2*c*x))+1//8*pi^(1/2)*f^a*(c*log(f)+2*im*f)^-1//2*erfi((1/2)*(c*log(f)+2*im*f)^-1//2*(b*log(f)+2*im*e+2*x*(c*log(f)+2*im*f)))*exp((2*e+-1*im*b*log(f))^2*(4*c*log(f)+8*im*f)^-1+2*im*d)+1//8*pi^(1/2)*f^a*(-1*c*log(f)+2*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+2*im*f)^-1//2*(-1*b*log(f)+2*im*e+2*x*(-1*c*log(f)+2*im*f)))*exp(-1*(2*e+im*b*log(f))^2*(-4*c*log(f)+8*im*f)^-1+-2*im*d))
@test integrate(f^(a+b*x+c*x^2)*cos(d+e*x+f*x^2)^3, x) == :(1//16*pi^(1/2)*f^a*(c*log(f)+3*im*f)^-1//2*erfi((1/2)*(c*log(f)+3*im*f)^-1//2*(b*log(f)+2*x*(c*log(f)+3*im*f)+3*im*e))*exp(-1*(b*log(f)+3*im*e)^2*(4*c*log(f)+12*im*f)^-1+3*im*d)+1//16*pi^(1/2)*f^a*(-1*c*log(f)+3*im*f)^-1//2*erf((1/2)*(-1*c*log(f)+3*im*f)^-1//2*(-1*b*log(f)+2*x*(-1*c*log(f)+3*im*f)+3*im*e))*exp(-1*(3*e+im*b*log(f))^2*(-4*c*log(f)+12*im*f)^-1+-3*im*d)+3//16*pi^(1/2)*f^a*(im*f+c*log(f))^-1//2*erfi((1/2)*(im*f+c*log(f))^-1//2*(im*e+b*log(f)+2*x*(im*f+c*log(f))))*exp(im*d+(e+-1*im*b*log(f))^2*(4*im*f+4*c*log(f))^-1)+3//16*pi^(1/2)*f^a*(im*f+-1*c*log(f))^-1//2*erf((1/2)*(im*f+-1*c*log(f))^-1//2*(im*e+-1*b*log(f)+2*x*(im*f+-1*c*log(f))))*exp(-1*im*d+-1*(e+im*b*log(f))^2*(-4*c*log(f)+4*im*f)^-1))
@test integrate(F^(c*(a+b*x))*(f+f*sin(d+e*x))^2, x) == :(F^(a*c+b*c*x)*b^-1*c^-1*f^2*log(F)^-1+-2*e*F^(a*c+b*c*x)*f^2*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)+-2*e*F^(a*c+b*c*x)*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*sin(d+e*x)+b*c*F^(a*c+b*c*x)*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)^2*log(F)+2*b*c*F^(a*c+b*c*x)*f^2*(e^2+b^2*c^2*log(F)^2)^-1*log(F)*sin(d+e*x)+2*F^(a*c+b*c*x)*b^-1*c^-1*e^2*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*log(F)^-1)
@test integrate(F^(c*(a+b*x))*(f+f*sin(d+e*x)), x) == :(f*F^(a*c+b*c*x)*b^-1*c^-1*log(F)^-1+-1*e*f*F^(a*c+b*c*x)*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)+b*c*f*F^(a*c+b*c*x)*(e^2+b^2*c^2*log(F)^2)^-1*log(F)*sin(d+e*x))
@test integrate(F^(c*(a+b*x))*(f+f*cos(d+e*x))^2, x) == :(F^(a*c+b*c*x)*b^-1*c^-1*f^2*log(F)^-1+2*e*F^(a*c+b*c*x)*f^2*(e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)+2*e*F^(a*c+b*c*x)*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*sin(d+e*x)+b*c*F^(a*c+b*c*x)*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)^2*log(F)+2*b*c*F^(a*c+b*c*x)*f^2*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*log(F)+2*F^(a*c+b*c*x)*b^-1*c^-1*e^2*f^2*(4*e^2+b^2*c^2*log(F)^2)^-1*log(F)^-1)
@test integrate(F^(c*(a+b*x))*(f+f*cos(d+e*x)), x) == :(e*f*F^(a*c+b*c*x)*(e^2+b^2*c^2*log(F)^2)^-1*sin(d+e*x)+f*F^(a*c+b*c*x)*b^-1*c^-1*log(F)^-1+b*c*f*F^(a*c+b*c*x)*(e^2+b^2*c^2*log(F)^2)^-1*cos(d+e*x)*log(F))