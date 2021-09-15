using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((e+f*x^2)^4*(a+b*x^2)*(c+d*x^2), x) == :(1//3*e^3*x^3*(a*d*e+b*c*e+4*a*c*f)+1//5*e^2*x^5*(b*e*(d*e+4*c*f)+2*a*f*(2*d*e+3*c*f))+1//9*f^2*x^9*(a*f*(c*f+4*d*e)+2*b*e*(2*c*f+3*d*e))+1//11*f^3*x^11*(a*d*f+b*c*f+4*b*d*e)+a*c*x*e^4+1//13*b*d*f^4*x^13+2//7*e*f*x^7*(a*f*(2*c*f+3*d*e)+b*e*(2*d*e+3*c*f)))
@test integrate((e+f*x^2)^3*(a+b*x^2)*(c+d*x^2), x) == :(1//3*e^2*x^3*(a*d*e+b*c*e+3*a*c*f)+1//5*e*x^5*(b*e*(d*e+3*c*f)+3*a*f*(c*f+d*e))+1//7*f*x^7*(a*f*(c*f+3*d*e)+3*b*e*(c*f+d*e))+1//9*f^2*x^9*(a*d*f+b*c*f+3*b*d*e)+a*c*x*e^3+1//11*b*d*f^3*x^11)
@test integrate((e+f*x^2)^2*(a+b*x^2)*(c+d*x^2), x) == :(x^5*(1//5*a*f*(c*f+2*d*e)+1//5*b*e*(d*e+2*c*f))+1//3*e*x^3*(a*d*e+b*c*e+2*a*c*f)+1//7*f*x^7*(a*d*f+b*c*f+2*b*d*e)+a*c*x*e^2+1//9*b*d*f^2*x^9)
@test integrate((a+b*x^2)*(c+d*x^2)*(e+f*x^2), x) == :(x^3*(1//3*a*c*f+1//3*a*d*e+1//3*b*c*e)+x^5*(1//5*a*d*f+1//5*b*c*f+1//5*b*d*e)+a*c*e*x+1//7*b*d*f*x^7)
@test integrate((e+f*x^2)^-1*(a+b*x^2)*(c+d*x^2), x) == :(-1//3*x*f^-2*(-3*b*c*f+-2*a*d*f+3*b*d*e)+1//3*d*x*f^-1*(a+b*x^2)+e^-1//2*f^-5//2*(b*e+-1*a*f)*(d*e+-1*c*f)*arctan(x*e^-1//2*f^(1/2)))
@test integrate((e+f*x^2)^-2*(a+b*x^2)*(c+d*x^2), x) == :(-1//2*e^-3//2*f^-5//2*(b*e*(-1*c*f+3*d*e)+-1*a*f*(c*f+d*e))*arctan(x*e^-1//2*f^(1/2))+(1/2)*b*x*e^-1*f^-2*(-1*c*f+3*d*e)+-1//2*x*e^-1*f^-1*(e+f*x^2)^-1*(a+b*x^2)*(d*e+-1*c*f))
@test integrate((e+f*x^2)^-3*(a+b*x^2)*(c+d*x^2), x) == :(1//8*e^-5//2*f^-5//2*(a*f*(d*e+3*c*f)+b*e*(c*f+3*d*e))*arctan(x*e^-1//2*f^(1/2))+-1//8*x*e^-2*f^-2*(e+f*x^2)^-1*(b*e*(c*f+3*d*e)+-1*a*f*(d*e+3*c*f))+-1//4*x*e^-1*f^-1*(e+f*x^2)^-2*(a+b*x^2)*(d*e+-1*c*f))
@test integrate((e+f*x^2)^-4*(a+b*x^2)*(c+d*x^2), x) == :(1//16*e^-7//2*f^-5//2*(a*f*(d*e+5*c*f)+b*e*(c*f+d*e))*arctan(x*e^-1//2*f^(1/2))+-1//24*x*e^-2*f^-2*(e+f*x^2)^-2*(-1*a*f*(d*e+5*c*f)+3*b*e*(c*f+d*e))+1//16*x*e^-3*f^-2*(e+f*x^2)^-1*(a*f*(d*e+5*c*f)+b*e*(c*f+d*e))+-1//6*x*e^-1*f^-1*(e+f*x^2)^-3*(a+b*x^2)*(d*e+-1*c*f))
@test integrate((c+d*x^2)^2*(e+f*x^2)^3*(a+b*x^2), x) == :(x^7*(1//7*a*f*(c^2*f^2+3*d^2*e^2+6*c*d*e*f)+1//7*b*e*(d^2*e^2+3*c^2*f^2+6*c*d*e*f))+1//5*e*x^5*(a*(d^2*e^2+3*c^2*f^2+6*c*d*e*f)+b*c*e*(2*d*e+3*c*f))+1//9*f*x^9*(b*(c^2*f^2+3*d^2*e^2+6*c*d*e*f)+a*d*f*(2*c*f+3*d*e))+a*x*c^2*e^3+1//3*c*e^2*x^3*(b*c*e+2*a*d*e+3*a*c*f)+1//11*d*f^2*x^11*(a*d*f+2*b*c*f+3*b*d*e)+1//13*b*d^2*f^3*x^13)
@test integrate((c+d*x^2)^2*(e+f*x^2)^2*(a+b*x^2), x) == :(x^5*(1//5*a*(c^2*f^2+d^2*e^2+4*c*d*e*f)+2//5*b*c*e*(c*f+d*e))+x^7*(1//7*b*(c^2*f^2+d^2*e^2+4*c*d*e*f)+2//7*a*d*f*(c*f+d*e))+a*x*c^2*e^2+1//3*c*e*x^3*(2*a*(c*f+d*e)+b*c*e)+1//9*d*f*x^9*(2*b*(c*f+d*e)+a*d*f)+1//11*b*d^2*f^2*x^11)
@test integrate((c+d*x^2)^2*(a+b*x^2)*(e+f*x^2), x) == :(x^5*(1//5*a*d*(d*e+2*c*f)+1//5*b*c*(c*f+2*d*e))+1//3*c*x^3*(a*c*f+b*c*e+2*a*d*e)+1//7*d*x^7*(a*d*f+b*d*e+2*b*c*f)+a*e*x*c^2+1//9*b*f*d^2*x^9)
@test integrate((c+d*x^2)^2*(e+f*x^2)^-1*(a+b*x^2), x) == :(-1//15*x*f^-3*(-1*b*(8*c^2*f^2+15*d^2*e^2+-25*c*d*e*f)+5*a*d*f*(-5*c*f+3*d*e))+-1//15*x*f^-2*(c+d*x^2)*(-5*a*d*f+-4*b*c*f+5*b*d*e)+1//5*b*x*f^-1*(c+d*x^2)^2+-1*e^-1//2*f^-7//2*(d*e+-1*c*f)^2*(b*e+-1*a*f)*arctan(x*e^-1//2*f^(1/2)))
@test integrate((c+d*x^2)^2*(e+f*x^2)^-2*(a+b*x^2), x) == :((1/2)*e^-3//2*f^-7//2*(d*e+-1*c*f)*(b*e*(-1*c*f+5*d*e)+-1*a*f*(c*f+3*d*e))*arctan(x*e^-1//2*f^(1/2))+-1//6*d*x*e^-1*f^-3*(b*e*(-13*c*f+15*d*e)+-3*a*f*(-1*c*f+3*d*e))+-1//2*x*e^-1*f^-1*(c+d*x^2)^2*(e+f*x^2)^-1*(b*e+-1*a*f)+1//6*d*x*e^-1*f^-2*(c+d*x^2)*(-3*a*f+5*b*e))
@test integrate((c+d*x^2)^2*(e+f*x^2)^-3*(a+b*x^2), x) == :(-1//8*e^-5//2*f^-7//2*(b*e*(-1*c^2*f^2+15*d^2*e^2+-6*c*d*e*f)+-1*a*f*(3*c^2*f^2+3*d^2*e^2+2*c*d*e*f))*arctan(x*e^-1//2*f^(1/2))+1//8*d*x*e^-2*f^-3*(b*e*(-1*c*f+15*d*e)+-3*a*f*(c*f+d*e))+-1//4*x*e^-1*f^-1*(c+d*x^2)^2*(e+f*x^2)^-2*(b*e+-1*a*f)+-1//8*x*e^-2*f^-2*(e+f*x^2)^-1*(c+d*x^2)*(b*e*(-1*c*f+5*d*e)+-1*a*f*(d*e+3*c*f)))
@test integrate((c+d*x^2)^2*(e+f*x^2)^-4*(a+b*x^2), x) == :(1//16*e^-7//2*f^-7//2*(a*f*(d^2*e^2+5*c^2*f^2+2*c*d*e*f)+b*e*(c^2*f^2+5*d^2*e^2+2*c*d*e*f))*arctan(x*e^-1//2*f^(1/2))+-1//48*x*e^-3*f^-3*(e+f*x^2)^-1*(a*f*(-15*c^2*f^2+3*d^2*e^2+4*c*d*e*f)+b*e*(-3*c^2*f^2+15*d^2*e^2+-4*c*d*e*f))+-1//6*x*e^-1*f^-1*(c+d*x^2)^2*(e+f*x^2)^-3*(b*e+-1*a*f)+-1//24*x*e^-2*f^-2*(e+f*x^2)^-2*(c+d*x^2)*(d*e*(a*f+5*b*e)+-1*c*f*(b*e+5*a*f)))
@test integrate((c+d*x^2)^3*(e+f*x^2)^3*(a+b*x^2), x) == :(x^7*(1//7*a*(c^3*f^3+d^3*e^3+9*c*f*d^2*e^2+9*d*e*c^2*f^2)+3//7*b*c*e*(c^2*f^2+d^2*e^2+3*c*d*e*f))+x^9*(1//9*b*(c^3*f^3+d^3*e^3+9*c*f*d^2*e^2+9*d*e*c^2*f^2)+1//3*a*d*f*(c^2*f^2+d^2*e^2+3*c*d*e*f))+a*x*c^3*e^3+1//3*c^2*e^2*x^3*(3*a*(c*f+d*e)+b*c*e)+1//13*d^2*f^2*x^13*(3*b*(c*f+d*e)+a*d*f)+1//15*b*d^3*f^3*x^15+3//5*c*e*x^5*(a*(c^2*f^2+d^2*e^2+3*c*d*e*f)+b*c*e*(c*f+d*e))+3//11*d*f*x^11*(b*(c^2*f^2+d^2*e^2+3*c*d*e*f)+a*d*f*(c*f+d*e)))
@test integrate((c+d*x^2)^3*(e+f*x^2)^2*(a+b*x^2), x) == :(x^7*(1//7*a*d*(d^2*e^2+3*c^2*f^2+6*c*d*e*f)+1//7*b*c*(c^2*f^2+3*d^2*e^2+6*c*d*e*f))+1//5*c*x^5*(a*(c^2*f^2+3*d^2*e^2+6*c*d*e*f)+b*c*e*(2*c*f+3*d*e))+1//9*d*x^9*(b*(d^2*e^2+3*c^2*f^2+6*c*d*e*f)+a*d*f*(2*d*e+3*c*f))+a*x*c^3*e^2+1//3*e*c^2*x^3*(b*c*e+2*a*c*f+3*a*d*e)+1//11*f*d^2*x^11*(a*d*f+2*b*d*e+3*b*c*f)+1//13*b*d^3*f^2*x^13)
@test integrate((c+d*x^2)^3*(a+b*x^2)*(e+f*x^2), x) == :(1//3*c^2*x^3*(a*c*f+b*c*e+3*a*d*e)+1//5*c*x^5*(b*c*(c*f+3*d*e)+3*a*d*(c*f+d*e))+1//7*d*x^7*(a*d*(d*e+3*c*f)+3*b*c*(c*f+d*e))+1//9*d^2*x^9*(a*d*f+b*d*e+3*b*c*f)+a*e*x*c^3+1//11*b*f*d^3*x^11)
@test integrate((c+d*x^2)^3*(e+f*x^2)^-1*(a+b*x^2), x) == :(1//105*x*f^-4*(-1*b*(-48*c^3*f^3+105*d^3*e^3+-280*c*f*d^2*e^2+231*d*e*c^2*f^2)+7*a*d*f*(15*d^2*e^2+33*c^2*f^2+-40*c*d*e*f))+-1//35*x*f^-2*(c+d*x^2)^2*(-7*a*d*f+-6*b*c*f+7*b*d*e)+-1//105*x*f^-3*(c+d*x^2)*(-1*b*(24*c^2*f^2+35*d^2*e^2+-63*c*d*e*f)+7*a*d*f*(-9*c*f+5*d*e))+1//7*b*x*f^-1*(c+d*x^2)^3+e^-1//2*f^-9//2*(d*e+-1*c*f)^3*(b*e+-1*a*f)*arctan(x*e^-1//2*f^(1/2)))
@test integrate((c+d*x^2)^3*(e+f*x^2)^-2*(a+b*x^2), x) == :(-1//2*e^-3//2*f^-9//2*(d*e+-1*c*f)^2*(b*e*(-1*c*f+7*d*e)+-1*a*f*(c*f+5*d*e))*arctan(x*e^-1//2*f^(1/2))+-1//30*d*x*e^-1*f^-4*(-1*b*e*(81*c^2*f^2+105*d^2*e^2+-190*c*d*e*f)+5*a*f*(3*c^2*f^2+15*d^2*e^2+-22*c*d*e*f))+-1//2*x*e^-1*f^-1*(c+d*x^2)^3*(e+f*x^2)^-1*(b*e+-1*a*f)+-1//30*d*x*e^-1*f^-3*(c+d*x^2)*(b*e*(-33*c*f+35*d*e)+-5*a*f*(-3*c*f+5*d*e))+1//10*d*x*e^-1*f^-2*(c+d*x^2)^2*(-5*a*f+7*b*e))
@test integrate((c+d*x^2)^3*(e+f*x^2)^-3*(a+b*x^2), x) == :(1//8*e^-5//2*f^-9//2*(d*e+-1*c*f)*(b*e*(-1*c^2*f^2+35*d^2*e^2+-10*c*d*e*f)+-3*a*f*(c^2*f^2+5*d^2*e^2+2*c*d*e*f))*arctan(x*e^-1//2*f^(1/2))+1//24*d*x*e^-2*f^-4*(-1*b*e*(3*c^2*f^2+105*d^2*e^2+-100*c*d*e*f)+3*a*f*(-3*c^2*f^2+15*d^2*e^2+-4*c*d*e*f))+-1//4*x*e^-1*f^-1*(c+d*x^2)^3*(e+f*x^2)^-2*(b*e+-1*a*f)+-1//8*x*e^-2*f^-2*(c+d*x^2)^2*(e+f*x^2)^-1*(b*e*(-1*c*f+7*d*e)+-3*a*f*(c*f+d*e))+1//24*d*x*e^-2*f^-3*(c+d*x^2)*(b*e*(-3*c*f+35*d*e)+-3*a*f*(3*c*f+5*d*e)))
@test integrate((c+d*x^2)^3*(e+f*x^2)^-4*(a+b*x^2), x) == :(-1//16*e^-7//2*f^-9//2*(b*e*(-1*c^3*f^3+35*d^3*e^3+-15*c*f*d^2*e^2+-3*d*e*c^2*f^2)+-1*a*f*(5*c^3*f^3+5*d^3*e^3+3*c*f*d^2*e^2+3*d*e*c^2*f^2))*arctan(x*e^-1//2*f^(1/2))+1//48*d*x*e^-3*f^-4*(b*e*(-3*c^2*f^2+105*d^2*e^2+-10*c*d*e*f)+-1*a*f*(15*c^2*f^2+15*d^2*e^2+14*c*d*e*f))+-1//6*x*e^-1*f^-1*(c+d*x^2)^3*(e+f*x^2)^-3*(b*e+-1*a*f)+-1//24*x*e^-2*f^-2*(c+d*x^2)^2*(e+f*x^2)^-2*(b*e*(-1*c*f+7*d*e)+-1*a*f*(d*e+5*c*f))+-1//48*x*e^-3*f^-3*(e+f*x^2)^-1*(c+d*x^2)*(b*e*(-3*c^2*f^2+35*d^2*e^2+-8*c*d*e*f)+-1*a*f*(5*d^2*e^2+15*c^2*f^2+4*c*d*e*f)))
@test integrate((c+d*x^2)^3//2*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(1//7*b*x*d^-1*(c+d*x^2)^5//2*(e+f*x^2)^(1/2)+-1//105*x*d^-2*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-6*c^3*f^3+8*d^3*e^3+-19*c*f*d^2*e^2+9*d*e*c^2*f^2)+7*a*d*f*(-3*c^2*f^2+2*d^2*e^2+-7*c*d*e*f))+1//35*x*d^-1*f^-1*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)*(b*d*e+-2*b*c*f+7*a*d*f)+1//105*x*d^-1*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-1*b*(4*d^2*e^2+6*c^2*f^2+-6*c*d*e*f)+7*a*d*f*(d*e+3*c*f))+-1//105*d^-1*e^3//2*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-3*c^2*f^2+4*d^2*e^2+-9*c*d*e*f)+7*a*d*f*(d*e+-9*c*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//105*d^-2*e^(1/2)*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-6*c^3*f^3+8*d^3*e^3+-19*c*f*d^2*e^2+9*d*e*c^2*f^2)+7*a*d*f*(-3*c^2*f^2+2*d^2*e^2+-7*c*d*e*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(1//5*b*x*d^-1*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)+1//15*x*d^-1*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(b*d*e+-2*b*c*f+5*a*d*f)+1//15*x*d^-2*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-2*b*(c^2*f^2+d^2*e^2+-1*c*d*e*f)+5*a*d*f*(c*f+d*e))+-1//15*d^-1*e^3//2*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c*f+b*d*e+-10*a*d*f)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1//15*d^-2*e^(1/2)*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-2*b*(c^2*f^2+d^2*e^2+-1*c*d*e*f)+5*a*d*f*(c*f+d*e))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(1//3*b*x*d^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)+1//3*x*d^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*d*e+-2*b*c*f+3*a*d*f)+-1//3*d^-2*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*d*e+-2*b*c*f+3*a*d*f)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1//3*c^-1*d^-1*e^3//2*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c+-3*a*d)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(-1*x*c^-1*d^-1*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(b*c+-1*a*d)+f*x*c^-1*d^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*a*d+2*b*c)+b*c^-1*d^-1*e^3//2*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1*c^-1*d^-2*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*a*d+2*b*c)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-5//2*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(-1//3*x*c^-1*d^-1*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(b*c+-1*a*d)+1//3*c^-3//2*d^-3//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(d*e*(b*c+2*a*d)+-1*c*f*(a*d+2*b*c))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+1//3*c^-2*d^-1*e^3//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*c+-1*a*d)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-7//2*(e+f*x^2)^(1/2)*(a+b*x^2), x) == :(-1//5*x*c^-1*d^-1*(c+d*x^2)^-5//2*(e+f*x^2)^(1/2)*(b*c+-1*a*d)+1//15*x*c^-2*d^-1*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(a*d*(-3*c*f+4*d*e)+b*c*(d*e+-2*c*f))+1//15*c^-5//2*d^-3//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-2*(a*d*(3*c^2*f^2+8*d^2*e^2+-13*c*d*e*f)+2*b*c*(c^2*f^2+d^2*e^2+-1*c*d*e*f))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+-1//15*c^-3*d^-1*e^3//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(b*c*(c*f+d*e)+2*a*d*(-3*c*f+2*d*e))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^(1/2)*(e+f*x^2)^3//2*(a+b*x^2), x) == :(1//7*b*x*d^-1*(c+d*x^2)^3//2*(e+f*x^2)^3//2+1//35*x*d^-2*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)*(-4*b*c*f+3*b*d*e+7*a*d*f)+1//105*x*d^-3*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-8*c^3*f^3+6*d^3*e^3+-9*c*f*d^2*e^2+19*d*e*c^2*f^2)+7*a*d*f*(-2*c^2*f^2+3*d^2*e^2+7*c*d*e*f))+1//105*x*d^-2*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(b*(3*d^2*e^2+8*c^2*f^2+-15*c*d*e*f)+14*a*d*f*(-1*c*f+3*d*e))+-1//105*d^-3*e^(1/2)*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-8*c^3*f^3+6*d^3*e^3+-9*c*f*d^2*e^2+19*d*e*c^2*f^2)+7*a*d*f*(-2*c^2*f^2+3*d^2*e^2+7*c*d*e*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//105*d^-2*e^3//2*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-4*c^2*f^2+3*d^2*e^2+9*c*d*e*f)+7*a*d*f*(-1*c*f+9*d*e))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-1//2*(e+f*x^2)^3//2*(a+b*x^2), x) == :(1//5*b*x*d^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^3//2+1//15*x*d^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*(3*d^2*e^2+8*c^2*f^2+-13*c*d*e*f)+10*a*d*f*(-1*c*f+2*d*e))+1//15*x*d^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-4*b*c*f+3*b*d*e+5*a*d*f)+-1//15*d^-3*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*(3*d^2*e^2+8*c^2*f^2+-13*c*d*e*f)+10*a*d*f*(-1*c*f+2*d*e))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//15*c^-1*d^-2*e^3//2*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-4*f*c^2+6*c*d*e)+5*a*d*(-1*c*f+3*d*e))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-3//2*(e+f*x^2)^3//2*(a+b*x^2), x) == :(-1*x*c^-1*d^-1*(c+d*x^2)^-1//2*(e+f*x^2)^3//2*(b*c+-1*a*d)+1//3*f*x*c^-1*d^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c*(-8*c*f+7*d*e)+-3*a*d*(d*e+-2*c*f))+1//3*f*x*c^-1*d^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-3*a*d+4*b*c)+-1//3*c^-1*d^-3*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c*(-8*c*f+7*d*e)+-3*a*d*(d*e+-2*c*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//3*c^-1*d^-2*e^3//2*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-4*b*c*f+3*a*d*f+3*b*d*e)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-5//2*(e+f*x^2)^3//2*(a+b*x^2), x) == :(-1//3*x*c^-1*d^-1*(c+d*x^2)^-3//2*(e+f*x^2)^3//2*(b*c+-1*a*d)+1//3*x*c^-2*d^-2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(a*d*(c*f+2*d*e)+b*c*(d*e+-4*c*f))+-1//3*f*x*c^-2*d^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c*(d*e+-8*c*f)+2*a*d*(c*f+d*e))+1//3*c^-2*d^-3*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*c*(d*e+-8*c*f)+2*a*d*(c*f+d*e))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//3*c^-2*d^-2*e^3//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*a*d+4*b*c)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-7//2*(e+f*x^2)^3//2*(a+b*x^2), x) == :(-1//5*x*c^-1*d^-1*(c+d*x^2)^-5//2*(e+f*x^2)^3//2*(b*c+-1*a*d)+1//15*x*c^-2*d^-2*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(d*e*(b*c+4*a*d)+-1*c*f*(a*d+4*b*c))+1//15*c^-5//2*d^-5//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(a*d*(-2*c^2*f^2+8*d^2*e^2+-3*c*d*e*f)+b*c*(-8*c^2*f^2+2*d^2*e^2+3*c*d*e*f))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+-1//15*c^-3*d^-2*e^3//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(a*d*(-1*c*f+4*d*e)+b*c*(d*e+-4*c*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-9//2*(e+f*x^2)^3//2*(a+b*x^2), x) == :(-1//7*x*c^-1*d^-1*(c+d*x^2)^-7//2*(e+f*x^2)^3//2*(b*c+-1*a*d)+1//35*x*c^-2*d^-2*(c+d*x^2)^-5//2*(e+f*x^2)^(1/2)*(d*e*(b*c+6*a*d)+-1*c*f*(3*a*d+4*b*c))+1//105*x*c^-3*d^-2*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(b*c*(-8*c^2*f^2+4*d^2*e^2+c*d*e*f)+3*a*d*(-2*c^2*f^2+8*d^2*e^2+-5*c*d*e*f))+1//105*c^-7//2*d^-5//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-2*(b*c*(8*c^3*f^3+8*d^3*e^3+-5*c*f*d^2*e^2+-5*d*e*c^2*f^2)+6*a*d*(c^3*f^3+8*d^3*e^3+-12*c*f*d^2*e^2+2*d*e*c^2*f^2))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+-1//105*c^-4*d^-2*e^3//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(2*b*c*(2*c^2*f^2+2*d^2*e^2+-1*c*d*e*f)+3*a*d*(c^2*f^2+8*d^2*e^2+-11*c*d*e*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^5//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(-1//35*x*f^-2*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)*(-7*a*d*f+-5*b*c*f+6*b*d*e)+-1//105*x*f^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-1*b*(15*c^2*f^2+24*d^2*e^2+-43*c*d*e*f)+28*a*d*f*(d*e+-2*c*f))+1//7*b*x*f^-1*(c+d*x^2)^5//2*(e+f*x^2)^(1/2)+1//105*x*d^-1*f^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-15*c^3*f^3+48*d^3*e^3+-128*c*f*d^2*e^2+103*d*e*c^2*f^2)+7*a*d*f*(8*d^2*e^2+23*c^2*f^2+-23*c*d*e*f))+1//105*e^(1/2)*f^-7//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*e*(24*d^2*e^2+45*c^2*f^2+-61*c*d*e*f)+7*a*f*(4*d^2*e^2+15*c^2*f^2+-11*c*d*e*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1//105*d^-1*e^(1/2)*f^-7//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(-15*c^3*f^3+48*d^3*e^3+-128*c*f*d^2*e^2+103*d*e*c^2*f^2)+7*a*d*f*(8*d^2*e^2+23*c^2*f^2+-23*c*d*e*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^3//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(-1//15*x*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-5*a*d*f+-3*b*c*f+4*b*d*e)+1//5*b*x*f^-1*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)+-1//15*x*d^-1*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(3*c^2*f^2+8*d^2*e^2+-13*c*d*e*f)+10*a*d*f*(d*e+-2*c*f))+-1//15*e^(1/2)*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(4*d*e^2+-6*c*e*f)+5*a*f*(d*e+-3*c*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//15*d^-1*e^(1/2)*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(3*c^2*f^2+8*d^2*e^2+-13*c*d*e*f)+10*a*d*f*(d*e+-2*c*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(1//3*b*x*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)+-1//3*x*d^-1*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*c*f+-3*a*d*f+2*b*d*e)+-1//3*e^(1/2)*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e+-3*a*f)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//3*d^-1*e^(1/2)*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*c*f+-3*a*d*f+2*b*d*e)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-1//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(b*x*d^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2+a*c^-1*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1*b*d^-1*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-3//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(-1*c^-1//2*d^-1//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(b*c+-1*a*d)*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+c^-1*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*e+-1*a*f)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-5//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(-1//3*x*c^-1*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(b*c+-1*a*d)+1//3*c^-3//2*d^-1//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-2*(b*c*(c*f+d*e)+2*a*d*(d*e+-2*c*f))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+-1//3*c^-2*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(a*d*e+-3*a*c*f+2*b*c*e)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-7//2*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(-1//5*x*c^-1*(c+d*x^2)^-5//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-1*(b*c+-1*a*d)+1//15*x*c^-2*(c+d*x^2)^-3//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-2*(b*c*(d*e+3*c*f)+4*a*d*(d*e+-2*c*f))+1//15*c^-5//2*d^-1//2*(c*e^-1*(c+d*x^2)^-1*(e+f*x^2))^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^(1/2)*(d*e+-1*c*f)^-3*(a*d*(8*d^2*e^2+23*c^2*f^2+-23*c*d*e*f)+b*c*(-3*c^2*f^2+2*d^2*e^2+-7*c*d*e*f))*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*c*f*d^-1*e^-1)+-1//15*c^-3*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-3*(a*(4*d^2*e^2+15*c^2*f^2+-11*c*d*e*f)+b*c*e*(d*e+-9*c*f))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^5//2*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(-1*x*e^-1*f^-1*(c+d*x^2)^5//2*(e+f*x^2)^-1//2*(b*e+-1*a*f)+-1//15*x*e^-1*f^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-2*b*e*(19*c^2*f^2+24*d^2*e^2+-44*c*d*e*f)+5*a*f*(3*c^2*f^2+8*d^2*e^2+-13*c*d*e*f))+-1//15*d*x*e^-1*f^-3*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(b*e*(-23*c*f+24*d*e)+-5*a*f*(-3*c*f+4*d*e))+-1//15*e^(1/2)*f^-7//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*b*(15*c^2*f^2+24*d^2*e^2+-41*c*d*e*f)+10*a*d*f*(-3*c*f+2*d*e))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//5*d*x*e^-1*f^-2*(c+d*x^2)^3//2*(e+f*x^2)^(1/2)*(-5*a*f+6*b*e)+1//15*e^-1//2*f^-7//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-2*b*e*(19*c^2*f^2+24*d^2*e^2+-44*c*d*e*f)+5*a*f*(3*c^2*f^2+8*d^2*e^2+-13*c*d*e*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^3//2*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(-1*x*e^-1*f^-1*(c+d*x^2)^3//2*(e+f*x^2)^-1//2*(b*e+-1*a*f)+-1//3*x*e^-1*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e*(-7*c*f+8*d*e)+-3*a*f*(-1*c*f+2*d*e))+-1//3*e^(1/2)*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-3*a*d*f+-3*b*c*f+4*b*d*e)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//3*d*x*e^-1*f^-2*(c+d*x^2)^(1/2)*(e+f*x^2)^(1/2)*(-3*a*f+4*b*e)+1//3*e^-1//2*f^-5//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e*(-7*c*f+8*d*e)+-3*a*f*(-1*c*f+2*d*e))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^(1/2)*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(x*e^-1*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*a*f+2*b*e)+-1*x*e^-1*f^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e+-1*a*f)+b*e^(1/2)*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1*e^-1//2*f^-3//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(-1*a*f+2*b*e)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-1//2*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(e^-1//2*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*e+-1*a*f)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1*c^-1*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*c+-1*a*d)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-3//2*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(-1*x*c^-1*(c+d*x^2)^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*c+-1*a*d)+c^-1*e^(1/2)*f^-1//2*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(b*c*f+b*d*e+-2*a*d*f)*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+-1*c^-1*e^-1//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(-1*a*c*f+-1*a*d*e+2*b*c*e)*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((c+d*x^2)^-5//2*(e+f*x^2)^-3//2*(a+b*x^2), x) == :(-1//3*x*c^-1*(c+d*x^2)^-3//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-1*(b*c+-1*a*d)+1//3*x*c^-2*(c+d*x^2)^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-2*(b*c*(d*e+3*c*f)+2*a*d*(d*e+-3*c*f))+-1//3*c^-2*e^(1/2)*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-3*(a*d*(d*e+-9*c*f)+b*c*(3*c*f+5*d*e))*Elliptic.F(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1)+1//3*c^-2*e^-1//2*f^(1/2)*(e*c^-1*(e+f*x^2)^-1*(c+d*x^2))^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(d*e+-1*c*f)^-3*(a*(-3*c^2*f^2+2*d^2*e^2+-7*c*d*e*f)+b*c*e*(d*e+7*c*f))*Elliptic.E(arctan(x*e^-1//2*f^(1/2)),1+-1*d*e*c^-1*f^-1))
@test integrate((a+b*x^2)^-1//2*(c+d*x^2)^-3//2*(e+f*x^2), x) == :(-1*c^-1//2*d^-1//2*(c*a^-1*(c+d*x^2)^-1*(a+b*x^2))^-1//2*(a+b*x^2)^(1/2)*(c+d*x^2)^-1//2*(b*c+-1*a*d)^-1*(d*e+-1*c*f)*Elliptic.E(arctan(x*c^-1//2*d^(1/2)),1+-1*b*c*a^-1*d^-1)+a^-1*c^(1/2)*d^-1//2*(c*a^-1*(c+d*x^2)^-1*(a+b*x^2))^-1//2*(a+b*x^2)^(1/2)*(c+d*x^2)^-1//2*(b*c+-1*a*d)^-1*(b*e+-1*a*f)*Elliptic.F(arctan(x*c^-1//2*d^(1/2)),1+-1*b*c*a^-1*d^-1))
@test integrate((a+-1*b*x^2)^-1//2*(c+d*x^2)^-3//2*(e+f*x^2), x) == :(x*c^-1*(a+-1*b*x^2)^(1/2)*(c+d*x^2)^-1//2*(a*d+b*c)^-1*(d*e+-1*c*f)+f*a^(1/2)*b^-1//2*d^-1*(1+d*c^-1*x^2)^(1/2)*(1+-1*b*a^-1*x^2)^(1/2)*(a+-1*b*x^2)^-1//2*(c+d*x^2)^-1//2*Elliptic.F(arcsin(x*a^-1//2*b^(1/2)),-1*a*d*b^-1*c^-1)+a^(1/2)*b^(1/2)*c^-1*d^-1*(1+d*c^-1*x^2)^-1//2*(1+-1*b*a^-1*x^2)^(1/2)*(a+-1*b*x^2)^-1//2*(c+d*x^2)^(1/2)*(a*d+b*c)^-1*(d*e+-1*c*f)*Elliptic.E(arcsin(x*a^-1//2*b^(1/2)),-1*a*d*b^-1*c^-1))
@test integrate((a+b*x^2)^-1//2*(c+-1*d*x^2)^-3//2*(e+f*x^2), x) == :(x*c^-1*(a+b*x^2)^(1/2)*(c+-1*d*x^2)^-1//2*(a*d+b*c)^-1*(c*f+d*e)+e*c^-1//2*d^-1//2*(1+b*a^-1*x^2)^(1/2)*(1+-1*d*c^-1*x^2)^(1/2)*(a+b*x^2)^-1//2*(c+-1*d*x^2)^-1//2*Elliptic.F(arcsin(x*c^-1//2*d^(1/2)),-1*b*c*a^-1*d^-1)+-1*c^-1//2*d^-1//2*(1+b*a^-1*x^2)^-1//2*(1+-1*d*c^-1*x^2)^(1/2)*(a+b*x^2)^(1/2)*(c+-1*d*x^2)^-1//2*(a*d+b*c)^-1*(c*f+d*e)*Elliptic.E(arcsin(x*c^-1//2*d^(1/2)),-1*b*c*a^-1*d^-1))
@test integrate((a+-1*b*x^2)^-1//2*(c+-1*d*x^2)^-3//2*(e+f*x^2), x) == :(-1*x*c^-1*(a+-1*b*x^2)^(1/2)*(c+-1*d*x^2)^-1//2*(b*c+-1*a*d)^-1*(c*f+d*e)+e*c^-1//2*d^-1//2*(1+-1*b*a^-1*x^2)^(1/2)*(1+-1*d*c^-1*x^2)^(1/2)*(a+-1*b*x^2)^-1//2*(c+-1*d*x^2)^-1//2*Elliptic.F(arcsin(x*c^-1//2*d^(1/2)),b*c*a^-1*d^-1)+c^-1//2*d^-1//2*(1+-1*b*a^-1*x^2)^-1//2*(1+-1*d*c^-1*x^2)^(1/2)*(a+-1*b*x^2)^(1/2)*(c+-1*d*x^2)^-1//2*(b*c+-1*a*d)^-1*(c*f+d*e)*Elliptic.E(arcsin(x*c^-1//2*d^(1/2)),b*c*a^-1*d^-1))
@test integrate((2+d*x^2)^-1//2*(3+f*x^2)^-1//2*(a+b*x^2), x) == :(b*x*d^-1*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2+(1/2)*a*2^(1/2)*f^-1//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*Elliptic.F(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1)+-1*b*2^(1/2)*d^-1*f^-1//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*Elliptic.E(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1))
@test integrate((2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(a+b*x^2), x) == :(1//3*b*x*f^-1*(2+d*x^2)^(1/2)*(3+f*x^2)^(1/2)+-1//3*x*d^-1*f^-1*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(-2*b*f+6*b*d+-3*a*d*f)+-1*2^(1/2)*f^-3//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(b+-1*a*f)*Elliptic.F(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1)+1//3*2^(1/2)*d^-1*f^-3//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(-2*b*f+6*b*d+-3*a*d*f)*Elliptic.E(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1))
@test integrate((2+d*x^2)^(1/2)*(3+f*x^2)^(1/2)*(a+b*x^2), x) == :(1//5*b*x*d^-1*(2+d*x^2)^3//2*(3+f*x^2)^(1/2)+1//15*x*d^-1*f^-1*(2+d*x^2)^(1/2)*(3+f*x^2)^(1/2)*(-4*b*f+3*b*d+5*a*d*f)+1//15*x*d^-2*f^-1*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(-2*b*(4*f^2+9*d^2+-6*d*f)+5*a*d*f*(2*f+3d))+-1//5*2^(1/2)*d^-1*f^-3//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(2*b*f+3*b*d+-10*a*d*f)*Elliptic.F(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1)+-1//15*2^(1/2)*d^-2*f^-3//2*((3+f*x^2)^-1*(2+d*x^2))^-1//2*(2+d*x^2)^(1/2)*(3+f*x^2)^-1//2*(-2*b*(4*f^2+9*d^2+-6*d*f)+5*a*d*f*(2*f+3d))*Elliptic.E(arctan(1//3*x*3^(1/2)*f^(1/2)),1+-3//2*d*f^-1))
@test integrate((1+2*c*x^2*((b^2+-4*a*c)^(1/2)+-1b)^-1)^-1//2*(1+2*c*x^2*(-1b+-1*(b^2+-4*a*c)^(1/2))^-1)^-1//2*(-1b+-1*(b^2+-4*a*c)^(1/2)+2*c*x^2), x) == :(-1//2*2^(1/2)*c^-1//2*(b+-1*(b^2+-4*a*c)^(1/2))^(1/2)*(b+(b^2+-4*a*c)^(1/2))*Elliptic.E(arcsin(x*2^(1/2)*c^(1/2)*(b+-1*(b^2+-4*a*c)^(1/2))^-1//2),(b+(b^2+-4*a*c)^(1/2))^-1*(b+-1*(b^2+-4*a*c)^(1/2))))
@test integrate((1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1//2*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1)^-1//2*(b+-1*(b^2+-4*a*c)^(1/2)+2*c*x^2), x) == :(x*(1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1//2*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1)^(1/2)*(b+-1*(b^2+-4*a*c)^(1/2))+(1/2)*2^(1/2)*c^-1//2*((1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1))^-1//2*(1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1//2*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1)^(1/2)*(b+(b^2+-4*a*c)^(1/2))^(1/2)*(b+-1*(b^2+-4*a*c)^(1/2))*Elliptic.F(arctan(x*2^(1/2)*c^(1/2)*(b+(b^2+-4*a*c)^(1/2))^-1//2),-2*(b+-1*(b^2+-4*a*c)^(1/2))^-1*(b^2+-4*a*c)^(1/2))+-1//2*2^(1/2)*c^-1//2*((1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1))^-1//2*(1+2*c*x^2*(b+(b^2+-4*a*c)^(1/2))^-1)^-1//2*(1+2*c*x^2*(b+-1*(b^2+-4*a*c)^(1/2))^-1)^(1/2)*(b+(b^2+-4*a*c)^(1/2))^(1/2)*(b+-1*(b^2+-4*a*c)^(1/2))*Elliptic.E(arctan(x*2^(1/2)*c^(1/2)*(b+(b^2+-4*a*c)^(1/2))^-1//2),-2*(b+-1*(b^2+-4*a*c)^(1/2))^-1*(b^2+-4*a*c)^(1/2)))
@test integrate((c+d*x^2)^(1/2)*(e+f*x^2)^-1*(a+b*x^2), x) == :((1/2)*b*x*f^-1*(c+d*x^2)^(1/2)+-1//2*d^-1//2*f^-2*(-1*b*c*f+-2*a*d*f+2*b*d*e)*arctanh(x*d^(1/2)*(c+d*x^2)^-1//2)+e^-1//2*f^-2*(d*e+-1*c*f)^(1/2)*(b*e+-1*a*f)*arctanh(x*e^-1//2*(c+d*x^2)^-1//2*(d*e+-1*c*f)^(1/2)))
@test integrate((a+b*x^2)^3*(c+d*x^2)^-1*(e+f*x^2)^-1//2, x) == :(b*d^-3*f^-1//2*(b*c+-1*a*d)^2*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2)+-1*c^-1//2*d^-3*(b*c+-1*a*d)^3*(d*e+-1*c*f)^-1//2*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2))+1//8*b*d^-1*f^-5//2*(3*b^2*e^2+8*a^2*f^2+-8*a*b*e*f)*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2)+(1/2)*b*d^-2*f^-3//2*(b*c+-1*a*d)*(b*e+-2*a*f)*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2)+-3//8*x*b^2*d^-1*f^-2*(e+f*x^2)^(1/2)*(b*e+-2*a*f)+-1//2*x*b^2*d^-2*f^-1*(e+f*x^2)^(1/2)*(b*c+-1*a*d)+1//4*x*b^2*d^-1*f^-1*(e+f*x^2)^(1/2)*(a+b*x^2))
@test integrate((a+b*x^2)^2*(c+d*x^2)^-1*(e+f*x^2)^-1//2, x) == :(c^-1//2*d^-2*(b*c+-1*a*d)^2*(d*e+-1*c*f)^-1//2*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2))+(1/2)*x*b^2*d^-1*f^-1*(e+f*x^2)^(1/2)+-1*b*d^-2*f^-1//2*(b*c+-1*a*d)*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2)+-1//2*b*d^-1*f^-3//2*(b*e+-2*a*f)*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2))
@test integrate((c+d*x^2)^-1*(e+f*x^2)^-1//2*(a+b*x^2), x) == :(b*d^-1*f^-1//2*arctanh(x*f^(1/2)*(e+f*x^2)^-1//2)+-1*c^-1//2*d^-1*(d*e+-1*c*f)^-1//2*(b*c+-1*a*d)*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2)))
@test integrate((c+d*x^2)^-1*(e+f*x^2)^-1//2, x) == :(c^-1//2*(d*e+-1*c*f)^-1//2*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2)))
@test integrate((a+b*x^2)^-1*(c+d*x^2)^-1*(e+f*x^2)^-1//2, x) == :(b*a^-1//2*(b*c+-1*a*d)^-1*(b*e+-1*a*f)^-1//2*arctan(x*a^-1//2*(e+f*x^2)^-1//2*(b*e+-1*a*f)^(1/2))+-1*d*c^-1//2*(b*c+-1*a*d)^-1*(d*e+-1*c*f)^-1//2*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2)))
@test integrate((a+b*x^2)^-2*(c+d*x^2)^-1*(e+f*x^2)^-1//2, x) == :(c^-1//2*d^2*(b*c+-1*a*d)^-2*(d*e+-1*c*f)^-1//2*arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2))+(1/2)*b*a^-3//2*(b*c+-1*a*d)^-2*(b*e+-1*a*f)^-3//2*(c*e*b^2+4*d*f*a^2+-3*a*b*d*e+-2*a*b*c*f)*arctan(x*a^-1//2*(e+f*x^2)^-1//2*(b*e+-1*a*f)^(1/2))+(1/2)*x*a^-1*b^2*(a+b*x^2)^-1*(e+f*x^2)^(1/2)*(b*c+-1*a*d)^-1*(b*e+-1*a*f)^-1)
@test integrate((1+-1*x^2)^(1/2)*(-1+x^2)^-1*(a+b*x^2)^-1//2, x) == :(-1*(1+b*a^-1*x^2)^(1/2)*(a+b*x^2)^-1//2*Elliptic.F(arcsin(x),-1*b*a^-1))
@test integrate((c+d*x^2)^-1//2*(e+f*x^2)^-2*(a+b*x^2), x) == :(-1//2*e^-3//2*(d*e+-1*c*f)^-3//2*(a*c*f+b*c*e+-2*a*d*e)*arctanh(x*e^-1//2*(c+d*x^2)^-1//2*(d*e+-1*c*f)^(1/2))+(1/2)*x*e^-1*(c+d*x^2)^(1/2)*(e+f*x^2)^-1*(d*e+-1*c*f)^-1*(b*e+-1*a*f))
@test integrate((a+b*x^2)^-3//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2, x) == :(a^-1*e^(1/2)*(a*c^-1*(a+b*x^2)^-1*(c+d*x^2))^-1//2*(a*e^-1*(a+b*x^2)^-1*(e+f*x^2))^(1/2)*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e+-1*a*f)^-1//2*Elliptic.E(arcsin(x*e^-1//2*(a+b*x^2)^-1//2*(b*e+-1*a*f)^(1/2)),e*c^-1*(b*e+-1*a*f)^-1*(b*c+-1*a*d)))
@test integrate((a+b*x^2)^-1//2*(c+d*x^2)^(1/2)*(e+f*x^2)^-3//2, x) == :(x*e^-1*(a+b*x^2)^(1/2)*(c+d*x^2)^-1//2*(e+f*x^2)^-1//2*(b*e+-1*a*f)^-1*(d*e+-1*c*f)+a^-1*c^3//2*e^-1*(c*a^-1*(c+d*x^2)^-1*(a+b*x^2))^-1//2*(a+b*x^2)^(1/2)*(c+d*x^2)^-1//2*(d*e+-1*c*f)^-1//2*Elliptic.F(arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2)),-1*e*a^-1*(d*e+-1*c*f)^-1*(b*c+-1*a*d))+-1*c^(1/2)*e^-1*(c*a^-1*(c+d*x^2)^-1*(a+b*x^2))^-1//2*(a+b*x^2)^(1/2)*(c+d*x^2)^-1//2*(b*e+-1*a*f)^-1*(d*e+-1*c*f)^(1/2)*Elliptic.E(arctan(x*c^-1//2*(e+f*x^2)^-1//2*(d*e+-1*c*f)^(1/2)),-1*e*a^-1*(d*e+-1*c*f)^-1*(b*c+-1*a*d)))
@test integrate((a+b*x^2)^-1//2*(c+d*x^2)^-1//2*(e+f*x^2)^-1//2, x) == :(c^-1*e^(1/2)*(a*c^-1*(a+b*x^2)^-1*(c+d*x^2))^-1//2*(a*e^-1*(a+b*x^2)^-1*(e+f*x^2))^(1/2)*(c+d*x^2)^(1/2)*(e+f*x^2)^-1//2*(b*e+-1*a*f)^-1//2*Elliptic.F(arcsin(x*e^-1//2*(a+b*x^2)^-1//2*(b*e+-1*a*f)^(1/2)),e*c^-1*(b*e+-1*a*f)^-1*(b*c+-1*a*d)))