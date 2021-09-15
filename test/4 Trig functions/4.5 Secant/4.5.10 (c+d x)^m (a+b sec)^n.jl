using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((c+d*x)^3*(a+a*sec(e+f*x)), x) == :(1//4*a*d^-1*(c+d*x)^4+-6*im*a*d^3*f^-4*Polylogarithms.polylog(4,-1*im*exp(im*(e+f*x)))+-6*a*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+-2*im*a*f^-1*(c+d*x)^3*arctan(exp(im*(e+f*x)))+6*im*a*d^3*f^-4*Polylogarithms.polylog(4,im*exp(im*(e+f*x)))+6*a*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-3*im*a*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+3*im*a*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((c+d*x)^2*(a+a*sec(e+f*x)), x) == :(1//3*a*d^-1*(c+d*x)^3+-2*a*d^2*f^-3*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+2*a*d^2*f^-3*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-2*im*a*f^-1*(c+d*x)^2*arctan(exp(im*(e+f*x)))+-2*im*a*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+2*im*a*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))*(c+d*x), x) == :((1/2)*a*d^-1*(c+d*x)^2+im*a*d*f^-2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x)))+-1*im*a*d*f^-2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+-2*im*a*f^-1*(c+d*x)*arctan(exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^2*(c+d*x)^3, x) == :(1//4*a^2*d^-1*(c+d*x)^4+a^2*f^-1*(c+d*x)^3*tan(e+f*x)+-1*im*a^2*f^-1*(c+d*x)^3+3//2*a^2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(2*im*(e+f*x)))+-12*im*a^2*d^3*f^-4*Polylogarithms.polylog(4,-1*im*exp(im*(e+f*x)))+-12*a^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+-4*im*a^2*f^-1*(c+d*x)^3*arctan(exp(im*(e+f*x)))+3*d*a^2*f^-2*(c+d*x)^2*log(1+exp(2*im*(e+f*x)))+12*im*a^2*d^3*f^-4*Polylogarithms.polylog(4,im*exp(im*(e+f*x)))+12*a^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-6*im*d*a^2*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+-3*im*a^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*im*(e+f*x)))+6*im*d*a^2*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^2*(c+d*x)^2, x) == :(1//3*a^2*d^-1*(c+d*x)^3+a^2*f^-1*(c+d*x)^2*tan(e+f*x)+-1*im*a^2*f^-1*(c+d*x)^2+-4*a^2*d^2*f^-3*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+4*a^2*d^2*f^-3*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-1*im*a^2*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(2*im*(e+f*x)))+-4*im*a^2*f^-1*(c+d*x)^2*arctan(exp(im*(e+f*x)))+2*d*a^2*f^-2*(c+d*x)*log(1+exp(2*im*(e+f*x)))+-4*im*d*a^2*f^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+4*im*d*a^2*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^2*(c+d*x), x) == :((1/2)*a^2*d^-1*(c+d*x)^2+d*a^2*f^-2*log(cos(e+f*x))+a^2*f^-1*(c+d*x)*tan(e+f*x)+-4*im*a^2*f^-1*(c+d*x)*arctan(exp(im*(e+f*x)))+-2*im*d*a^2*f^-2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+2*im*d*a^2*f^-2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^-1*(c+d*x)^3, x) == :(1//4*a^-1*d^-1*(c+d*x)^4+im*a^-1*f^-1*(c+d*x)^3+-1*a^-1*f^-1*(c+d*x)^3*tan((1/2)*e+(1/2)*f*x)+-12*a^-1*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(im*(e+f*x)))+-6*d*a^-1*f^-2*(c+d*x)^2*log(1+exp(im*(e+f*x)))+12*im*a^-1*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^-1*(c+d*x)^2, x) == :(1//3*a^-1*d^-1*(c+d*x)^3+im*a^-1*f^-1*(c+d*x)^2+-1*a^-1*f^-1*(c+d*x)^2*tan((1/2)*e+(1/2)*f*x)+-4*d*a^-1*f^-2*(c+d*x)*log(1+exp(im*(e+f*x)))+4*im*a^-1*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^-1*(c+d*x), x) == :((1/2)*a^-1*d^-1*(c+d*x)^2+-1*a^-1*f^-1*(c+d*x)*tan((1/2)*e+(1/2)*f*x)+-2*d*a^-1*f^-2*log(cos((1/2)*e+(1/2)*f*x)))
@test integrate((a+a*sec(e+f*x))^-2*(c+d*x)^3, x) == :(1//4*a^-2*d^-1*(c+d*x)^4+-20*a^-2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(im*(e+f*x)))+4*a^-2*d^3*f^-4*log(cos((1/2)*e+(1/2)*f*x))+-5//3*a^-2*f^-1*(c+d*x)^3*tan((1/2)*e+(1/2)*f*x)+5//3*im*a^-2*f^-1*(c+d*x)^3+-10*d*a^-2*f^-2*(c+d*x)^2*log(1+exp(im*(e+f*x)))+2*a^-2*d^2*f^-3*(c+d*x)*tan((1/2)*e+(1/2)*f*x)+-1//2*d*a^-2*f^-2*(c+d*x)^2*sec((1/2)*e+(1/2)*f*x)^2+1//6*a^-2*f^-1*(c+d*x)^3*sec((1/2)*e+(1/2)*f*x)^2*tan((1/2)*e+(1/2)*f*x)+20*im*a^-2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^-2*(c+d*x)^2, x) == :(1//3*a^-2*d^-1*(c+d*x)^3+-5//3*a^-2*f^-1*(c+d*x)^2*tan((1/2)*e+(1/2)*f*x)+2//3*a^-2*d^2*f^-3*tan((1/2)*e+(1/2)*f*x)+5//3*im*a^-2*f^-1*(c+d*x)^2+-20//3*d*a^-2*f^-2*(c+d*x)*log(1+exp(im*(e+f*x)))+-1//3*d*a^-2*f^-2*sec((1/2)*e+(1/2)*f*x)^2*(c+d*x)+1//6*a^-2*f^-1*(c+d*x)^2*sec((1/2)*e+(1/2)*f*x)^2*tan((1/2)*e+(1/2)*f*x)+20//3*im*a^-2*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(im*(e+f*x))))
@test integrate((a+a*sec(e+f*x))^-2*(c+d*x), x) == :((1/2)*a^-2*d^-1*(c+d*x)^2+-10//3*d*a^-2*f^-2*log(cos((1/2)*e+(1/2)*f*x))+-1//3*a^-2*f^-1*(5c+5*d*x)*tan((1/2)*e+(1/2)*f*x)+-1//6*d*a^-2*f^-2*sec((1/2)*e+(1/2)*f*x)^2+1//6*a^-2*f^-1*sec((1/2)*e+(1/2)*f*x)^2*(c+d*x)*tan((1/2)*e+(1/2)*f*x))
@test integrate((c+d*x)^3*(a+b*sec(e+f*x)), x) == :(1//4*a*d^-1*(c+d*x)^4+-6*im*b*d^3*f^-4*Polylogarithms.polylog(4,-1*im*exp(im*(e+f*x)))+-6*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+-2*im*b*f^-1*(c+d*x)^3*arctan(exp(im*(e+f*x)))+6*im*b*d^3*f^-4*Polylogarithms.polylog(4,im*exp(im*(e+f*x)))+6*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-3*im*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+3*im*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((c+d*x)^2*(a+b*sec(e+f*x)), x) == :(1//3*a*d^-1*(c+d*x)^3+-2*b*d^2*f^-3*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+2*b*d^2*f^-3*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-2*im*b*f^-1*(c+d*x)^2*arctan(exp(im*(e+f*x)))+-2*im*b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+2*im*b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))*(c+d*x), x) == :((1/2)*a*d^-1*(c+d*x)^2+im*b*d*f^-2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x)))+-1*im*b*d*f^-2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+-2*im*b*f^-1*(c+d*x)*arctan(exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^2*(c+d*x)^3, x) == :(1//4*a^2*d^-1*(c+d*x)^4+b^2*f^-1*(c+d*x)^3*tan(e+f*x)+-1*im*b^2*f^-1*(c+d*x)^3+3//2*b^2*d^3*f^-4*Polylogarithms.polylog(3,-1*exp(2*im*(e+f*x)))+3*d*b^2*f^-2*(c+d*x)^2*log(1+exp(2*im*(e+f*x)))+-12*im*a*b*d^3*f^-4*Polylogarithms.polylog(4,-1*im*exp(im*(e+f*x)))+-12*a*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+-4*im*a*b*f^-1*(c+d*x)^3*arctan(exp(im*(e+f*x)))+-3*im*b^2*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(2,-1*exp(2*im*(e+f*x)))+12*im*a*b*d^3*f^-4*Polylogarithms.polylog(4,im*exp(im*(e+f*x)))+12*a*b*d^2*f^-3*(c+d*x)*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-6*im*a*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+6*im*a*b*d*f^-2*(c+d*x)^2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^2*(c+d*x)^2, x) == :(1//3*a^2*d^-1*(c+d*x)^3+b^2*f^-1*(c+d*x)^2*tan(e+f*x)+-1*im*b^2*f^-1*(c+d*x)^2+-1*im*b^2*d^2*f^-3*Polylogarithms.polylog(2,-1*exp(2*im*(e+f*x)))+-4*a*b*d^2*f^-3*Polylogarithms.polylog(3,-1*im*exp(im*(e+f*x)))+2*d*b^2*f^-2*(c+d*x)*log(1+exp(2*im*(e+f*x)))+4*a*b*d^2*f^-3*Polylogarithms.polylog(3,im*exp(im*(e+f*x)))+-4*im*a*b*f^-1*(c+d*x)^2*arctan(exp(im*(e+f*x)))+-4*im*a*b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+4*im*a*b*d*f^-2*(c+d*x)*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^2*(c+d*x), x) == :((1/2)*a^2*d^-1*(c+d*x)^2+d*b^2*f^-2*log(cos(e+f*x))+b^2*f^-1*(c+d*x)*tan(e+f*x)+-4*im*a*b*f^-1*(c+d*x)*arctan(exp(im*(e+f*x)))+-2*im*a*b*d*f^-2*Polylogarithms.polylog(2,im*exp(im*(e+f*x)))+2*im*a*b*d*f^-2*Polylogarithms.polylog(2,-1*im*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-1*(c+d*x)^3, x) == :(1//4*a^-1*d^-1*(c+d*x)^4+-6*b*a^-1*d^3*f^-4*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(4,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+6*b*a^-1*d^3*f^-4*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(4,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+im*b*a^-1*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-1//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-1*im*b*a^-1*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-1//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-3*b*d*a^-1*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+3*b*d*a^-1*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*im*b*a^-1*d^2*f^-3*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+6*im*b*a^-1*d^2*f^-3*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-1*(c+d*x)^2, x) == :(1//3*a^-1*d^-1*(c+d*x)^3+im*b*a^-1*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-1//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-1*im*b*a^-1*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-1//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*b*a^-1*d^2*f^-3*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*b*d*a^-1*f^-2*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*im*b*a^-1*d^2*f^-3*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*b*d*a^-1*f^-2*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-1*(c+d*x), x) == :((1/2)*a^-1*d^-1*(c+d*x)^2+b*d*a^-1*f^-2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-1*b*d*a^-1*f^-2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+im*b*a^-1*f^-1*(b^2+-1*a^2)^-1//2*(c+d*x)*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-1*im*b*a^-1*f^-1*(b^2+-1*a^2)^-1//2*(c+d*x)*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-2*(c+d*x)^3, x) == :(1//4*a^-2*d^-1*(c+d*x)^4+-1*im*a^-2*b^2*f^-1*(c+d*x)^3*(a^2+-1*b^2)^-1+-12*b*a^-2*d^3*f^-4*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(4,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*a^-2*b^3*d^3*f^-4*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(4,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+6*a^-2*b^2*d^3*f^-4*(a^2+-1*b^2)^-1*Polylogarithms.polylog(3,-1*a*(b+im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+6*a^-2*b^2*d^3*f^-4*(a^2+-1*b^2)^-1*Polylogarithms.polylog(3,-1*a*(b+-1*im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+6*a^-2*b^3*d^3*f^-4*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(4,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+12*b*a^-2*d^3*f^-4*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(4,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+im*a^-2*b^3*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-3//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+a^-1*b^2*f^-1*(b+a*cos(e+f*x))^-1*(c+d*x)^3*(a^2+-1*b^2)^-1*sin(e+f*x)+-1*im*a^-2*b^3*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-3//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*b*d*a^-2*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-3*d*a^-2*b^3*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*b*a^-2*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-1//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*im*b*a^-2*f^-1*(c+d*x)^3*(b^2+-1*a^2)^-1//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+3*d*a^-2*b^2*f^-2*(c+d*x)^2*(a^2+-1*b^2)^-1*log(1+a*(b+im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+3*d*a^-2*b^2*f^-2*(c+d*x)^2*(a^2+-1*b^2)^-1*log(1+a*(b+-1*im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+3*d*a^-2*b^3*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+6*b*d*a^-2*f^-2*(c+d*x)^2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-12*im*b*a^-2*d^2*f^-3*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*im*a^-2*b^2*d^2*f^-3*(a^2+-1*b^2)^-1*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*im*a^-2*b^2*d^2*f^-3*(a^2+-1*b^2)^-1*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+-1*im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+-6*im*a^-2*b^3*d^2*f^-3*(b^2+-1*a^2)^-3//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+6*im*a^-2*b^3*d^2*f^-3*(b^2+-1*a^2)^-3//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+12*im*b*a^-2*d^2*f^-3*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-2*(c+d*x)^2, x) == :(1//3*a^-2*d^-1*(c+d*x)^3+-1*im*a^-2*b^2*f^-1*(c+d*x)^2*(a^2+-1*b^2)^-1+im*a^-2*b^3*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-3//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+a^-1*b^2*f^-1*(b+a*cos(e+f*x))^-1*(c+d*x)^2*(a^2+-1*b^2)^-1*sin(e+f*x)+-1*im*a^-2*b^3*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-3//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-4*im*b*a^-2*d^2*f^-3*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-4*b*d*a^-2*f^-2*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*b*a^-2*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-1//2*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*a^-2*b^2*d^2*f^-3*(a^2+-1*b^2)^-1*Polylogarithms.polylog(2,-1*a*(b+im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*a^-2*b^2*d^2*f^-3*(a^2+-1*b^2)^-1*Polylogarithms.polylog(2,-1*a*(b+-1*im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*a^-2*b^3*d^2*f^-3*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*d*a^-2*b^3*f^-2*(b^2+-1*a^2)^-3//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*im*b*a^-2*f^-1*(c+d*x)^2*(b^2+-1*a^2)^-1//2*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*im*a^-2*b^3*d^2*f^-3*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(3,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*d*a^-2*b^2*f^-2*(a^2+-1*b^2)^-1*(c+d*x)*log(1+a*(b+im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+2*d*a^-2*b^2*f^-2*(a^2+-1*b^2)^-1*(c+d*x)*log(1+a*(b+-1*im*(a^2+-1*b^2)^(1/2))^-1*exp(im*(e+f*x)))+2*d*a^-2*b^3*f^-2*(b^2+-1*a^2)^-3//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+4*im*b*a^-2*d^2*f^-3*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(3,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+4*b*d*a^-2*f^-2*(b^2+-1*a^2)^-1//2*(c+d*x)*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
@test integrate((a+b*sec(e+f*x))^-2*(c+d*x), x) == :((1/2)*a^-2*d^-1*(c+d*x)^2+d*a^-2*b^2*f^-2*(a^2+-1*b^2)^-1*log(b+a*cos(e+f*x))+d*a^-2*b^3*f^-2*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-1*d*a^-2*b^3*f^-2*(b^2+-1*a^2)^-3//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*b*d*a^-2*f^-2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*b*d*a^-2*f^-2*(b^2+-1*a^2)^-1//2*Polylogarithms.polylog(2,-1*a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+im*a^-2*b^3*f^-1*(b^2+-1*a^2)^-3//2*(c+d*x)*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+a^-1*b^2*f^-1*(b+a*cos(e+f*x))^-1*(a^2+-1*b^2)^-1*(c+d*x)*sin(e+f*x)+-1*im*a^-2*b^3*f^-1*(b^2+-1*a^2)^-3//2*(c+d*x)*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+-2*im*b*a^-2*f^-1*(b^2+-1*a^2)^-1//2*(c+d*x)*log(1+a*(b+(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x)))+2*im*b*a^-2*f^-1*(b^2+-1*a^2)^-1//2*(c+d*x)*log(1+a*(b+-1*(b^2+-1*a^2)^(1/2))^-1*exp(im*(e+f*x))))
