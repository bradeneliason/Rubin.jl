using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((d+e*x)^4*(a+b*arctanh(c*x)), x) == :(1//5*e^-1*(d+e*x)^5*(a+b*arctanh(c*x))+1//20*b*c^-1*e^4*x^4+-1//10*b*c^-5*e^-1*(-1*e+c*d)^5*log(1+c*x)+1//3*b*d*c^-1*e^3*x^3+1//10*b*c^-5*e^-1*(e+c*d)^5*log(1+-1*c*x)+1//10*b*c^-3*e^2*x^2*(e^2+10*c^2*d^2)+b*d*e*x*c^-3*(e^2+2*c^2*d^2))
@test integrate((d+e*x)^3*(a+b*arctanh(c*x)), x) == :(1//4*e^-1*(d+e*x)^4*(a+b*arctanh(c*x))+1//12*b*c^-1*e^3*x^3+(1/2)*b*d*c^-1*e^2*x^2+-1//8*b*c^-4*e^-1*(-1*e+c*d)^4*log(1+c*x)+1//4*b*e*x*c^-3*(e^2+6*c^2*d^2)+1//8*b*c^-4*e^-1*(e+c*d)^4*log(1+-1*c*x))
@test integrate((d+e*x)^2*(a+b*arctanh(c*x)), x) == :(1//3*e^-1*(d+e*x)^3*(a+b*arctanh(c*x))+1//6*b*c^-1*e^2*x^2+b*d*e*x*c^-1+-1//6*b*c^-3*e^-1*(-1*e+c*d)^3*log(1+c*x)+1//6*b*c^-3*e^-1*(e+c*d)^3*log(1+-1*c*x))
@test integrate((a+b*arctanh(c*x))*(d+e*x), x) == :((1/2)*e^-1*(d+e*x)^2*(a+b*arctanh(c*x))+(1/2)*b*e*x*c^-1+-1//4*b*c^-2*e^-1*(-1*e+c*d)^2*log(1+c*x)+1//4*b*c^-2*e^-1*(e+c*d)^2*log(1+-1*c*x))
@test integrate((d+e*x)^-1*(a+b*arctanh(c*x)), x) == :(e^-1*(a+b*arctanh(c*x))*log(2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+(1/2)*b*e^-1*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+-1*e^-1*(a+b*arctanh(c*x))*log(2*(1+c*x)^-1)+-1//2*b*e^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x)))
@test integrate((d+e*x)^-2*(a+b*arctanh(c*x)), x) == :(-1*e^-1*(d+e*x)^-1*(a+b*arctanh(c*x))+-1*b*c*(-1*e^2+c^2*d^2)^-1*log(d+e*x)+b*c*e^-1*(-2*e+2*c*d)^-1*log(1+c*x)+-1//2*b*c*e^-1*(e+c*d)^-1*log(1+-1*c*x))
@test integrate((d+e*x)^-3*(a+b*arctanh(c*x)), x) == :(-1//2*e^-1*(d+e*x)^-2*(a+b*arctanh(c*x))+b*c*(d+e*x)^-1*(-2*e^2+2*c^2*d^2)^-1+-1*b*d*c^3*(-1*e^2+c^2*d^2)^-2*log(d+e*x)+-1//4*b*c^2*e^-1*(e+c*d)^-2*log(1+-1*c*x)+1//4*b*c^2*e^-1*(-1*e+c*d)^-2*log(1+c*x))
@test integrate((a+b*arctanh(c*x))^2*(d+e*x)^3, x) == :(1//4*e^-1*(a+b*arctanh(c*x))^2*(d+e*x)^4+d*c^-3*(a+b*arctanh(c*x))^2*(e^2+c^2*d^2)+-1//4*c^-4*e^-1*(a+b*arctanh(c*x))^2*(e^4+c^4*d^4+6*c^2*d^2*e^2)+1//12*b^2*c^-4*e^3*log(1+-1*c^2*x^2)+1//12*b^2*c^-2*e^3*x^2+d*x*b^2*c^-2*e^2+-1*d*b^2*c^-3*e^2*arctanh(c*x)+-1*d*b^2*c^-3*(e^2+c^2*d^2)*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+1//4*e*b^2*c^-4*(e^2+6*c^2*d^2)*log(1+-1*c^2*x^2)+1//6*b*c^-1*e^3*x^3*(a+b*arctanh(c*x))+b*d*c^-1*e^2*x^2*(a+b*arctanh(c*x))+(1/2)*a*b*e*x*c^-3*(e^2+6*c^2*d^2)+(1/2)*e*x*b^2*c^-3*(e^2+6*c^2*d^2)*arctanh(c*x)+-2*b*d*c^-3*(a+b*arctanh(c*x))*(e^2+c^2*d^2)*log(2*(1+-1*c*x)^-1))
@test integrate((a+b*arctanh(c*x))^2*(d+e*x)^2, x) == :(1//3*c^-3*(a+b*arctanh(c*x))^2*(e^2+3*c^2*d^2)+1//3*e^-1*(a+b*arctanh(c*x))^2*(d+e*x)^3+-1//3*d*e^-1*(a+b*arctanh(c*x))^2*(d^2+3*c^-2*e^2)+-1//3*b^2*c^-3*e^2*arctanh(c*x)+-1//3*b^2*c^-3*(e^2+3*c^2*d^2)*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+1//3*x*b^2*c^-2*e^2+d*e*b^2*c^-2*log(1+-1*c^2*x^2)+-2//3*b*c^-3*(a+b*arctanh(c*x))*(e^2+3*c^2*d^2)*log(2*(1+-1*c*x)^-1)+1//3*b*c^-1*e^2*x^2*(a+b*arctanh(c*x))+2*a*b*d*e*x*c^-1+2*d*e*x*b^2*c^-1*arctanh(c*x))
@test integrate((a+b*arctanh(c*x))^2*(d+e*x), x) == :(d*c^-1*(a+b*arctanh(c*x))^2+(1/2)*e^-1*(a+b*arctanh(c*x))^2*(d+e*x)^2+-1//2*e^-1*(a+b*arctanh(c*x))^2*(d^2+c^-2*e^2)+(1/2)*e*b^2*c^-2*log(1+-1*c^2*x^2)+-1*d*b^2*c^-1*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+a*b*e*x*c^-1+e*x*b^2*c^-1*arctanh(c*x)+-2*b*d*c^-1*(a+b*arctanh(c*x))*log(2*(1+-1*c*x)^-1))
@test integrate((a+b*arctanh(c*x))^2*(d+e*x)^-1, x) == :(e^-1*(a+b*arctanh(c*x))^2*log(2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+(1/2)*b^2*e^-1*Polylogarithms.polylog(3,1+-2*(1+c*x)^-1)+-1*e^-1*(a+b*arctanh(c*x))^2*log(2*(1+c*x)^-1)+-1//2*b^2*e^-1*Polylogarithms.polylog(3,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+b*e^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+-1*b*e^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x)))
@test integrate((a+b*arctanh(c*x))^2*(d+e*x)^-2, x) == :(-1*e^-1*(a+b*arctanh(c*x))^2*(d+e*x)^-1+c*b^2*(-1*e^2+c^2*d^2)^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+-1*c*b^2*(-1*e^2+c^2*d^2)^-1*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+c*b^2*e^-1*(-2*e+2*c*d)^-1*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+(1/2)*c*b^2*e^-1*(e+c*d)^-1*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+-2*b*c*(-1*e^2+c^2*d^2)^-1*(a+b*arctanh(c*x))*log(2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+2*b*c*(-1*e^2+c^2*d^2)^-1*(a+b*arctanh(c*x))*log(2*(1+c*x)^-1)+b*c*e^-1*(e+c*d)^-1*(a+b*arctanh(c*x))*log(2*(1+-1*c*x)^-1)+-1*b*c*e^-1*(-1*e+c*d)^-1*(a+b*arctanh(c*x))*log(2*(1+c*x)^-1))
@test integrate((a+b*arctanh(c*x))^3*(d+e*x)^3, x) == :(1//4*e^-1*(a+b*arctanh(c*x))^3*(d+e*x)^4+d*c^-3*(a+b*arctanh(c*x))^3*(e^2+c^2*d^2)+-1//4*b^3*c^-4*e^3*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+-1//4*b^3*c^-4*e^3*arctanh(c*x)+-1//4*c^-4*e^-1*(a+b*arctanh(c*x))^3*(e^4+c^4*d^4+6*c^2*d^2*e^2)+1//4*b*c^-4*e^3*(a+b*arctanh(c*x))^2+1//4*x*b^3*c^-3*e^3+-3//2*b*d*c^-3*e^2*(a+b*arctanh(c*x))^2+-3//4*e*b^3*c^-4*(e^2+6*c^2*d^2)*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+-1//2*b^2*c^-4*e^3*(a+b*arctanh(c*x))*log(2*(1+-1*c*x)^-1)+1//4*b*c^-1*e^3*x^3*(a+b*arctanh(c*x))^2+1//4*b^2*c^-2*e^3*x^2*(a+b*arctanh(c*x))+3//2*d*b^3*c^-3*e^2*log(1+-1*c^2*x^2)+3//2*d*b^3*c^-3*(e^2+c^2*d^2)*Polylogarithms.polylog(3,1+-2*(1+-1*c*x)^-1)+3//4*b*e*c^-4*(a+b*arctanh(c*x))^2*(e^2+6*c^2*d^2)+-3*b*d*c^-3*(a+b*arctanh(c*x))^2*(e^2+c^2*d^2)*log(2*(1+-1*c*x)^-1)+-3*d*b^2*c^-3*(a+b*arctanh(c*x))*(e^2+c^2*d^2)*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+3*a*d*x*b^2*c^-2*e^2+3*d*x*b^3*c^-2*e^2*arctanh(c*x)+-3//2*e*b^2*c^-4*(a+b*arctanh(c*x))*(e^2+6*c^2*d^2)*log(2*(1+-1*c*x)^-1)+3//2*b*d*c^-1*e^2*x^2*(a+b*arctanh(c*x))^2+3//4*b*e*x*c^-3*(a+b*arctanh(c*x))^2*(e^2+6*c^2*d^2))
@test integrate((a+b*arctanh(c*x))^3*(d+e*x)^2, x) == :(1//3*c^-3*(a+b*arctanh(c*x))^3*(e^2+3*c^2*d^2)+1//3*e^-1*(a+b*arctanh(c*x))^3*(d+e*x)^3+(1/2)*b^3*c^-3*e^2*log(1+-1*c^2*x^2)+(1/2)*b^3*c^-3*(e^2+3*c^2*d^2)*Polylogarithms.polylog(3,1+-2*(1+-1*c*x)^-1)+-1//2*b*c^-3*e^2*(a+b*arctanh(c*x))^2+-1//3*d*e^-1*(a+b*arctanh(c*x))^3*(d^2+3*c^-2*e^2)+a*x*b^2*c^-2*e^2+x*b^3*c^-2*e^2*arctanh(c*x)+(1/2)*b*c^-1*e^2*x^2*(a+b*arctanh(c*x))^2+-1*b*c^-3*(a+b*arctanh(c*x))^2*(e^2+3*c^2*d^2)*log(2*(1+-1*c*x)^-1)+-1*b^2*c^-3*(a+b*arctanh(c*x))*(e^2+3*c^2*d^2)*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+-3*d*e*b^3*c^-2*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+3*b*d*e*c^-2*(a+b*arctanh(c*x))^2+-6*d*e*b^2*c^-2*(a+b*arctanh(c*x))*log(2*(1+-1*c*x)^-1)+3*b*d*e*x*c^-1*(a+b*arctanh(c*x))^2)
@test integrate((a+b*arctanh(c*x))^3*(d+e*x), x) == :(d*c^-1*(a+b*arctanh(c*x))^3+(1/2)*e^-1*(a+b*arctanh(c*x))^3*(d+e*x)^2+-1//2*e^-1*(a+b*arctanh(c*x))^3*(d^2+c^-2*e^2)+-3//2*e*b^3*c^-2*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+3//2*b*e*c^-2*(a+b*arctanh(c*x))^2+3//2*d*b^3*c^-1*Polylogarithms.polylog(3,1+-2*(1+-1*c*x)^-1)+-3*b*d*c^-1*(a+b*arctanh(c*x))^2*log(2*(1+-1*c*x)^-1)+-3*d*b^2*c^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1)+-3*e*b^2*c^-2*(a+b*arctanh(c*x))*log(2*(1+-1*c*x)^-1)+3//2*b*e*x*c^-1*(a+b*arctanh(c*x))^2)
@test integrate((a+b*arctanh(c*x))^3*(d+e*x)^-1, x) == :(e^-1*(a+b*arctanh(c*x))^3*log(2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+-1*e^-1*(a+b*arctanh(c*x))^3*log(2*(1+c*x)^-1)+-3//4*b^3*e^-1*Polylogarithms.polylog(4,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+3//4*b^3*e^-1*Polylogarithms.polylog(4,1+-2*(1+c*x)^-1)+-3//2*b*e^-1*(a+b*arctanh(c*x))^2*Polylogarithms.polylog(2,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+-3//2*b^2*e^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(3,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+3//2*b*e^-1*(a+b*arctanh(c*x))^2*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+3//2*b^2*e^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(3,1+-2*(1+c*x)^-1))
@test integrate((a+b*arctanh(c*x))^3*(d+e*x)^-2, x) == :(-1*e^-1*(a+b*arctanh(c*x))^3*(d+e*x)^-1+-3*c*b^3*(-2*e^2+2*c^2*d^2)^-1*Polylogarithms.polylog(3,1+-2*(1+c*x)^-1)+3*c*b^3*(-2*e^2+2*c^2*d^2)^-1*Polylogarithms.polylog(3,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+-3*b*c*(a+b*arctanh(c*x))^2*(-1*e^2+c^2*d^2)^-1*log(2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+-3*c*b^2*(-1*e^2+c^2*d^2)^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+3*b*c*(a+b*arctanh(c*x))^2*(-1*e^2+c^2*d^2)^-1*log(2*(1+c*x)^-1)+3*c*b^2*(-1*e^2+c^2*d^2)^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*c*(1+c*x)^-1*(e+c*d)^-1*(d+e*x))+3*c*b^3*e^-1*(-4*e+4*c*d)^-1*Polylogarithms.polylog(3,1+-2*(1+c*x)^-1)+-3//4*c*b^3*e^-1*(e+c*d)^-1*Polylogarithms.polylog(3,1+-2*(1+-1*c*x)^-1)+-3*b*c*e^-1*(a+b*arctanh(c*x))^2*(-2*e+2*c*d)^-1*log(2*(1+c*x)^-1)+3*c*b^2*e^-1*(-2*e+2*c*d)^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*(1+c*x)^-1)+3//2*b*c*e^-1*(a+b*arctanh(c*x))^2*(e+c*d)^-1*log(2*(1+-1*c*x)^-1)+3//2*c*b^2*e^-1*(e+c*d)^-1*(a+b*arctanh(c*x))*Polylogarithms.polylog(2,1+-2*(1+-1*c*x)^-1))
@test integrate((d+e*x)^3*(a+b*arctanh(c*x^2)), x) == :(1//4*e^-1*(d+e*x)^4*(a+b*arctanh(c*x^2))+1//4*b*c^-1*e^3*x^2+b*d*c^-3//2*(-1*e^2+c*d^2)*arctan(x*c^(1/2))+-1*b*d*c^-3//2*(e^2+c*d^2)*arctanh(x*c^(1/2))+2*b*d*x*c^-1*e^2+-1//8*b*c^-2*e^-1*(e^4+c^2*d^4+-6*c*d^2*e^2)*log(1+c*x^2)+1//8*b*c^-2*e^-1*(e^4+c^2*d^4+6*c*d^2*e^2)*log(1+-1*c*x^2))
@test integrate((d+e*x)^2*(a+b*arctanh(c*x^2)), x) == :(1//3*e^-1*(d+e*x)^3*(a+b*arctanh(c*x^2))+-1//3*b*c^-3//2*(e^2+3*c*d^2)*arctanh(x*c^(1/2))+1//3*b*c^-3//2*(-1*e^2+3*c*d^2)*arctan(x*c^(1/2))+2//3*b*x*c^-1*e^2+-1//6*b*d*c^-1*e^-1*(-3*e^2+c*d^2)*log(1+c*x^2)+1//6*b*d*c^-1*e^-1*(3*e^2+c*d^2)*log(1+-1*c*x^2))
@test integrate((a+b*arctanh(c*x^2))*(d+e*x), x) == :((1/2)*e^-1*(d+e*x)^2*(a+b*arctanh(c*x^2))+b*d*c^-1//2*arctan(x*c^(1/2))+-1*b*d*c^-1//2*arctanh(x*c^(1/2))+-1//4*b*c^-1*e^-1*(-1*e^2+c*d^2)*log(1+c*x^2)+1//4*b*c^-1*e^-1*(e^2+c*d^2)*log(1+-1*c*x^2))
@test integrate((d+e*x)^-1*(a+b*arctanh(c*x^2)), x) == :(e^-1*(a+b*arctanh(c*x^2))*log(d+e*x)+(1/2)*b*e^-1*Polylogarithms.polylog(2,c^(1/2)*(e+d*c^(1/2))^-1*(d+e*x))+(1/2)*b*e^-1*Polylogarithms.polylog(2,c^(1/2)*(-1*e+d*c^(1/2))^-1*(d+e*x))+-1//2*b*e^-1*Polylogarithms.polylog(2,(-1c)^(1/2)*(e+d*(-1c)^(1/2))^-1*(d+e*x))+-1//2*b*e^-1*Polylogarithms.polylog(2,(-1c)^(1/2)*(-1*e+d*(-1c)^(1/2))^-1*(d+e*x))+(1/2)*b*e^-1*log(e*(e+d*c^(1/2))^-1*(1+-1*x*c^(1/2)))*log(d+e*x)+(1/2)*b*e^-1*log(-1*e*(-1*e+d*c^(1/2))^-1*(1+x*c^(1/2)))*log(d+e*x)+-1//2*b*e^-1*log(e*(e+d*(-1c)^(1/2))^-1*(1+-1*x*(-1c)^(1/2)))*log(d+e*x)+-1//2*b*e^-1*log(-1*e*(-1*e+d*(-1c)^(1/2))^-1*(1+x*(-1c)^(1/2)))*log(d+e*x))
@test integrate((d+e*x)^-2*(a+b*arctanh(c*x^2)), x) == :(-1*e^-1*(d+e*x)^-1*(a+b*arctanh(c*x^2))+b*c^(1/2)*(e^2+c*d^2)^-1*arctan(x*c^(1/2))+-1*b*c^(1/2)*(-1*e^2+c*d^2)^-1*arctanh(x*c^(1/2))+(1/2)*b*c*d*e^-1*(e^2+c*d^2)^-1*log(1+c*x^2)+2*b*c*d*e*(-1*e^4+c^2*d^4)^-1*log(d+e*x)+-1//2*b*c*d*e^-1*(-1*e^2+c*d^2)^-1*log(1+-1*c*x^2))
@test integrate((d+e*x)^-3*(a+b*arctanh(c*x^2)), x) == :(-1//2*e^-1*(d+e*x)^-2*(a+b*arctanh(c*x^2))+b*d*c^3//2*(e^2+c*d^2)^-2*arctan(x*c^(1/2))+-1*b*d*c^3//2*(-1*e^2+c*d^2)^-2*arctanh(x*c^(1/2))+b*c*e*(-1*e^4+c^2*d^4)^-2*(e^4+3*c^2*d^4)*log(d+e*x)+-1*b*c*d*e*(d+e*x)^-1*(-1*e^4+c^2*d^4)^-1+-1//4*b*c*e^-1*(-1*e^2+c*d^2)^-2*(e^2+c*d^2)*log(1+-1*c*x^2)+1//4*b*c*e^-1*(e^2+c*d^2)^-2*(-1*e^2+c*d^2)*log(1+c*x^2))
@test integrate((a+b*arctanh(c*x^2))^2*(d+e*x), x) == :(d*x*a^2+(1/2)*e*c^-1*(a+b*arctanh(c*x^2))^2+(1/2)*e*x^2*(a+b*arctanh(c*x^2))^2+d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-2*(1+x*c^(1/2))^-1)+d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-2*(1+-1*x*c^(1/2))^-1)+-1*d*b^2*c^-1//2*arctanh(x*c^(1/2))^2+-1//2*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-2*c^(1/2)*(1+x*c^(1/2))^-1*(c^(1/2)+(-1c)^(1/2))^-1*(1+x*(-1c)^(1/2)))+-1//2*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+2*c^(1/2)*(1+x*c^(1/2))^-1*((-1c)^(1/2)+-1*c^(1/2))^-1*(1+-1*x*(-1c)^(1/2)))+-1//2*e*b^2*c^-1*Polylogarithms.polylog(2,1+-2*(1+-1*c*x^2)^-1)+1//4*d*x*b^2*log(1+c*x^2)^2+1//4*d*x*b^2*log(1+-1*c*x^2)^2+im*d*b^2*c^-1//2*arctan(x*c^(1/2))^2+im*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-2*(1+im*x*c^(1/2))^-1)+im*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-2*(1+-1*im*x*c^(1/2))^-1)+a*b*d*x*log(1+c*x^2)+d*b^2*c^-1//2*arctan(x*c^(1/2))*log((1+-1*im*x*c^(1/2))^-1*(1+im)*(1+-1*x*c^(1/2)))+d*b^2*c^-1//2*arctan(x*c^(1/2))*log((1+-1*im*x*c^(1/2))^-1*(1+-1im)*(1+x*c^(1/2)))+d*b^2*c^-1//2*arctan(x*c^(1/2))*log(1+c*x^2)+d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(-2*c^(1/2)*(1+x*c^(1/2))^-1*((-1c)^(1/2)+-1*c^(1/2))^-1*(1+-1*x*(-1c)^(1/2)))+d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(2*c^(1/2)*(1+x*c^(1/2))^-1*(c^(1/2)+(-1c)^(1/2))^-1*(1+x*(-1c)^(1/2)))+d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(1+-1*c*x^2)+-1*a*b*d*x*log(1+-1*c*x^2)+-1*b*e*c^-1*(a+b*arctanh(c*x^2))*log(2*(1+-1*c*x^2)^-1)+-1*d*b^2*c^-1//2*arctan(x*c^(1/2))*log(1+-1*c*x^2)+-1*d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(1+c*x^2)+-2*a*b*d*c^-1//2*arctanh(x*c^(1/2))+-2*d*b^2*c^-1//2*arctan(x*c^(1/2))*log(2*(1+-1*im*x*c^(1/2))^-1)+-2*d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(2*(1+x*c^(1/2))^-1)+2*a*b*d*c^-1//2*arctan(x*c^(1/2))+2*d*b^2*c^-1//2*arctan(x*c^(1/2))*log(2*(1+im*x*c^(1/2))^-1)+2*d*b^2*c^-1//2*arctanh(x*c^(1/2))*log(2*(1+-1*x*c^(1/2))^-1)+-1//2*im*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-1*(1+-1*im*x*c^(1/2))^-1*(1+im)*(1+-1*x*c^(1/2)))+-1//2*im*d*b^2*c^-1//2*Polylogarithms.polylog(2,1+-1*(1+-1*im*x*c^(1/2))^-1*(1+-1im)*(1+x*c^(1/2)))+-1//2*d*x*b^2*log(1+c*x^2)*log(1+-1*c*x^2))
@test integrate((d+e*x)^2*(a+b*arctanh(c*x^3)), x) == :(1//3*e^-1*(d+e*x)^3*(a+b*arctanh(c*x^3))+(1/2)*b*c^-1//3*d^2*log(1+-1*c^2//3*x^2)+-1//4*b*c^-1//3*d^2*log(1+c^2//3*x^2+c^4//3*x^4)+(1/2)*b*3^(1/2)*c^-1//3*d^2*arctan(1//3*3^(1/2)*(1+2*c^2//3*x^2))+-1*b*d*e*c^-2//3*arctanh(x*c^1//3)+-1//4*b*d*e*c^-2//3*log(1+x*c^1//3+c^2//3*x^2)+-1//6*b*c^-1*e^-1*(-1*e^3+c*d^3)*log(1+c*x^3)+1//4*b*d*e*c^-2//3*log(1+c^2//3*x^2+-1*x*c^1//3)+1//6*b*c^-1*e^-1*(e^3+c*d^3)*log(1+-1*c*x^3)+(1/2)*b*d*e*3^(1/2)*c^-2//3*arctan(1//3*3^(1/2)+2//3*x*3^(1/2)*c^1//3)+-1//2*b*d*e*3^(1/2)*c^-2//3*arctan(1//3*3^(1/2)+-2//3*x*3^(1/2)*c^1//3))
@test integrate((a+b*arctanh(c*x^3))*(d+e*x), x) == :((1/2)*e^-1*(d+e*x)^2*(a+b*arctanh(c*x^3))+(1/2)*b*d*c^-1//3*log(1+-1*c^2//3*x^2)+-1//2*b*e*c^-2//3*arctanh(x*c^1//3)+-1//2*b*d^2*e^-1*arctanh(c*x^3)+-1//4*b*d*c^-1//3*log(1+c^2//3*x^2+c^4//3*x^4)+-1//8*b*e*c^-2//3*log(1+x*c^1//3+c^2//3*x^2)+1//8*b*e*c^-2//3*log(1+c^2//3*x^2+-1*x*c^1//3)+(1/2)*b*d*3^(1/2)*c^-1//3*arctan(1//3*3^(1/2)*(1+2*c^2//3*x^2))+-1//4*b*e*3^(1/2)*c^-2//3*arctan(1//3*3^(1/2)+-2//3*x*3^(1/2)*c^1//3)+1//4*b*e*3^(1/2)*c^-2//3*arctan(1//3*3^(1/2)+2//3*x*3^(1/2)*c^1//3))
@test integrate((d+e*x)^-1*(a+b*arctanh(c*x^3)), x) == :(e^-1*(a+b*arctanh(c*x^3))*log(d+e*x)+(1/2)*b*e^-1*Polylogarithms.polylog(2,c^1//3*(e+d*c^1//3)^-1*(d+e*x))+(1/2)*b*e^-1*Polylogarithms.polylog(2,c^1//3*(d*c^1//3+e*(-1)^2//3)^-1*(d+e*x))+(1/2)*b*e^-1*Polylogarithms.polylog(2,c^1//3*(d*c^1//3+-1*e*(-1)^1//3)^-1*(d+e*x))+-1//2*b*e^-1*Polylogarithms.polylog(2,c^1//3*(-1*e+d*c^1//3)^-1*(d+e*x))+-1//2*b*e^-1*Polylogarithms.polylog(2,c^1//3*(d*c^1//3+e*(-1)^1//3)^-1*(d+e*x))+-1//2*b*e^-1*Polylogarithms.polylog(2,c^1//3*(d*c^1//3+-1*e*(-1)^2//3)^-1*(d+e*x))+(1/2)*b*e^-1*log(e*(e+d*c^1//3)^-1*(1+-1*x*c^1//3))*log(d+e*x)+(1/2)*b*e^-1*log(-1*e*(d*c^1//3+-1*e*(-1)^1//3)^-1*((-1)^1//3+x*c^1//3))*log(d+e*x)+(1/2)*b*e^-1*log(e*(-1)^2//3*(d*c^1//3+e*(-1)^2//3)^-1*(1+x*(-1)^1//3*c^1//3))*log(d+e*x)+-1//2*b*e^-1*log(-1*e*(-1*e+d*c^1//3)^-1*(1+x*c^1//3))*log(d+e*x)+-1//2*b*e^-1*log(-1*e*(d*c^1//3+-1*e*(-1)^2//3)^-1*((-1)^2//3+x*c^1//3))*log(d+e*x)+-1//2*b*e^-1*log(e*(-1)^1//3*(d*c^1//3+e*(-1)^1//3)^-1*(1+x*(-1)^2//3*c^1//3))*log(d+e*x))
@test integrate((d+e*x)^-2*(a+b*arctanh(c*x^3)), x) == :(-1*e^-1*(d+e*x)^-1*(a+b*arctanh(c*x^3))+b*c^1//3*(-2*e^3+2*c*d^3)^-1*(e+d*c^1//3)*log(1+x*c^1//3)+b*c^1//3*(2*e^3+2*c*d^3)^-1*(-1*e+d*c^1//3)*log(1+-1*x*c^1//3)+-1*b*3^(1/2)*c^1//3*(2*e^2+2*c^2//3*d^2+2*d*e*c^1//3)^-1*arctan(1//3*3^(1/2)*(1+-2*x*c^1//3))+-1*b*c^1//3*(-4*e^3+4*c*d^3)^-1*(e+d*c^1//3)*log(1+c^2//3*x^2+-1*x*c^1//3)+-1*b*c^1//3*(4*e^3+4*c*d^3)^-1*(-1*e+d*c^1//3)*log(1+x*c^1//3+c^2//3*x^2)+(1/2)*b*c*d^2*e^-1*(-1*e^3+c*d^3)^-1*log(1+c*x^3)+-1*b*3^(1/2)*c^1//3*(2*e^3+2*c*d^3)^-1*(e+d*c^1//3)*arctan(1//3*3^(1/2)*(1+2*x*c^1//3))+-3*b*c*d^2*e^2*(-1*e^6+c^2*d^6)^-1*log(d+e*x)+-1//2*b*c*d^2*e^-1*(e^3+c*d^3)^-1*log(1+-1*c*x^3))
@test integrate(x^3*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b*c^-8*Polylogarithms.polylog(2,1+-2*(1+-1*c*x^(1/2))^-1)+c^-8*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+-1*c*x^(1/2))^-1)+-1*x*c^-6*(a+b*arctanh(c*x^(1/2)))+-1*b^-1*c^-8*(a+b*arctanh(c*x^(1/2)))^2+-11//6*b*c^-7*x^(1/2)+-5//18*b*c^-5*x^3//2+-1//2*c^-4*x^2*(a+b*arctanh(c*x^(1/2)))+-1//3*c^-2*x^3*(a+b*arctanh(c*x^(1/2)))+-1//15*b*c^-3*x^5//2+11//6*b*c^-8*arctanh(c*x^(1/2)))
@test integrate(x^2*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b*c^-6*Polylogarithms.polylog(2,1+-2*(1+-1*c*x^(1/2))^-1)+c^-6*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+-1*c*x^(1/2))^-1)+-1*x*c^-4*(a+b*arctanh(c*x^(1/2)))+-1*b^-1*c^-6*(a+b*arctanh(c*x^(1/2)))^2+-3//2*b*c^-5*x^(1/2)+-1//2*c^-2*x^2*(a+b*arctanh(c*x^(1/2)))+-1//6*b*c^-3*x^3//2+3//2*b*c^-6*arctanh(c*x^(1/2)))
@test integrate(x*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b*c^-4*Polylogarithms.polylog(2,1+-2*(1+-1*c*x^(1/2))^-1)+b*c^-4*arctanh(c*x^(1/2))+c^-4*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+-1*c*x^(1/2))^-1)+-1*b*c^-3*x^(1/2)+-1*x*c^-2*(a+b*arctanh(c*x^(1/2)))+-1*b^-1*c^-4*(a+b*arctanh(c*x^(1/2)))^2)
@test integrate((1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b*c^-2*Polylogarithms.polylog(2,1+-2*(1+-1*c*x^(1/2))^-1)+c^-2*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+-1*c*x^(1/2))^-1)+-1*b^-1*c^-2*(a+b*arctanh(c*x^(1/2)))^2)
@test integrate(x^-1*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b^-1*(a+b*arctanh(c*x^(1/2)))^2+(2a+2*b*arctanh(c*x^(1/2)))*log(2+-2*(1+c*x^(1/2))^-1)+-1*b*Polylogarithms.polylog(2,-1+2*(1+c*x^(1/2))^-1))
@test integrate(x^-2*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(-1*x^-1*(a+b*arctanh(c*x^(1/2)))+b*c^2*arctanh(c*x^(1/2))+b^-1*c^2*(a+b*arctanh(c*x^(1/2)))^2+-1*b*c*x^-1//2+-1*b*c^2*Polylogarithms.polylog(2,-1+2*(1+c*x^(1/2))^-1)+2*c^2*(a+b*arctanh(c*x^(1/2)))*log(2+-2*(1+c*x^(1/2))^-1))
@test integrate(x^-3*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(-1//2*x^-2*(a+b*arctanh(c*x^(1/2)))+b^-1*c^4*(a+b*arctanh(c*x^(1/2)))^2+-1*b*c^4*Polylogarithms.polylog(2,-1+2*(1+c*x^(1/2))^-1)+-1*c^2*x^-1*(a+b*arctanh(c*x^(1/2)))+2*c^4*(a+b*arctanh(c*x^(1/2)))*log(2+-2*(1+c*x^(1/2))^-1)+-3//2*b*c^3*x^-1//2+-1//6*b*c*x^-3//2+3//2*b*c^4*arctanh(c*x^(1/2)))
@test integrate(x^-4*(1+-1*x*c^2)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(-1//3*x^-3*(a+b*arctanh(c*x^(1/2)))+b^-1*c^6*(a+b*arctanh(c*x^(1/2)))^2+-1*b*c^6*Polylogarithms.polylog(2,-1+2*(1+c*x^(1/2))^-1)+-1*c^4*x^-1*(a+b*arctanh(c*x^(1/2)))+2*c^6*(a+b*arctanh(c*x^(1/2)))*log(2+-2*(1+c*x^(1/2))^-1)+-11//6*b*c^5*x^-1//2+-5//18*b*c^3*x^-3//2+-1//2*c^2*x^-2*(a+b*arctanh(c*x^(1/2)))+-1//15*b*c*x^-5//2+11//6*b*c^6*arctanh(c*x^(1/2)))
@test integrate(x^2*(d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :((1/2)*e^-1*x^2*(a+b*arctanh(c*x^(1/2)))+b*d^2*e^-3*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+d^2*e^-3*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+d^2*e^-3*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+(1/2)*b*c^-3*e^-1*x^(1/2)+-1*d*x*e^-2*(a+b*arctanh(c*x^(1/2)))+-2*d^2*e^-3*(a+b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1)+-1//2*b*c^-4*e^-1*arctanh(c*x^(1/2))+-1//2*b*d^2*e^-3*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1//2*b*d^2*e^-3*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+1//6*b*c^-1*e^-1*x^3//2+b*d*c^-2*e^-2*arctanh(c*x^(1/2))+-1*b*d*c^-1*e^-2*x^(1/2))
@test integrate(x*(d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(x*e^-1*(a+b*arctanh(c*x^(1/2)))+b*c^-1*e^-1*x^(1/2)+(1/2)*b*d*e^-2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+(1/2)*b*d*e^-2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+-1*b*d*e^-2*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+-1*b*c^-2*e^-1*arctanh(c*x^(1/2))+-1*d*e^-2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1*d*e^-2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+2*d*e^-2*(a+b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1))
@test integrate((d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(b*e^-1*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+e^-1*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+e^-1*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+-1*e^-1*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1)+-1//2*b*e^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1//2*b*e^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2))))
@test integrate(x^-1*(d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(a*d^-1*log(x)+b*d^-1*Polylogarithms.polylog(2,c*x^(1/2))+d^-1*(2a+2*b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1)+(1/2)*b*d^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+(1/2)*b*d^-1*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+-1*b*d^-1*Polylogarithms.polylog(2,-1*c*x^(1/2))+-1*b*d^-1*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+-1*d^-1*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1*d^-1*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2))))
@test integrate(x^-2*(d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(-1*d^-1*x^-1*(a+b*arctanh(c*x^(1/2)))+b*e*d^-2*Polylogarithms.polylog(2,-1*c*x^(1/2))+b*e*d^-2*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+b*c^2*d^-1*arctanh(c*x^(1/2))+e*d^-2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+e*d^-2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+-1*a*e*d^-2*log(x)+-1*b*c*d^-1*x^-1//2+-1*b*e*d^-2*Polylogarithms.polylog(2,c*x^(1/2))+-2*e*d^-2*(a+b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1)+-1//2*b*e*d^-2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1//2*b*e*d^-2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2))))
@test integrate(x^-3*(d+e*x)^-1*(a+b*arctanh(c*x^(1/2))), x) == :(-1//2*d^-1*x^-2*(a+b*arctanh(c*x^(1/2)))+a*d^-3*e^2*log(x)+b*d^-3*e^2*Polylogarithms.polylog(2,c*x^(1/2))+e*d^-2*x^-1*(a+b*arctanh(c*x^(1/2)))+(1/2)*b*c^4*d^-1*arctanh(c*x^(1/2))+(1/2)*b*d^-3*e^2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+(1/2)*b*d^-3*e^2*Polylogarithms.polylog(2,1+-2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+-1*b*d^-3*e^2*Polylogarithms.polylog(2,-1*c*x^(1/2))+-1*b*d^-3*e^2*Polylogarithms.polylog(2,1+-2*(1+c*x^(1/2))^-1)+-1*d^-3*e^2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+e^(1/2)*x^(1/2)))+-1*d^-3*e^2*(a+b*arctanh(c*x^(1/2)))*log(2*c*(1+c*x^(1/2))^-1*(-1*e^(1/2)+c*(-1d)^(1/2))^-1*((-1d)^(1/2)+-1*e^(1/2)*x^(1/2)))+2*d^-3*e^2*(a+b*arctanh(c*x^(1/2)))*log(2*(1+c*x^(1/2))^-1)+-1//2*b*c^3*d^-1*x^-1//2+-1//6*b*c*d^-1*x^-3//2+b*c*e*d^-2*x^-1//2+-1*b*e*c^2*d^-2*arctanh(c*x^(1/2)))