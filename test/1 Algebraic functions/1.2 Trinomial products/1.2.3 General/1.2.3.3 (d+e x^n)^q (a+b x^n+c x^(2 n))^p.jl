using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+c*x^6)^-1*(d+e*x^3), x) == :(-1//6*e*a^-1//3*c^-2//3*log(a^1//3+c^1//3*x^2)+-1//6*a^-5//6*c^-2//3*(d*c^(1/2)+e*3^(1/2)*a^(1/2))*arctan(3^(1/2)+-2*x*a^-1//6*c^1//6)+-1//12*a^-5//6*c^-2//3*(-1*e*a^(1/2)+d*3^(1/2)*c^(1/2))*log(a^1//3+c^1//3*x^2+-1*x*3^(1/2)*a^1//6*c^1//6)+1//3*d*a^-5//6*c^-1//6*arctan(x*a^-1//6*c^1//6)+1//6*a^-5//6*c^-2//3*(d*c^(1/2)+-1*e*3^(1/2)*a^(1/2))*arctan(3^(1/2)+2*x*a^-1//6*c^1//6)+1//12*a^-5//6*c^-2//3*(e*a^(1/2)+d*3^(1/2)*c^(1/2))*log(a^1//3+c^1//3*x^2+x*3^(1/2)*a^1//6*c^1//6))
@test integrate((a+-1*c*x^6)^-1*(d+e*x^3), x) == :(-1//6*a^-5//6*c^-2//3*(d*c^(1/2)+e*a^(1/2))*log(a^1//6+-1*x*c^1//6)+-1//12*a^-5//6*c^-1//6*(d+-1*e*a^(1/2)*c^-1//2)*log(a^1//3+c^1//3*x^2+-1*x*a^1//6*c^1//6)+1//6*a^-5//6*c^-1//6*(d+-1*e*a^(1/2)*c^-1//2)*log(a^1//6+x*c^1//6)+1//12*a^-5//6*c^-2//3*(d*c^(1/2)+e*a^(1/2))*log(a^1//3+c^1//3*x^2+x*a^1//6*c^1//6)+-1//6*3^(1/2)*a^-5//6*c^-1//6*(d+-1*e*a^(1/2)*c^-1//2)*arctan(1//3*3^(1/2)*a^-1//6*(a^1//6+-2*x*c^1//6))+1//6*3^(1/2)*a^-5//6*c^-2//3*(d*c^(1/2)+e*a^(1/2))*arctan(1//3*3^(1/2)*a^-1//6*(a^1//6+2*x*c^1//6)))
@test integrate((a+-1*c*x^8)^-1*(d+e*x^4), x) == :(1//4*a^-7//8*c^-5//8*(d*c^(1/2)+e*a^(1/2))*arctan(x*a^-1//8*c^1//8)+1//4*a^-7//8*c^-5//8*(d*c^(1/2)+e*a^(1/2))*arctanh(x*a^-1//8*c^1//8)+-1//8*2^(1/2)*a^-7//8*c^-1//8*(d+-1*e*a^(1/2)*c^-1//2)*arctan(1+-1*x*2^(1/2)*a^-1//8*c^1//8)+-1//16*2^(1/2)*a^-7//8*c^-1//8*(d+-1*e*a^(1/2)*c^-1//2)*log(a^1//4+c^1//4*x^2+-1*x*2^(1/2)*a^1//8*c^1//8)+1//8*2^(1/2)*a^-7//8*c^-1//8*(d+-1*e*a^(1/2)*c^-1//2)*arctan(1+x*2^(1/2)*a^-1//8*c^1//8)+1//16*2^(1/2)*a^-7//8*c^-1//8*(d+-1*e*a^(1/2)*c^-1//2)*log(a^1//4+c^1//4*x^2+x*2^(1/2)*a^1//8*c^1//8))
@test integrate((d^2+b*x^4+e^2*x^8)^-1*(d+e*x^4), x) == :(-1//4*d^-1//2*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//4*d^-1//2*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//8*d^-1//2*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+-1//8*d^-1//2*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+1//4*d^-1//2*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//4*d^-1//2*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//8*d^-1//2*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*((-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2)+1//8*d^-1//2*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*(-1*(-1b+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2))
@test integrate((d^2+f*x^4+e^2*x^8)^-1*(d+e*x^4), x) == :(-1//4*d^-1//2*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//4*d^-1//2*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//8*d^-1//2*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+-1//8*d^-1//2*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+1//4*d^-1//2*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//4*d^-1//2*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//8*d^-1//2*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*((-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2)+1//8*d^-1//2*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*(-1*(-1*f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2))
@test integrate((d^2+e^2*x^8+-1*b*x^4)^-1*(d+e*x^4), x) == :(-1//2*2^(1/2)*e^(1/2)*(b+-2*d*e)^-1//2*((b+-2*d*e)^(1/2)+(b+2*d*e)^(1/2))^-1//2*arctan(x*2^(1/2)*e^(1/2)*((b+-2*d*e)^(1/2)+(b+2*d*e)^(1/2))^-1//2)+-1//2*2^(1/2)*e^(1/2)*(b+-2*d*e)^-1//2*((b+-2*d*e)^(1/2)+(b+2*d*e)^(1/2))^-1//2*arctanh(x*2^(1/2)*e^(1/2)*((b+-2*d*e)^(1/2)+(b+2*d*e)^(1/2))^-1//2)+-1//2*2^(1/2)*e^(1/2)*(b+-2*d*e)^-1//2*((b+-2*d*e)^(1/2)+-1*(b+2*d*e)^(1/2))^-1//2*arctan(x*2^(1/2)*e^(1/2)*((b+-2*d*e)^(1/2)+-1*(b+2*d*e)^(1/2))^-1//2)+-1//2*2^(1/2)*e^(1/2)*(b+-2*d*e)^-1//2*((b+-2*d*e)^(1/2)+-1*(b+2*d*e)^(1/2))^-1//2*arctanh(x*2^(1/2)*e^(1/2)*((b+-2*d*e)^(1/2)+-1*(b+2*d*e)^(1/2))^-1//2))
@test integrate((d^2+e^2*x^8+-1*f*x^4)^-1*(d+e*x^4), x) == :(-1//4*d^-1//2*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//4*d^-1//2*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+-2*x*e^(1/2)))+-1//8*d^-1//2*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+-1//8*d^-1//2*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+e^(1/2)*x^2+-1*x*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2))+1//4*d^-1//2*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan(((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*((-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//4*d^-1//2*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*arctan((-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*(((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+2*x*e^(1/2)))+1//8*d^-1//2*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*((f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2)+1//8*d^-1//2*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^-1//2*log(d^(1/2)+x*(-1*(f+2*d*e)^(1/2)+2*d^(1/2)*e^(1/2))^(1/2)+e^(1/2)*x^2))
@test integrate((1+x^8+b*x^4)^-1*(1+x^4), x) == :(-1//4*(2+(2+-1b)^(1/2))^-1//2*arctan((2+(2+-1b)^(1/2))^-1//2*((2+-1*(2+-1b)^(1/2))^(1/2)+-2x))+-1//4*(2+-1*(2+-1b)^(1/2))^-1//2*arctan((2+-1*(2+-1b)^(1/2))^-1//2*((2+(2+-1b)^(1/2))^(1/2)+-2x))+-1//8*(2+(2+-1b)^(1/2))^-1//2*log(1+x^2+-1*x*(2+(2+-1b)^(1/2))^(1/2))+-1//8*(2+-1*(2+-1b)^(1/2))^-1//2*log(1+x^2+-1*x*(2+-1*(2+-1b)^(1/2))^(1/2))+1//4*(2+(2+-1b)^(1/2))^-1//2*arctan((2+(2+-1b)^(1/2))^-1//2*((2+-1*(2+-1b)^(1/2))^(1/2)+2x))+1//4*(2+-1*(2+-1b)^(1/2))^-1//2*arctan((2+-1*(2+-1b)^(1/2))^-1//2*((2+(2+-1b)^(1/2))^(1/2)+2x))+1//8*(2+(2+-1b)^(1/2))^-1//2*log(1+x^2+x*(2+(2+-1b)^(1/2))^(1/2))+1//8*(2+-1*(2+-1b)^(1/2))^-1//2*log(1+x^2+x*(2+-1*(2+-1b)^(1/2))^(1/2)))
@test integrate((1+x^8+3*x^4)^-1*(1+x^4), x) == :(-1//20*2^1//4*5^(1/2)*(3+5^(1/2))^1//4*arctan(1+-1*x*2^3//4*(3+-1*5^(1/2))^-1//4)+-1//20*2^1//4*5^(1/2)*(3+-1*5^(1/2))^1//4*arctan(1+-1*x*2^3//4*(3+5^(1/2))^-1//4)+-1//40*2^1//4*5^(1/2)*(3+5^(1/2))^1//4*log((6+-2*5^(1/2))^(1/2)+2*x^2+-2*x*(6+-2*5^(1/2))^1//4)+-1//40*2^1//4*5^(1/2)*(3+-1*5^(1/2))^1//4*log((6+2*5^(1/2))^(1/2)+2*x^2+-2*x*(6+2*5^(1/2))^1//4)+1//20*2^1//4*5^(1/2)*(3+5^(1/2))^1//4*arctan(1+x*2^3//4*(3+-1*5^(1/2))^-1//4)+1//20*2^1//4*5^(1/2)*(3+-1*5^(1/2))^1//4*arctan(1+x*2^3//4*(3+5^(1/2))^-1//4)+1//40*2^1//4*5^(1/2)*(3+5^(1/2))^1//4*log((6+-2*5^(1/2))^(1/2)+2*x^2+2*x*(6+-2*5^(1/2))^1//4)+1//40*2^1//4*5^(1/2)*(3+-1*5^(1/2))^1//4*log((6+2*5^(1/2))^(1/2)+2*x^2+2*x*(6+2*5^(1/2))^1//4))
@test integrate((1+x^8+2*x^4)^-1*(1+x^4), x) == :(-1//4*2^(1/2)*arctan(1+-1*x*2^(1/2))+-1//8*2^(1/2)*log(1+x^2+-1*x*2^(1/2))+1//4*2^(1/2)*arctan(1+x*2^(1/2))+1//8*2^(1/2)*log(1+x^2+x*2^(1/2)))
@test integrate((1+x^4+x^8)^-1*(1+x^4), x) == :(-1//4*arctan(3^(1/2)+-2x)+-1//8*log(1+x^2+-1x)+1//4*arctan(3^(1/2)+2x)+1//8*log(1+x+x^2)+-1//12*3^(1/2)*arctan(1//3*3^(1/2)*(1+-2x))+-1//24*3^(1/2)*log(1+x^2+-1*x*3^(1/2))+1//12*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x))+1//24*3^(1/2)*log(1+x^2+x*3^(1/2)))
@test integrate((1+x^8)^-1*(1+x^4), x) == :(-1//4*(1+(1/2)*2^(1/2))^(1/2)*arctan((2+-1*2^(1/2))^-1//2*((2+2^(1/2))^(1/2)+-2x))+-1//4*(1+-1//2*2^(1/2))^(1/2)*arctan((2+2^(1/2))^-1//2*((2+-1*2^(1/2))^(1/2)+-2x))+-1//8*(2+2^(1/2))^-1//2*log(1+x^2+-1*x*(2+2^(1/2))^(1/2))+-1//8*(2+-1*2^(1/2))^-1//2*log(1+x^2+-1*x*(2+-1*2^(1/2))^(1/2))+1//4*(1+(1/2)*2^(1/2))^(1/2)*arctan((2+-1*2^(1/2))^-1//2*((2+2^(1/2))^(1/2)+2x))+1//4*(1+-1//2*2^(1/2))^(1/2)*arctan((2+2^(1/2))^-1//2*((2+-1*2^(1/2))^(1/2)+2x))+1//8*(2+2^(1/2))^-1//2*log(1+x^2+x*(2+2^(1/2))^(1/2))+1//8*(2+-1*2^(1/2))^-1//2*log(1+x^2+x*(2+-1*2^(1/2))^(1/2)))
@test integrate((1+x^8+-1*x^4)^-1*(1+x^4), x) == :(-1//4*(2+3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+-2x))+-1//4*(2+-1*3^(1/2))^(1/2)*arctan((2+3^(1/2))^-1//2*((2+-1*3^(1/2))^(1/2)+-2x))+-1//8*(2+3^(1/2))^-1//2*log(1+x^2+-1*x*(2+3^(1/2))^(1/2))+-1//8*(2+-1*3^(1/2))^-1//2*log(1+x^2+-1*x*(2+-1*3^(1/2))^(1/2))+1//4*(2+3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+2x))+1//4*(2+-1*3^(1/2))^(1/2)*arctan((2+3^(1/2))^-1//2*((2+-1*3^(1/2))^(1/2)+2x))+1//8*(2+3^(1/2))^-1//2*log(1+x^2+x*(2+3^(1/2))^(1/2))+1//8*(2+-1*3^(1/2))^-1//2*log(1+x^2+x*(2+-1*3^(1/2))^(1/2)))
@test integrate((1+x^8+-2*x^4)^-1*(1+x^4), x) == :(1//4*arctan(x)+1//4*arctanh(x)+x*(2+-2*x^4)^-1)
@test integrate((1+x^8+-3*x^4)^-1*(1+x^4), x) == :((-2+2*5^(1/2))^-1//2*arctan(x*2^(1/2)*(-1+5^(1/2))^-1//2)+(-2+2*5^(1/2))^-1//2*arctanh(x*2^(1/2)*(-1+5^(1/2))^-1//2)+-1*(2+2*5^(1/2))^-1//2*arctan(x*2^(1/2)*(1+5^(1/2))^-1//2)+-1*(2+2*5^(1/2))^-1//2*arctanh(x*2^(1/2)*(1+5^(1/2))^-1//2))
@test integrate((1+x^8+-4*x^4)^-1*(1+x^4), x) == :(-1//4*2^3//4*(1+3^(1/2))^-1//2*arctan(x*2^1//4*(1+3^(1/2))^-1//2)+-1//4*2^3//4*(1+3^(1/2))^-1//2*arctanh(x*2^1//4*(1+3^(1/2))^-1//2)+1//4*2^3//4*(-1+3^(1/2))^-1//2*arctan(x*2^1//4*(-1+3^(1/2))^-1//2)+1//4*2^3//4*(-1+3^(1/2))^-1//2*arctanh(x*2^1//4*(-1+3^(1/2))^-1//2))
@test integrate((1+x^8+-5*x^4)^-1*(1+x^4), x) == :((-6*3^(1/2)+6*7^(1/2))^-1//2*arctan(x*2^(1/2)*(7^(1/2)+-1*3^(1/2))^-1//2)+(-6*3^(1/2)+6*7^(1/2))^-1//2*arctanh(x*2^(1/2)*(7^(1/2)+-1*3^(1/2))^-1//2)+-1*(6*3^(1/2)+6*7^(1/2))^-1//2*arctan(x*2^(1/2)*(3^(1/2)+7^(1/2))^-1//2)+-1*(6*3^(1/2)+6*7^(1/2))^-1//2*arctanh(x*2^(1/2)*(3^(1/2)+7^(1/2))^-1//2))
@test integrate((1+x^8+-6*x^4)^-1*(1+x^4), x) == :(-1//4*(1+2^(1/2))^-1//2*arctan(x*(1+2^(1/2))^-1//2)+-1//4*(1+2^(1/2))^-1//2*arctanh(x*(1+2^(1/2))^-1//2)+1//4*(-1+2^(1/2))^-1//2*arctan(x*(-1+2^(1/2))^-1//2)+1//4*(-1+2^(1/2))^-1//2*arctanh(x*(-1+2^(1/2))^-1//2))
@test integrate((1+x^8+b*x^4)^-1*(1+-1*x^4), x) == :(-1//8*(2+(2+-1b)^(1/2))^(1/2)*(2+-1b)^-1//2*log(1+x^2+-1*x*(2+(2+-1b)^(1/2))^(1/2))+-1//8*(2+-1b)^-1//2*(2+-1*(2+-1b)^(1/2))^(1/2)*log(1+x^2+x*(2+-1*(2+-1b)^(1/2))^(1/2))+1//8*(2+(2+-1b)^(1/2))^(1/2)*(2+-1b)^-1//2*log(1+x^2+x*(2+(2+-1b)^(1/2))^(1/2))+1//8*(2+-1b)^-1//2*(2+-1*(2+-1b)^(1/2))^(1/2)*log(1+x^2+-1*x*(2+-1*(2+-1b)^(1/2))^(1/2))+-1//4*(2+b)^(1/2)*(2+(2+-1b)^(1/2))^-1//2*(2+-1b)^-1//2*arctan((2+-1*(2+-1b)^(1/2))^-1//2*((2+(2+-1b)^(1/2))^(1/2)+2x))+-1//4*(2+b)^(1/2)*(2+-1b)^-1//2*(2+-1*(2+-1b)^(1/2))^-1//2*arctan((2+(2+-1b)^(1/2))^-1//2*((2+-1*(2+-1b)^(1/2))^(1/2)+-2x))+1//4*(2+b)^(1/2)*(2+(2+-1b)^(1/2))^-1//2*(2+-1b)^-1//2*arctan((2+-1*(2+-1b)^(1/2))^-1//2*((2+(2+-1b)^(1/2))^(1/2)+-2x))+1//4*(2+b)^(1/2)*(2+-1b)^-1//2*(2+-1*(2+-1b)^(1/2))^-1//2*arctan((2+(2+-1b)^(1/2))^-1//2*((2+-1*(2+-1b)^(1/2))^(1/2)+2x)))
@test integrate((1+x^8+3*x^4)^-1*(1+-1*x^4), x) == :(-1//4*2^1//4*(3+5^(1/2))^1//4*arctan(1+-1*x*2^3//4*(3+-1*5^(1/2))^-1//4)+-1//4*2^1//4*(3+-1*5^(1/2))^1//4*arctan(1+x*2^3//4*(3+5^(1/2))^-1//4)+-1//8*2^1//4*(3+5^(1/2))^1//4*log((6+-2*5^(1/2))^(1/2)+2*x^2+-2*x*(6+-2*5^(1/2))^1//4)+-1//8*2^1//4*(3+-1*5^(1/2))^1//4*log((6+2*5^(1/2))^(1/2)+2*x^2+2*x*(6+2*5^(1/2))^1//4)+1//4*2^1//4*(3+5^(1/2))^1//4*arctan(1+x*2^3//4*(3+-1*5^(1/2))^-1//4)+1//4*2^1//4*(3+-1*5^(1/2))^1//4*arctan(1+-1*x*2^3//4*(3+5^(1/2))^-1//4)+1//8*2^1//4*(3+5^(1/2))^1//4*log((6+-2*5^(1/2))^(1/2)+2*x^2+2*x*(6+-2*5^(1/2))^1//4)+1//8*2^1//4*(3+-1*5^(1/2))^1//4*log((6+2*5^(1/2))^(1/2)+2*x^2+-2*x*(6+2*5^(1/2))^1//4))
@test integrate((1+x^8+2*x^4)^-1*(1+-1*x^4), x) == :(x*(2+2*x^4)^-1+-1//8*2^(1/2)*arctan(1+-1*x*2^(1/2))+-1//16*2^(1/2)*log(1+x^2+-1*x*2^(1/2))+1//8*2^(1/2)*arctan(1+x*2^(1/2))+1//16*2^(1/2)*log(1+x^2+x*2^(1/2)))
@test integrate((1+x^4+x^8)^-1*(1+-1*x^4), x) == :(-1//4*arctan(3^(1/2)+2x)+-1//8*log(1+x+x^2)+1//4*arctan(3^(1/2)+-2x)+1//8*log(1+x^2+-1x)+-1//4*3^(1/2)*arctan(1//3*3^(1/2)*(1+-2x))+-1//8*3^(1/2)*log(1+x^2+-1*x*3^(1/2))+1//4*3^(1/2)*arctan(1//3*3^(1/2)*(1+2x))+1//8*3^(1/2)*log(1+x^2+x*3^(1/2)))
@test integrate((1+x^8)^-1*(1+-1*x^4), x) == :(-1//4*(2+2^(1/2))^-1//2*arctan((2+-1*2^(1/2))^-1//2*((2+2^(1/2))^(1/2)+2x))+-1//4*(2+-1*2^(1/2))^-1//2*arctan((2+2^(1/2))^-1//2*((2+-1*2^(1/2))^(1/2)+-2x))+-1//8*(1+(1/2)*2^(1/2))^(1/2)*log(1+x^2+-1*x*(2+2^(1/2))^(1/2))+-1//8*(1+-1//2*2^(1/2))^(1/2)*log(1+x^2+x*(2+-1*2^(1/2))^(1/2))+1//4*(2+2^(1/2))^-1//2*arctan((2+-1*2^(1/2))^-1//2*((2+2^(1/2))^(1/2)+-2x))+1//4*(2+-1*2^(1/2))^-1//2*arctan((2+2^(1/2))^-1//2*((2+-1*2^(1/2))^(1/2)+2x))+1//8*(1+(1/2)*2^(1/2))^(1/2)*log(1+x^2+x*(2+2^(1/2))^(1/2))+1//8*(1+-1//2*2^(1/2))^(1/2)*log(1+x^2+-1*x*(2+-1*2^(1/2))^(1/2)))
@test integrate((1+x^8+-1*x^4)^-1*(1+-1*x^4), x) == :(-1//4*(6+-3*3^(1/2))^-1//2*arctan((2+3^(1/2))^-1//2*((2+-1*3^(1/2))^(1/2)+-2x))+-1//4*(6+3*3^(1/2))^-1//2*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+2x))+-1//8*(2//3+-1//3*3^(1/2))^(1/2)*log(1+x^2+x*(2+-1*3^(1/2))^(1/2))+-1//8*(2//3+1//3*3^(1/2))^(1/2)*log(1+x^2+-1*x*(2+3^(1/2))^(1/2))+1//4*(6+-3*3^(1/2))^-1//2*arctan((2+3^(1/2))^-1//2*((2+-1*3^(1/2))^(1/2)+2x))+1//4*(6+3*3^(1/2))^-1//2*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+-2x))+1//8*(2//3+-1//3*3^(1/2))^(1/2)*log(1+x^2+-1*x*(2+-1*3^(1/2))^(1/2))+1//8*(2//3+1//3*3^(1/2))^(1/2)*log(1+x^2+x*(2+3^(1/2))^(1/2)))
@test integrate((1+x^8+-2*x^4)^-1*(1+-1*x^4), x) == :((1/2)*arctan(x)+(1/2)*arctanh(x))
@test integrate((1+x^8+-3*x^4)^-1*(1+-1*x^4), x) == :((-10+10*5^(1/2))^-1//2*arctan(x*2^(1/2)*(-1+5^(1/2))^-1//2)+(-10+10*5^(1/2))^-1//2*arctanh(x*2^(1/2)*(-1+5^(1/2))^-1//2)+(10+10*5^(1/2))^-1//2*arctan(x*2^(1/2)*(1+5^(1/2))^-1//2)+(10+10*5^(1/2))^-1//2*arctanh(x*2^(1/2)*(1+5^(1/2))^-1//2))
@test integrate((1+x^8+-4*x^4)^-1*(1+-1*x^4), x) == :(1//4*2^3//4*(-3+3*3^(1/2))^-1//2*arctan(x*2^1//4*(-1+3^(1/2))^-1//2)+1//4*2^3//4*(-3+3*3^(1/2))^-1//2*arctanh(x*2^1//4*(-1+3^(1/2))^-1//2)+1//4*2^3//4*(3+3*3^(1/2))^-1//2*arctan(x*2^1//4*(1+3^(1/2))^-1//2)+1//4*2^3//4*(3+3*3^(1/2))^-1//2*arctanh(x*2^1//4*(1+3^(1/2))^-1//2))
@test integrate((1+x^8+-5*x^4)^-1*(1+-1*x^4), x) == :((-14*3^(1/2)+14*7^(1/2))^-1//2*arctan(x*2^(1/2)*(7^(1/2)+-1*3^(1/2))^-1//2)+(-14*3^(1/2)+14*7^(1/2))^-1//2*arctanh(x*2^(1/2)*(7^(1/2)+-1*3^(1/2))^-1//2)+(14*3^(1/2)+14*7^(1/2))^-1//2*arctan(x*2^(1/2)*(3^(1/2)+7^(1/2))^-1//2)+(14*3^(1/2)+14*7^(1/2))^-1//2*arctanh(x*2^(1/2)*(3^(1/2)+7^(1/2))^-1//2))
@test integrate((1+x^8+-6*x^4)^-1*(1+-1*x^4), x) == :(1//4*(-2+2*2^(1/2))^-1//2*arctan(x*(-1+2^(1/2))^-1//2)+1//4*(-2+2*2^(1/2))^-1//2*arctanh(x*(-1+2^(1/2))^-1//2)+1//4*(2+2*2^(1/2))^-1//2*arctan(x*(1+2^(1/2))^-1//2)+1//4*(2+2*2^(1/2))^-1//2*arctanh(x*(1+2^(1/2))^-1//2))
@test integrate((1+x^8+-1*x^4)^-1*(-1+3^(1/2)+2*x^4), x) == :((1/2)*2^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+2x))+-1//2*2^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+-2x))+-1//4*2^(1/2)*log(1+x^2+-1*x*(2+-1*3^(1/2))^(1/2))+1//4*2^(1/2)*log(1+x^2+x*(2+-1*3^(1/2))^(1/2)))
@test integrate((1+x^8+-1*x^4)^-1*(1+x^4*(1+3^(1/2))), x) == :((1/2)*(2+3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+2x))+-1//2*(2+3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+-2x))+-1//4*(2+3^(1/2))^(1/2)*log(1+x^2+-1*x*(2+-1*3^(1/2))^(1/2))+1//4*(2+3^(1/2))^(1/2)*log(1+x^2+x*(2+-1*3^(1/2))^(1/2)))
@test integrate((1+x^8+-1*x^4)^-1*(3+-2*3^(1/2)+x^4*(-3+3^(1/2))), x) == :((1/2)*(6+-3*3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+-2x))+-1//2*(6+-3*3^(1/2))^(1/2)*arctan((2+-1*3^(1/2))^-1//2*((2+3^(1/2))^(1/2)+2x))+-1//4*(6+-3*3^(1/2))^(1/2)*log(1+x^2+x*(2+-1*3^(1/2))^(1/2))+1//4*(6+-3*3^(1/2))^(1/2)*log(1+x^2+-1*x*(2+-1*3^(1/2))^(1/2)))
@test integrate((c+a*x^-2)^-1*(d+e*x^-1), x) == :(d*x*c^-1+(1/2)*e*c^-1*log(a+c*x^2)+-1*d*a^(1/2)*c^-3//2*arctan(x*a^-1//2*c^(1/2)))
@test integrate((c+a*x^-2+b*x^-1)^-1*(d+e*x^-1), x) == :(d*x*c^-1+-1//2*c^-2*(b*d+-1*c*e)*log(a+b*x+c*x^2)+-1*c^-2*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*x)))
@test integrate((c+a*x^-4)^-1*(d+e*x^-2), x) == :(d*x*c^-1+-1//4*2^(1/2)*a^-1//4*c^-5//4*(d*a^(1/2)+-1*e*c^(1/2))*arctan(1+x*2^(1/2)*a^-1//4*c^1//4)+-1//8*2^(1/2)*a^-1//4*c^-5//4*(d*a^(1/2)+e*c^(1/2))*log(a^(1/2)+c^(1/2)*x^2+x*2^(1/2)*a^1//4*c^1//4)+1//4*2^(1/2)*a^-1//4*c^-5//4*(d*a^(1/2)+-1*e*c^(1/2))*arctan(1+-1*x*2^(1/2)*a^-1//4*c^1//4)+1//8*2^(1/2)*a^-1//4*c^-5//4*(d*a^(1/2)+e*c^(1/2))*log(a^(1/2)+c^(1/2)*x^2+-1*x*2^(1/2)*a^1//4*c^1//4))
@test integrate((c+a*x^-4+b*x^-2)^-1*(d+e*x^-2), x) == :(d*x*c^-1+-1//2*2^(1/2)*c^-3//2*(b+(b^2+-4*a*c)^(1/2))^-1//2*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*arctan(x*2^(1/2)*c^(1/2)*(b+(b^2+-4*a*c)^(1/2))^-1//2)+-1//2*2^(1/2)*c^-3//2*(b+-1*(b^2+-4*a*c)^(1/2))^-1//2*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*arctan(x*2^(1/2)*c^(1/2)*(b+-1*(b^2+-4*a*c)^(1/2))^-1//2))
@test integrate((c+a*x^-6)^-1*(d+e*x^-3), x) == :(d*x*c^-1+-1//3*d*a^1//6*c^-7//6*arctan(x*a^-1//6*c^1//6)+-1//6*e*a^-1//3*c^-2//3*log(a^1//3+c^1//3*x^2)+-1//6*a^-1//3*c^-7//6*(d*a^(1/2)+e*3^(1/2)*c^(1/2))*arctan(3^(1/2)+2*x*a^-1//6*c^1//6)+-1//12*a^-1//3*c^-7//6*(-1*e*c^(1/2)+d*3^(1/2)*a^(1/2))*log(a^1//3+c^1//3*x^2+x*3^(1/2)*a^1//6*c^1//6)+1//6*a^-1//3*c^-7//6*(d*a^(1/2)+-1*e*3^(1/2)*c^(1/2))*arctan(3^(1/2)+-2*x*a^-1//6*c^1//6)+1//12*a^-1//3*c^-7//6*(e*c^(1/2)+d*3^(1/2)*a^(1/2))*log(a^1//3+c^1//3*x^2+-1*x*3^(1/2)*a^1//6*c^1//6))
@test integrate((c+a*x^-6+b*x^-3)^-1*(d+e*x^-3), x) == :(d*x*c^-1+-1//6*2^2//3*c^-4//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*log((b+(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+-1//6*2^2//3*c^-4//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*log((b+-1*(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+1//12*2^2//3*c^-4//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*log((b+(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^1//3)+1//12*2^2//3*c^-4//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*log((b+-1*(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^1//3)+1//6*2^2//3*3^(1/2)*c^-4//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^-1//3))+1//6*2^2//3*3^(1/2)*c^-4//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3)))
@test integrate((c+a*x^-8)^-1*(d+e*x^-4), x) == :(d*x*c^-1+-1//8*a^-3//8*c^-9//8*(2+2^(1/2))^(1/2)*(e*c^(1/2)+a^(1/2)*(d+-1*d*2^(1/2)))*arctan(a^-1//8*(2+-1*2^(1/2))^-1//2*(a^1//8*(2+2^(1/2))^(1/2)+-2*x*c^1//8))+-1//8*a^-3//8*c^-9//8*(2+-1*2^(1/2))^(1/2)*(e*c^(1/2)+d*a^(1/2)*(1+2^(1/2)))*arctan(a^-1//8*(2+2^(1/2))^-1//2*(a^1//8*(2+-1*2^(1/2))^(1/2)+2*x*c^1//8))+-1//8*a^-3//8*c^-9//8*(4+-2*2^(1/2))^-1//2*(e*c^(1/2)+a^(1/2)*(d+-1*d*2^(1/2)))*log(a^1//4+c^1//4*x^2+-1*x*a^1//8*c^1//8*(2+-1*2^(1/2))^(1/2))+-1//8*a^-3//8*c^-9//8*(4+2*2^(1/2))^-1//2*(e*c^(1/2)+d*a^(1/2)*(1+2^(1/2)))*log(a^1//4+c^1//4*x^2+x*a^1//8*c^1//8*(2+2^(1/2))^(1/2))+1//8*a^-3//8*c^-9//8*(2+2^(1/2))^(1/2)*(e*c^(1/2)+a^(1/2)*(d+-1*d*2^(1/2)))*arctan(a^-1//8*(2+-1*2^(1/2))^-1//2*(a^1//8*(2+2^(1/2))^(1/2)+2*x*c^1//8))+1//8*a^-3//8*c^-9//8*(2+-1*2^(1/2))^(1/2)*(e*c^(1/2)+d*a^(1/2)*(1+2^(1/2)))*arctan(a^-1//8*(2+2^(1/2))^-1//2*(a^1//8*(2+-1*2^(1/2))^(1/2)+-2*x*c^1//8))+1//8*a^-3//8*c^-9//8*(4+-2*2^(1/2))^-1//2*(e*c^(1/2)+a^(1/2)*(d+-1*d*2^(1/2)))*log(a^1//4+c^1//4*x^2+x*a^1//8*c^1//8*(2+-1*2^(1/2))^(1/2))+1//8*a^-3//8*c^-9//8*(4+2*2^(1/2))^-1//2*(e*c^(1/2)+d*a^(1/2)*(1+2^(1/2)))*log(a^1//4+c^1//4*x^2+-1*x*a^1//8*c^1//8*(2+2^(1/2))^(1/2)))
@test integrate((c+a*x^-8+b*x^-4)^-1*(d+e*x^-4), x) == :(d*x*c^-1+1//4*2^3//4*c^-5//4*((b^2+-4*a*c)^(1/2)+-1b)^-3//4*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*arctan(x*2^1//4*c^1//4*((b^2+-4*a*c)^(1/2)+-1b)^-1//4)+1//4*2^3//4*c^-5//4*((b^2+-4*a*c)^(1/2)+-1b)^-3//4*(b*d+-1*c*e+-1*(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d))*arctanh(x*2^1//4*c^1//4*((b^2+-4*a*c)^(1/2)+-1b)^-1//4)+1//4*2^3//4*c^-5//4*(-1b+-1*(b^2+-4*a*c)^(1/2))^-3//4*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*arctan(x*2^1//4*c^1//4*(-1b+-1*(b^2+-4*a*c)^(1/2))^-1//4)+1//4*2^3//4*c^-5//4*(-1b+-1*(b^2+-4*a*c)^(1/2))^-3//4*(b*d+(b^2+-4*a*c)^-1//2*(d*b^2+-1*b*c*e+-2*a*c*d)+-1*c*e)*arctanh(x*2^1//4*c^1//4*(-1b+-1*(b^2+-4*a*c)^(1/2))^-1//4))
@test integrate((d+e*x^n)*(a+b*x^n+c*x^(2n)), x) == :(a*d*x+x^(1+n)*(1+n)^-1*(a*e+b*d)+x^(1+2n)*(1+2n)^-1*(b*e+c*d)+c*e*x^(1+3n)*(1+3n)^-1)
@test integrate((a+b*x^n+c*x^(2n))^2*(d+e*x^n), x) == :(d*x*a^2+x^(1+2n)*(1+2n)^-1*(d*b^2+2*a*b*e+2*a*c*d)+x^(1+3n)*(1+3n)^-1*(e*b^2+2*a*c*e+2*b*c*d)+a*x^(1+n)*(1+n)^-1*(a*e+2*b*d)+c*x^(1+4n)*(1+4n)^-1*(c*d+2*b*e)+e*c^2*x^(1+5n)*(1+5n)^-1)
@test integrate((a+b*x^n+c*x^(2n))^3*(d+e*x^n), x) == :(d*x*a^3+x^(1+3n)*(1+3n)^-1*(d*b^3+3*a*e*b^2+3*c*e*a^2+6*a*b*c*d)+x^(1+4n)*(1+4n)^-1*(e*b^3+3*a*d*c^2+3*c*d*b^2+6*a*b*c*e)+e*c^3*x^(1+7n)*(1+7n)^-1+a^2*x^(1+n)*(1+n)^-1*(a*e+3*b*d)+c^2*x^(1+6n)*(1+6n)^-1*(c*d+3*b*e)+3*a*x^(1+2n)*(1+2n)^-1*(d*b^2+a*b*e+a*c*d)+3*c*x^(1+5n)*(1+5n)^-1*(e*b^2+a*c*e+b*c*d))
