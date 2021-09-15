using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((c+d*x)^3*tanh(e+f*x), x) == :(-1//4*d^-1*(c+d*x)^4+f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+3//4*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+-3//2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3//2*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)^2*tanh(e+f*x), x) == :(-1//3*d^-1*(c+d*x)^3+f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+-1//2*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)*tanh(e+f*x), x) == :(-1//2*d^-1*(c+d*x)^2+f^-1*(c+d*x)*log(1+exp(2*e+2*f*x))+(1/2)*d*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)^3*tanh(e+f*x)^2, x) == :(-1*f^-1*(c+d*x)^3+1//4*d^-1*(c+d*x)^4+-1*f^-1*(c+d*x)^3*tanh(e+f*x)+-3//2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3*d*f^-2*(c+d*x)^2*log(1+exp(2*e+2*f*x))+3*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)^2*tanh(e+f*x)^2, x) == :(-1*f^-1*(c+d*x)^2+1//3*d^-1*(c+d*x)^3+d^2*f^-3*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-1*f^-1*(c+d*x)^2*tanh(e+f*x)+2*d*f^-2*(c+d*x)*log(1+exp(2*e+2*f*x)))
@test integrate(tanh(e+f*x)^2*(c+d*x), x) == :(c*x+(1/2)*d*x^2+d*f^-2*log(cosh(e+f*x))+-1*f^-1*(c+d*x)*tanh(e+f*x))
@test integrate((c+d*x)^3*tanh(e+f*x)^3, x) == :((1/2)*f^-1*(c+d*x)^3+-1//4*d^-1*(c+d*x)^4+f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+-3//2*d*f^-2*(c+d*x)^2+-1//2*f^-1*(c+d*x)^3*tanh(e+f*x)^2+3//2*d^3*f^-4*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+3//4*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+3*d^2*f^-3*(c+d*x)*log(1+exp(2*e+2*f*x))+-3//2*d*f^-2*(c+d*x)^2*tanh(e+f*x)+-3//2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3//2*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)^2*tanh(e+f*x)^3, x) == :(-1//3*d^-1*(c+d*x)^3+d^2*f^-3*log(cosh(e+f*x))+f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+(1/2)*d^2*f^-1*x^2+-1//2*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+-1//2*f^-1*(c+d*x)^2*tanh(e+f*x)^2+c*d*x*f^-1+d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-1*d*f^-2*(c+d*x)*tanh(e+f*x))
@test integrate(tanh(e+f*x)^3*(c+d*x), x) == :(-1//2*d^-1*(c+d*x)^2+f^-1*(c+d*x)*log(1+exp(2*e+2*f*x))+(1/2)*d*x*f^-1+(1/2)*d*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-1//2*d*f^-2*tanh(e+f*x)+-1//2*f^-1*tanh(e+f*x)^2*(c+d*x))
@test integrate((b*tanh(e+f*x))^5//2*(c+d*x), x) == :(b^5//2*f^-1*(c+d*x)*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+(1/2)*d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))^2+(1/2)*d*f^-2*(-1b)^5//2*Polylogarithms.polylog(2,1+-2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+(1/2)*d*f^-2*(-1b)^5//2*Polylogarithms.polylog(2,1+-2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*f^-1*(-1b)^5//2*(c+d*x)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))+-4//3*d*b^2*f^-2*(b*tanh(e+f*x))^(1/2)+-2//3*b*f^-1*(b*tanh(e+f*x))^3//2*(c+d*x)+-1//2*d*b^5//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^5//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*f^-2*(-1b)^5//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^2+-1//4*d*f^-2*(-1b)^5//2*Polylogarithms.polylog(2,1+(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2)))+-1//4*d*f^-2*(-1b)^5//2*Polylogarithms.polylog(2,1+-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+1//4*d*b^5//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+1//4*d*b^5//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+2//3*d*b^5//2*f^-2*arctan(b^-1//2*(b*tanh(e+f*x))^(1/2))+2//3*d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+d*f^-2*(-1b)^5//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*f^-2*(-1b)^5//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+-1//2*d*b^5//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+-1//2*d*f^-2*(-1b)^5//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log((1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+-1//2*d*f^-2*(-1b)^5//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2))))
@test integrate((b*tanh(e+f*x))^3//2*(c+d*x), x) == :(b^3//2*f^-1*(c+d*x)*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+(1/2)*d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))^2+(1/2)*d*f^-2*(-1b)^3//2*Polylogarithms.polylog(2,1+-2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+(1/2)*d*f^-2*(-1b)^3//2*Polylogarithms.polylog(2,1+-2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*f^-1*(-1b)^3//2*(c+d*x)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))+-2*b*f^-1*(b*tanh(e+f*x))^(1/2)*(c+d*x)+-2*d*b^3//2*f^-2*arctan(b^-1//2*(b*tanh(e+f*x))^(1/2))+2*d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+-1//2*d*b^3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*f^-2*(-1b)^3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^2+-1//4*d*f^-2*(-1b)^3//2*Polylogarithms.polylog(2,1+(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2)))+-1//4*d*f^-2*(-1b)^3//2*Polylogarithms.polylog(2,1+-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+1//4*d*b^3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+1//4*d*b^3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+d*f^-2*(-1b)^3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*f^-2*(-1b)^3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+-1//2*d*b^3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+-1//2*d*f^-2*(-1b)^3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log((1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+-1//2*d*f^-2*(-1b)^3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2))))
@test integrate((b*tanh(e+f*x))^(1/2)*(c+d*x), x) == :(b^(1/2)*f^-1*(c+d*x)*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+(1/2)*d*b^(1/2)*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))^2+(1/2)*d*f^-2*(-1b)^(1/2)*Polylogarithms.polylog(2,1+-2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+(1/2)*d*f^-2*(-1b)^(1/2)*Polylogarithms.polylog(2,1+-2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*f^-1*(-1b)^(1/2)*(c+d*x)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))+-1//2*d*b^(1/2)*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^(1/2)*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*f^-2*(-1b)^(1/2)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^2+-1//4*d*f^-2*(-1b)^(1/2)*Polylogarithms.polylog(2,1+(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2)))+-1//4*d*f^-2*(-1b)^(1/2)*Polylogarithms.polylog(2,1+-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+1//4*d*b^(1/2)*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+1//4*d*b^(1/2)*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+d*b^(1/2)*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+d*f^-2*(-1b)^(1/2)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*b^(1/2)*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*f^-2*(-1b)^(1/2)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^(1/2)*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+-1//2*d*b^(1/2)*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+-1//2*d*f^-2*(-1b)^(1/2)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log((1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+-1//2*d*f^-2*(-1b)^(1/2)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2))))
@test integrate((b*tanh(e+f*x))^-1//2*(c+d*x), x) == :(b^-1//2*f^-1*(c+d*x)*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+(1/2)*d*b^-1//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))^2+(1/2)*d*f^-2*(-1b)^-1//2*Polylogarithms.polylog(2,1+-2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+(1/2)*d*f^-2*(-1b)^-1//2*Polylogarithms.polylog(2,1+-2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*f^-1*(-1b)^-1//2*(c+d*x)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))+-1//2*d*b^-1//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^-1//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*f^-2*(-1b)^-1//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^2+-1//4*d*f^-2*(-1b)^-1//2*Polylogarithms.polylog(2,1+(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2)))+-1//4*d*f^-2*(-1b)^-1//2*Polylogarithms.polylog(2,1+-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+1//4*d*b^-1//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+1//4*d*b^-1//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+d*b^-1//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+d*f^-2*(-1b)^-1//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*b^-1//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*f^-2*(-1b)^-1//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^-1//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+-1//2*d*b^-1//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+-1//2*d*f^-2*(-1b)^-1//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log((1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+-1//2*d*f^-2*(-1b)^-1//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2))))
@test integrate((b*tanh(e+f*x))^-3//2*(c+d*x), x) == :(b^-3//2*f^-1*(c+d*x)*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+(1/2)*d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))^2+(1/2)*d*f^-2*(-1b)^-3//2*Polylogarithms.polylog(2,1+-2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+(1/2)*d*f^-2*(-1b)^-3//2*Polylogarithms.polylog(2,1+-2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*b^-1*f^-1*(b*tanh(e+f*x))^-1//2*(2c+2*d*x)+-1*f^-1*(-1b)^-3//2*(c+d*x)*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))+2*d*b^-3//2*f^-2*arctan(b^-1//2*(b*tanh(e+f*x))^(1/2))+2*d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))+-1//2*d*b^-3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^-3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*f^-2*(-1b)^-3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^2+-1//4*d*f^-2*(-1b)^-3//2*Polylogarithms.polylog(2,1+(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2)))+-1//4*d*f^-2*(-1b)^-3//2*Polylogarithms.polylog(2,1+-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+1//4*d*b^-3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+1//4*d*b^-3//2*f^-2*Polylogarithms.polylog(2,1+-2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1)+d*f^-2*(-1b)^-3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+-1*(b*tanh(e+f*x))^(1/2))^-1)+-1*d*f^-2*(-1b)^-3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*(1+(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1)+-1//2*d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(-1b)^(1/2))^-1*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+(b*tanh(e+f*x))^(1/2)))+-1//2*d*b^-3//2*f^-2*arctanh(b^-1//2*(b*tanh(e+f*x))^(1/2))*log(2*b^(1/2)*(b^(1/2)+(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*((-1b)^(1/2)+-1*(b*tanh(e+f*x))^(1/2)))+-1//2*d*f^-2*(-1b)^-3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log((1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*(b^(1/2)+(-1b)^(1/2))^-1*(-2*(b*tanh(e+f*x))^(1/2)+2*b^(1/2)))+-1//2*d*f^-2*(-1b)^-3//2*arctanh((-1b)^-1//2*(b*tanh(e+f*x))^(1/2))*log(-1*(1+-1*(-1b)^-1//2*(b*tanh(e+f*x))^(1/2))^-1*((-1b)^(1/2)+-1*b^(1/2))^-1*(2*b^(1/2)+2*(b*tanh(e+f*x))^(1/2))))
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^3, x) == :(-3//8*d^3*f^-4*(a+a*tanh(e+f*x))^-1+-1//2*f^-1*(a+a*tanh(e+f*x))^-1*(c+d*x)^3+1//4*a^-1*f^-1*(c+d*x)^3+1//8*a^-1*d^-1*(c+d*x)^4+-3//4*d*f^-2*(a+a*tanh(e+f*x))^-1*(c+d*x)^2+-3//4*d^2*f^-3*(a+a*tanh(e+f*x))^-1*(c+d*x)+3//8*d*a^-1*f^-2*(c+d*x)^2+3//8*x*a^-1*d^3*f^-3)
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^2, x) == :(-1//2*f^-1*(a+a*tanh(e+f*x))^-1*(c+d*x)^2+-1//4*d^2*f^-3*(a+a*tanh(e+f*x))^-1+1//4*a^-1*f^-1*(c+d*x)^2+1//6*a^-1*d^-1*(c+d*x)^3+-1//2*d*f^-2*(a+a*tanh(e+f*x))^-1*(c+d*x)+1//4*x*a^-1*d^2*f^-2)
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x), x) == :(-1//2*f^-1*(a+a*tanh(e+f*x))^-1*(c+d*x)+-1//4*d*f^-2*(a+a*tanh(e+f*x))^-1+1//4*a^-1*d^-1*(c+d*x)^2+1//4*d*x*a^-1*f^-1)
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^-1, x) == :((1/2)*a^-1*d^-1*log(c+d*x)+(1/2)*a^-1*d^-1*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+(1/2)*a^-1*d^-1*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1//2*a^-1*d^-1*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1//2*a^-1*d^-1*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^-2, x) == :(-1*d^-1*(a+a*tanh(e+f*x))^-1*(c+d*x)^-1+f*a^-1*d^-2*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+f*a^-1*d^-2*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1)+-1*f*a^-1*d^-2*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+-1*f*a^-1*d^-2*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^-3, x) == :(-1//2*d^-1*(a+a*tanh(e+f*x))^-1*(c+d*x)^-2+f*d^-2*(a+a*tanh(e+f*x))^-1*(c+d*x)^-1+-1//2*f*a^-1*d^-2*(c+d*x)^-1+a^-1*d^-3*f^2*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+a^-1*d^-3*f^2*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1*a^-1*d^-3*f^2*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1*a^-1*d^-3*f^2*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x)^3, x) == :(1//16*a^-2*d^-1*(c+d*x)^4+-3//16*a^-2*d^3*f^-4*exp(-2*e+-2*f*x)+-3//512*a^-2*d^3*f^-4*exp(-4*e+-4*f*x)+-1//4*a^-2*f^-1*(c+d*x)^3*exp(-2*e+-2*f*x)+-1//16*a^-2*f^-1*(c+d*x)^3*exp(-4*e+-4*f*x)+-3//8*d*a^-2*f^-2*(c+d*x)^2*exp(-2*e+-2*f*x)+-3//8*a^-2*d^2*f^-3*(c+d*x)*exp(-2*e+-2*f*x)+-3//64*d*a^-2*f^-2*(c+d*x)^2*exp(-4*e+-4*f*x)+-3//128*a^-2*d^2*f^-3*(c+d*x)*exp(-4*e+-4*f*x))
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x)^2, x) == :(1//12*a^-2*d^-1*(c+d*x)^3+-1//4*a^-2*f^-1*(c+d*x)^2*exp(-2*e+-2*f*x)+-1//8*a^-2*d^2*f^-3*exp(-2*e+-2*f*x)+-1//16*a^-2*f^-1*(c+d*x)^2*exp(-4*e+-4*f*x)+-1//128*a^-2*d^2*f^-3*exp(-4*e+-4*f*x)+-1//4*d*a^-2*f^-2*(c+d*x)*exp(-2*e+-2*f*x)+-1//32*d*a^-2*f^-2*(c+d*x)*exp(-4*e+-4*f*x))
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x), x) == :(-3//16*d*f^-2*(a^2+a^2*tanh(e+f*x))^-1+-1//4*f^-1*(a+a*tanh(e+f*x))^-2*(c+d*x)+-1//4*f^-1*(a^2+a^2*tanh(e+f*x))^-1*(c+d*x)+-1//8*d*a^-2*x^2+-1//16*d*f^-2*(a+a*tanh(e+f*x))^-2+1//4*x*a^-2*(c+d*x)+3//16*d*x*a^-2*f^-1)
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x)^-1, x) == :(1//4*a^-2*d^-1*log(c+d*x)+(1/2)*a^-2*d^-1*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+(1/2)*a^-2*d^-1*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1//2*a^-2*d^-1*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1//2*a^-2*d^-1*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1)+-1//4*a^-2*d^-1*cosh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1)+-1//4*a^-2*d^-1*coshintegral(4*f*x+4*c*f*d^-1)*sinh(4*e+-4*c*f*d^-1)+1//4*a^-2*d^-1*cosh(4*e+-4*c*f*d^-1)*coshintegral(4*f*x+4*c*f*d^-1)+1//4*a^-2*d^-1*sinh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x)^-2, x) == :(-1//4*a^-2*d^-1*(c+d*x)^-1+(1/2)*a^-2*d^-1*(c+d*x)^-1*sinh(2*e+2*f*x)+-1//2*a^-2*d^-1*(c+d*x)^-1*cosh(2*e+2*f*x)+-1//4*a^-2*d^-1*(c+d*x)^-1*cosh(2*e+2*f*x)^2+-1//4*a^-2*d^-1*(c+d*x)^-1*sinh(2*e+2*f*x)^2+1//4*a^-2*d^-1*(c+d*x)^-1*sinh(4*e+4*f*x)+f*a^-2*d^-2*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+f*a^-2*d^-2*cosh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1)+f*a^-2*d^-2*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1)+f*a^-2*d^-2*coshintegral(4*f*x+4*c*f*d^-1)*sinh(4*e+-4*c*f*d^-1)+-1*f*a^-2*d^-2*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+-1*f*a^-2*d^-2*cosh(4*e+-4*c*f*d^-1)*coshintegral(4*f*x+4*c*f*d^-1)+-1*f*a^-2*d^-2*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-1*f*a^-2*d^-2*sinh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x)^3, x) == :(1//32*a^-3*d^-1*(c+d*x)^4+-9//64*a^-3*d^3*f^-4*exp(-2*e+-2*f*x)+-9//1024*a^-3*d^3*f^-4*exp(-4*e+-4*f*x)+-3//16*a^-3*f^-1*(c+d*x)^3*exp(-2*e+-2*f*x)+-3//32*a^-3*f^-1*(c+d*x)^3*exp(-4*e+-4*f*x)+-1//48*a^-3*f^-1*(c+d*x)^3*exp(-6*e+-6*f*x)+-1//1728*a^-3*d^3*f^-4*exp(-6*e+-6*f*x)+-9//32*d*a^-3*f^-2*(c+d*x)^2*exp(-2*e+-2*f*x)+-9//32*a^-3*d^2*f^-3*(c+d*x)*exp(-2*e+-2*f*x)+-9//128*d*a^-3*f^-2*(c+d*x)^2*exp(-4*e+-4*f*x)+-9//256*a^-3*d^2*f^-3*(c+d*x)*exp(-4*e+-4*f*x)+-1//96*d*a^-3*f^-2*(c+d*x)^2*exp(-6*e+-6*f*x)+-1//288*a^-3*d^2*f^-3*(c+d*x)*exp(-6*e+-6*f*x))
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x)^2, x) == :(1//24*a^-3*d^-1*(c+d*x)^3+-3//16*a^-3*f^-1*(c+d*x)^2*exp(-2*e+-2*f*x)+-3//32*a^-3*d^2*f^-3*exp(-2*e+-2*f*x)+-3//32*a^-3*f^-1*(c+d*x)^2*exp(-4*e+-4*f*x)+-3//256*a^-3*d^2*f^-3*exp(-4*e+-4*f*x)+-1//48*a^-3*f^-1*(c+d*x)^2*exp(-6*e+-6*f*x)+-1//864*a^-3*d^2*f^-3*exp(-6*e+-6*f*x)+-3//16*d*a^-3*f^-2*(c+d*x)*exp(-2*e+-2*f*x)+-3//64*d*a^-3*f^-2*(c+d*x)*exp(-4*e+-4*f*x)+-1//144*d*a^-3*f^-2*(c+d*x)*exp(-6*e+-6*f*x))
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x), x) == :(-11//96*d*f^-2*(a^3+a^3*tanh(e+f*x))^-1+-1//6*f^-1*(a+a*tanh(e+f*x))^-3*(c+d*x)+-1//8*f^-1*(a^3+a^3*tanh(e+f*x))^-1*(c+d*x)+-1//16*d*a^-3*x^2+-1//36*d*f^-2*(a+a*tanh(e+f*x))^-3+1//8*x*a^-3*(c+d*x)+-5//96*d*a^-1*f^-2*(a+a*tanh(e+f*x))^-2+-1//8*a^-1*f^-1*(a+a*tanh(e+f*x))^-2*(c+d*x)+11//96*d*x*a^-3*f^-1)
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x)^-1, x) == :(1//8*a^-3*d^-1*log(c+d*x)+-3//8*a^-3*d^-1*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-3//8*a^-3*d^-1*cosh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1)+-3//8*a^-3*d^-1*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1)+-3//8*a^-3*d^-1*coshintegral(4*f*x+4*c*f*d^-1)*sinh(4*e+-4*c*f*d^-1)+-1//8*a^-3*d^-1*cosh(6*e+-6*c*f*d^-1)*sinhintegral(6*f*x+6*c*f*d^-1)+-1//8*a^-3*d^-1*coshintegral(6*f*x+6*c*f*d^-1)*sinh(6*e+-6*c*f*d^-1)+1//8*a^-3*d^-1*cosh(6*e+-6*c*f*d^-1)*coshintegral(6*f*x+6*c*f*d^-1)+1//8*a^-3*d^-1*sinh(6*e+-6*c*f*d^-1)*sinhintegral(6*f*x+6*c*f*d^-1)+3//8*a^-3*d^-1*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+3//8*a^-3*d^-1*cosh(4*e+-4*c*f*d^-1)*coshintegral(4*f*x+4*c*f*d^-1)+3//8*a^-3*d^-1*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+3//8*a^-3*d^-1*sinh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x)^-2, x) == :(-1//8*a^-3*d^-1*(c+d*x)^-1+-9//32*a^-3*d^-1*(c+d*x)^-1*cosh(2*e+2*f*x)+-3//8*a^-3*d^-1*(c+d*x)^-1*cosh(2*e+2*f*x)^2+-3//8*a^-3*d^-1*(c+d*x)^-1*sinh(2*e+2*f*x)^2+-3//32*a^-3*d^-1*(c+d*x)^-1*cosh(6*e+6*f*x)+-1//8*a^-3*d^-1*(c+d*x)^-1*cosh(2*e+2*f*x)^3+1//8*a^-3*d^-1*(c+d*x)^-1*sinh(2*e+2*f*x)^3+3//8*a^-3*d^-1*(c+d*x)^-1*sinh(4*e+4*f*x)+3//32*a^-3*d^-1*(c+d*x)^-1*sinh(6*e+6*f*x)+15//32*a^-3*d^-1*(c+d*x)^-1*sinh(2*e+2*f*x)+-3//2*f*a^-3*d^-2*cosh(4*e+-4*c*f*d^-1)*coshintegral(4*f*x+4*c*f*d^-1)+-3//2*f*a^-3*d^-2*sinh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1)+-3//4*f*a^-3*d^-2*cosh(2*e+-2*c*f*d^-1)*coshintegral(2*f*x+2*c*f*d^-1)+-3//4*f*a^-3*d^-2*cosh(6*e+-6*c*f*d^-1)*coshintegral(6*f*x+6*c*f*d^-1)+-3//4*f*a^-3*d^-2*sinh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+-3//4*f*a^-3*d^-2*sinh(6*e+-6*c*f*d^-1)*sinhintegral(6*f*x+6*c*f*d^-1)+3//2*f*a^-3*d^-2*cosh(4*e+-4*c*f*d^-1)*sinhintegral(4*f*x+4*c*f*d^-1)+3//2*f*a^-3*d^-2*coshintegral(4*f*x+4*c*f*d^-1)*sinh(4*e+-4*c*f*d^-1)+3//4*f*a^-3*d^-2*cosh(2*e+-2*c*f*d^-1)*sinhintegral(2*f*x+2*c*f*d^-1)+3//4*f*a^-3*d^-2*cosh(6*e+-6*c*f*d^-1)*sinhintegral(6*f*x+6*c*f*d^-1)+3//4*f*a^-3*d^-2*coshintegral(2*f*x+2*c*f*d^-1)*sinh(2*e+-2*c*f*d^-1)+3//4*f*a^-3*d^-2*coshintegral(6*f*x+6*c*f*d^-1)*sinh(6*e+-6*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-1*(c+d*x)^m, x) == :((1/2)*a^-1*d^-1*(1+m)^-1*(c+d*x)^(1+m)+-1*2^(-2+-1m)*a^-1*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,2*f*d^-1*(c+d*x))*exp(-2*e+2*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-2*(c+d*x)^m, x) == :(1//4*a^-2*d^-1*(1+m)^-1*(c+d*x)^(1+m)+-1*2^(-2+-1m)*a^-2*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,2*f*d^-1*(c+d*x))*exp(-2*e+2*c*f*d^-1)+-1*4^(-2+-1m)*a^-2*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,4*f*d^-1*(c+d*x))*exp(-4*e+4*c*f*d^-1))
@test integrate((a+a*tanh(e+f*x))^-3*(c+d*x)^m, x) == :(1//8*a^-3*d^-1*(1+m)^-1*(c+d*x)^(1+m)+-3*2^(-5+-2m)*a^-3*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,4*f*d^-1*(c+d*x))*exp(-4*e+4*c*f*d^-1)+-3*2^(-4+-1m)*a^-3*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,2*f*d^-1*(c+d*x))*exp(-2*e+2*c*f*d^-1)+-1*2^(-4+-1m)*3^(-1+-1m)*a^-3*f^-1*(f*d^-1*(c+d*x))^(-1m)*(c+d*x)^m*SpecialFunctions.gamma(1+m,6*f*d^-1*(c+d*x))*exp(-6*e+6*c*f*d^-1))
@test integrate((c+d*x)^3*(a+b*tanh(e+f*x)), x) == :(-1//4*b*d^-1*(c+d*x)^4+1//4*a*d^-1*(c+d*x)^4+b*f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+3//4*b*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+-3//2*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3//2*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((c+d*x)^2*(a+b*tanh(e+f*x)), x) == :(-1//3*b*d^-1*(c+d*x)^3+1//3*a*d^-1*(c+d*x)^3+b*f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+-1//2*b*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))*(c+d*x), x) == :((1/2)*a*d^-1*(c+d*x)^2+-1//2*b*d^-1*(c+d*x)^2+b*f^-1*(c+d*x)*log(1+exp(2*e+2*f*x))+(1/2)*b*d*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^2*(c+d*x)^3, x) == :(-1*b^2*f^-1*(c+d*x)^3+1//4*a^2*d^-1*(c+d*x)^4+1//4*b^2*d^-1*(c+d*x)^4+-1*b^2*f^-1*(c+d*x)^3*tanh(e+f*x)+-3//2*b^2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+-1//2*a*b*d^-1*(c+d*x)^4+2*a*b*f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+3*d*b^2*f^-2*(c+d*x)^2*log(1+exp(2*e+2*f*x))+3*b^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+3//2*a*b*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+-3*a*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3*a*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^2*(c+d*x)^2, x) == :(-1*b^2*f^-1*(c+d*x)^2+1//3*a^2*d^-1*(c+d*x)^3+1//3*b^2*d^-1*(c+d*x)^3+b^2*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-1*b^2*f^-1*(c+d*x)^2*tanh(e+f*x)+-2//3*a*b*d^-1*(c+d*x)^3+-1*a*b*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+2*a*b*f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+2*d*b^2*f^-2*(c+d*x)*log(1+exp(2*e+2*f*x))+2*a*b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^2*(c+d*x), x) == :(c*x*b^2+(1/2)*d*b^2*x^2+(1/2)*a^2*d^-1*(c+d*x)^2+d*b^2*f^-2*log(cosh(e+f*x))+-1*a*b*d^-1*(c+d*x)^2+-1*b^2*f^-1*(c+d*x)*tanh(e+f*x)+a*b*d*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+2*a*b*f^-1*(c+d*x)*log(1+exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^3*(c+d*x)^3, x) == :((1/2)*b^3*f^-1*(c+d*x)^3+-1//4*b^3*d^-1*(c+d*x)^4+1//4*a^3*d^-1*(c+d*x)^4+b^3*f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+-3*a*b^2*f^-1*(c+d*x)^3+-3//2*d*b^3*f^-2*(c+d*x)^2+-3//4*b*a^2*d^-1*(c+d*x)^4+-1//2*b^3*f^-1*(c+d*x)^3*tanh(e+f*x)^2+3//2*b^3*d^3*f^-4*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+3//4*a*b^2*d^-1*(c+d*x)^4+3//4*b^3*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+-3*a*b^2*f^-1*(c+d*x)^3*tanh(e+f*x)+3*b*a^2*f^-1*(c+d*x)^3*log(1+exp(2*e+2*f*x))+3*b^3*d^2*f^-3*(c+d*x)*log(1+exp(2*e+2*f*x))+-9//2*a*b^2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+-3//2*d*b^3*f^-2*(c+d*x)^2*tanh(e+f*x)+-3//2*b^3*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3//2*d*b^3*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+9//4*b*a^2*d^3*f^-4*Polylogarithms.polylog(4,-1*exp(2*e+2*f*x))+9*a*d*b^2*f^-2*(c+d*x)^2*log(1+exp(2*e+2*f*x))+9*a*b^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-9//2*b*a^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+9//2*b*d*a^2*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^3*(c+d*x)^2, x) == :(-1//3*b^3*d^-1*(c+d*x)^3+1//3*a^3*d^-1*(c+d*x)^3+a*b^2*d^-1*(c+d*x)^3+b^3*d^2*f^-3*log(cosh(e+f*x))+b^3*f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+(1/2)*b^3*d^2*f^-1*x^2+-1*b*a^2*d^-1*(c+d*x)^3+-3*a*b^2*f^-1*(c+d*x)^2+-1//2*b^3*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+-1//2*b^3*f^-1*(c+d*x)^2*tanh(e+f*x)^2+c*d*x*b^3*f^-1+d*b^3*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+-1*d*b^3*f^-2*(c+d*x)*tanh(e+f*x)+-3*a*b^2*f^-1*(c+d*x)^2*tanh(e+f*x)+3*a*b^2*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+3*b*a^2*f^-1*(c+d*x)^2*log(1+exp(2*e+2*f*x))+-3//2*b*a^2*d^2*f^-3*Polylogarithms.polylog(3,-1*exp(2*e+2*f*x))+3*b*d*a^2*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+6*a*d*b^2*f^-2*(c+d*x)*log(1+exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^3*(c+d*x), x) == :((1/2)*a^3*d^-1*(c+d*x)^2+-1//2*b^3*d^-1*(c+d*x)^2+b^3*f^-1*(c+d*x)*log(1+exp(2*e+2*f*x))+(1/2)*d*x*b^3*f^-1+(1/2)*d*b^3*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x))+3*a*c*x*b^2+-3//2*b*a^2*d^-1*(c+d*x)^2+-1//2*d*b^3*f^-2*tanh(e+f*x)+-1//2*b^3*f^-1*tanh(e+f*x)^2*(c+d*x)+3//2*a*d*b^2*x^2+-3*a*b^2*f^-1*(c+d*x)*tanh(e+f*x)+3*a*d*b^2*f^-2*log(cosh(e+f*x))+3*b*a^2*f^-1*(c+d*x)*log(1+exp(2*e+2*f*x))+3//2*b*d*a^2*f^-2*Polylogarithms.polylog(2,-1*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-1*(c+d*x)^3, x) == :(d^-1*(c+d*x)^4*(4a+4b)^-1+-1*b*f^-1*(c+d*x)^3*(a^2+-1*b^2)^-1*log(1+(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+3*b*d^3*f^-4*(-4*b^2+4*a^2)^-1*Polylogarithms.polylog(4,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+3*b*d*f^-2*(c+d*x)^2*(-2*b^2+2*a^2)^-1*Polylogarithms.polylog(2,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+3*b*d^2*f^-3*(-2*b^2+2*a^2)^-1*(c+d*x)*Polylogarithms.polylog(3,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-1*(c+d*x)^2, x) == :(d^-1*(c+d*x)^3*(3a+3b)^-1+b*d^2*f^-3*(-2*b^2+2*a^2)^-1*Polylogarithms.polylog(3,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+-1*b*f^-1*(c+d*x)^2*(a^2+-1*b^2)^-1*log(1+(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+b*d*f^-2*(a^2+-1*b^2)^-1*(c+d*x)*Polylogarithms.polylog(2,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-1*(c+d*x), x) == :(d^-1*(c+d*x)^2*(2a+2b)^-1+b*d*f^-2*(-2*b^2+2*a^2)^-1*Polylogarithms.polylog(2,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+-1*b*f^-1*(a^2+-1*b^2)^-1*(c+d*x)*log(1+(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-2*(c+d*x)^3, x) == :(1//4*d^-1*(a+-1b)^-2*(c+d*x)^4+-2*b^2*f^-1*(c+d*x)^3*(a^2+-1*b^2)^-2+2*b^2*f^-1*(c+d*x)^3*(a^2+-1*b^2)^-2*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-3//2*b^2*d^3*f^-4*(a^2+-1*b^2)^-2*Polylogarithms.polylog(3,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+3//2*b^2*d^3*f^-4*(a^2+-1*b^2)^-2*Polylogarithms.polylog(4,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-3*b^2*d^2*f^-3*(a^2+-1*b^2)^-2*(c+d*x)*Polylogarithms.polylog(3,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-2*b*f^-1*(a+b)^-1*(a+-1b)^-2*(c+d*x)^3*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+2*b^2*f^-1*(a+b)^-2*(a+-1b)^-1*(c+d*x)^3*(a+-1b+(a+b)*exp(2*e+2*f*x))^-1+3*d*b^2*f^-2*(c+d*x)^2*(a^2+-1*b^2)^-2*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+3*d*b^2*f^-2*(c+d*x)^2*(a^2+-1*b^2)^-2*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+3*b^2*d^2*f^-3*(a^2+-1*b^2)^-2*(c+d*x)*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-3//2*b*d^3*f^-4*(a+b)^-1*(a+-1b)^-2*Polylogarithms.polylog(4,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-3*b*d*f^-2*(a+b)^-1*(a+-1b)^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+3*b*d^2*f^-3*(a+b)^-1*(a+-1b)^-2*(c+d*x)*Polylogarithms.polylog(3,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-2*(c+d*x)^2, x) == :(1//3*d^-1*(a+-1b)^-2*(c+d*x)^3+-2*b^2*f^-1*(c+d*x)^2*(a^2+-1*b^2)^-2+b^2*d^2*f^-3*(a^2+-1*b^2)^-2*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-1*b^2*d^2*f^-3*(a^2+-1*b^2)^-2*Polylogarithms.polylog(3,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+2*b^2*f^-1*(c+d*x)^2*(a^2+-1*b^2)^-2*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+b*d^2*f^-3*(a+b)^-1*(a+-1b)^-2*Polylogarithms.polylog(3,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+-2*b*f^-1*(a+b)^-1*(a+-1b)^-2*(c+d*x)^2*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+2*d*b^2*f^-2*(a^2+-1*b^2)^-2*(c+d*x)*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+2*d*b^2*f^-2*(a^2+-1*b^2)^-2*(c+d*x)*log(1+(a+-1b)^-1*(a+b)*exp(2*e+2*f*x))+2*b^2*f^-1*(a+b)^-2*(a+-1b)^-1*(c+d*x)^2*(a+-1b+(a+b)*exp(2*e+2*f*x))^-1+-2*b*d*f^-2*(a+b)^-1*(a+-1b)^-2*(c+d*x)*Polylogarithms.polylog(2,-1*(a+-1b)^-1*(a+b)*exp(2*e+2*f*x)))
@test integrate((a+b*tanh(e+f*x))^-2*(c+d*x), x) == :(-1*d^-1*(c+d*x)^2*(-2*b^2+2*a^2)^-1+b*f^-1*(a+b*tanh(e+f*x))^-1*(a^2+-1*b^2)^-1*(c+d*x)+b*f^-2*(a^2+-1*b^2)^-2*(b*d+-2*a*c*f+-2*a*d*f*x)*log(1+(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+a*b*d*f^-2*(a^2+-1*b^2)^-2*Polylogarithms.polylog(2,-1*(a+b)^-1*(a+-1b)*exp(-2*e+-2*f*x))+1//4*a^-1*d^-1*f^-2*(a+b)^-2*(a+-1b)^-1*(b*d+-2*a*c*f+-2*a*d*f*x)^2)