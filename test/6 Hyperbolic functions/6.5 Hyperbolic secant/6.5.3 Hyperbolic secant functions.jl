using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(sech(a+b*x), x) == :(b^-1*arctan(sinh(a+b*x)))
@test integrate(sech(a+b*x)^2, x) == :(b^-1*tanh(a+b*x))
@test integrate(sech(a+b*x)^3, x) == :((1/2)*b^-1*arctan(sinh(a+b*x))+(1/2)*b^-1*sech(a+b*x)*tanh(a+b*x))
@test integrate(sech(a+b*x)^4, x) == :(b^-1*tanh(a+b*x)+-1//3*b^-1*tanh(a+b*x)^3)
@test integrate(sech(a+b*x)^5, x) == :(3//8*b^-1*arctan(sinh(a+b*x))+1//4*b^-1*sech(a+b*x)^3*tanh(a+b*x)+3//8*b^-1*sech(a+b*x)*tanh(a+b*x))
@test integrate(sech(a+b*x)^6, x) == :(b^-1*tanh(a+b*x)+-2//3*b^-1*tanh(a+b*x)^3+1//5*b^-1*tanh(a+b*x)^5)
@test integrate(sech(7x)^4, x) == :(-1//21*tanh(7x)^3+1//7*tanh(7x))
@test integrate(sech(pi*x)^6, x) == :(pi^-1*tanh(pi*x)+-2//3*pi^-1*tanh(pi*x)^3+1//5*pi^-1*tanh(pi*x)^5)
@test integrate(sech(a+b*x)^5//2, x) == :(2//3*b^-1*sech(a+b*x)^3//2*sinh(a+b*x)+-2//3*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.F((1/2)*im*(a+b*x),2))
@test integrate(sech(a+b*x)^3//2, x) == :(2*b^-1*sech(a+b*x)^(1/2)*sinh(a+b*x)+2*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.E((1/2)*im*(a+b*x),2))
@test integrate(sech(a+b*x)^(1/2), x) == :(-2*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.F((1/2)*im*(a+b*x),2))
@test integrate(sech(a+b*x)^-1//2, x) == :(-2*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.E((1/2)*im*(a+b*x),2))
@test integrate(sech(a+b*x)^-3//2, x) == :(2//3*b^-1*sech(a+b*x)^-1//2*sinh(a+b*x)+-2//3*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.F((1/2)*im*(a+b*x),2))
@test integrate(sech(a+b*x)^-5//2, x) == :(2//5*b^-1*sech(a+b*x)^-3//2*sinh(a+b*x)+-6//5*im*b^-1*cosh(a+b*x)^(1/2)*sech(a+b*x)^(1/2)*Elliptic.E((1/2)*im*(a+b*x),2))
@test integrate((b*sech(c+d*x))^7//2, x) == :(2//5*b*d^-1*(b*sech(c+d*x))^5//2*sinh(c+d*x)+6//5*b^3*d^-1*(b*sech(c+d*x))^(1/2)*sinh(c+d*x)+6//5*im*b^4*d^-1*(b*sech(c+d*x))^-1//2*cosh(c+d*x)^-1//2*Elliptic.E((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^5//2, x) == :(2//3*b*d^-1*(b*sech(c+d*x))^3//2*sinh(c+d*x)+-2//3*im*b^2*d^-1*(b*sech(c+d*x))^(1/2)*cosh(c+d*x)^(1/2)*Elliptic.F((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^3//2, x) == :(2*b*d^-1*(b*sech(c+d*x))^(1/2)*sinh(c+d*x)+2*im*b^2*d^-1*(b*sech(c+d*x))^-1//2*cosh(c+d*x)^-1//2*Elliptic.E((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^(1/2), x) == :(-2*im*d^-1*(b*sech(c+d*x))^(1/2)*cosh(c+d*x)^(1/2)*Elliptic.F((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^-1//2, x) == :(-2*im*d^-1*(b*sech(c+d*x))^-1//2*cosh(c+d*x)^-1//2*Elliptic.E((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^-3//2, x) == :(2//3*b^-1*d^-1*(b*sech(c+d*x))^-1//2*sinh(c+d*x)+-2//3*im*b^-2*d^-1*(b*sech(c+d*x))^(1/2)*cosh(c+d*x)^(1/2)*Elliptic.F((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^-5//2, x) == :(2//5*b^-1*d^-1*(b*sech(c+d*x))^-3//2*sinh(c+d*x)+-6//5*im*b^-2*d^-1*(b*sech(c+d*x))^-1//2*cosh(c+d*x)^-1//2*Elliptic.E((1/2)*im*(c+d*x),2))
@test integrate((b*sech(c+d*x))^-7//2, x) == :(2//7*b^-1*d^-1*(b*sech(c+d*x))^-5//2*sinh(c+d*x)+10//21*b^-3*d^-1*(b*sech(c+d*x))^-1//2*sinh(c+d*x)+-10//21*im*b^-4*d^-1*(b*sech(c+d*x))^(1/2)*cosh(c+d*x)^(1/2)*Elliptic.F((1/2)*im*(c+d*x),2))
@test integrate((sech(a+b*x)^2)^7//2, x) == :(5//16*b^-1*arcsin(tanh(a+b*x))+1//6*b^-1*(sech(a+b*x)^2)^5//2*tanh(a+b*x)+5//16*b^-1*(sech(a+b*x)^2)^(1/2)*tanh(a+b*x)+5//24*b^-1*(sech(a+b*x)^2)^3//2*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^5//2, x) == :(3//8*b^-1*arcsin(tanh(a+b*x))+1//4*b^-1*(sech(a+b*x)^2)^3//2*tanh(a+b*x)+3//8*b^-1*(sech(a+b*x)^2)^(1/2)*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^3//2, x) == :((1/2)*b^-1*arcsin(tanh(a+b*x))+(1/2)*b^-1*(sech(a+b*x)^2)^(1/2)*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^(1/2), x) == :(b^-1*arcsin(tanh(a+b*x)))
@test integrate((sech(a+b*x)^2)^-1//2, x) == :(b^-1*(sech(a+b*x)^2)^-1//2*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^-3//2, x) == :(1//3*b^-1*(sech(a+b*x)^2)^-3//2*tanh(a+b*x)+2//3*b^-1*(sech(a+b*x)^2)^-1//2*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^-5//2, x) == :(1//5*b^-1*(sech(a+b*x)^2)^-5//2*tanh(a+b*x)+4//15*b^-1*(sech(a+b*x)^2)^-3//2*tanh(a+b*x)+8//15*b^-1*(sech(a+b*x)^2)^-1//2*tanh(a+b*x))
@test integrate((sech(a+b*x)^2)^-7//2, x) == :(1//7*b^-1*(sech(a+b*x)^2)^-7//2*tanh(a+b*x)+6//35*b^-1*(sech(a+b*x)^2)^-5//2*tanh(a+b*x)+8//35*b^-1*(sech(a+b*x)^2)^-3//2*tanh(a+b*x)+16//35*b^-1*(sech(a+b*x)^2)^-1//2*tanh(a+b*x))
@test integrate((a*sech(x)^2)^5//2, x) == :(3//8*a^5//2*arctan(a^(1/2)*(a*sech(x)^2)^-1//2*tanh(x))+1//4*a*(a*sech(x)^2)^3//2*tanh(x)+3//8*a^2*(a*sech(x)^2)^(1/2)*tanh(x))
@test integrate((a*sech(x)^2)^3//2, x) == :((1/2)*a^3//2*arctan(a^(1/2)*(a*sech(x)^2)^-1//2*tanh(x))+(1/2)*a*(a*sech(x)^2)^(1/2)*tanh(x))
@test integrate((a*sech(x)^2)^(1/2), x) == :(a^(1/2)*arctan(a^(1/2)*(a*sech(x)^2)^-1//2*tanh(x)))
@test integrate((a*sech(x)^2)^-1//2, x) == :((a*sech(x)^2)^-1//2*tanh(x))
@test integrate((a*sech(x)^2)^-3//2, x) == :(1//3*(a*sech(x)^2)^-3//2*tanh(x)+2//3*a^-1*(a*sech(x)^2)^-1//2*tanh(x))
@test integrate((a*sech(x)^2)^-5//2, x) == :(1//5*(a*sech(x)^2)^-5//2*tanh(x)+4//15*a^-1*(a*sech(x)^2)^-3//2*tanh(x)+8//15*a^-2*(a*sech(x)^2)^-1//2*tanh(x))
@test integrate((a*sech(x)^2)^-7//2, x) == :(1//7*(a*sech(x)^2)^-7//2*tanh(x)+6//35*a^-1*(a*sech(x)^2)^-5//2*tanh(x)+8//35*a^-2*(a*sech(x)^2)^-3//2*tanh(x)+16//35*a^-3*(a*sech(x)^2)^-1//2*tanh(x))
@test integrate((a*sech(x)^3)^5//2, x) == :(154//585*a^2*(a*sech(x)^3)^(1/2)*tanh(x)+2//13*a^2*(a*sech(x)^3)^(1/2)*sech(x)^4*tanh(x)+22//117*a^2*(a*sech(x)^3)^(1/2)*sech(x)^2*tanh(x)+154//195*a^2*(a*sech(x)^3)^(1/2)*cosh(x)*sinh(x)+154//195*im*a^2*(a*sech(x)^3)^(1/2)*cosh(x)^3//2*Elliptic.E((1/2)*im*x,2))
@test integrate((a*sech(x)^3)^3//2, x) == :(10//21*a*(a*sech(x)^3)^(1/2)*sinh(x)+2//7*a*(a*sech(x)^3)^(1/2)*sech(x)*tanh(x)+-10//21*im*a*(a*sech(x)^3)^(1/2)*cosh(x)^3//2*Elliptic.F((1/2)*im*x,2))
@test integrate((a*sech(x)^3)^(1/2), x) == :(2*(a*sech(x)^3)^(1/2)*cosh(x)*sinh(x)+2*im*(a*sech(x)^3)^(1/2)*cosh(x)^3//2*Elliptic.E((1/2)*im*x,2))
@test integrate((a*sech(x)^3)^-1//2, x) == :(2//3*(a*sech(x)^3)^-1//2*tanh(x)+-2//3*im*(a*sech(x)^3)^-1//2*cosh(x)^-3//2*Elliptic.F((1/2)*im*x,2))
@test integrate((a*sech(x)^3)^-3//2, x) == :(14//45*a^-1*(a*sech(x)^3)^-1//2*sinh(x)+2//9*a^-1*(a*sech(x)^3)^-1//2*cosh(x)^2*sinh(x)+-14//15*im*a^-1*(a*sech(x)^3)^-1//2*cosh(x)^-3//2*Elliptic.E((1/2)*im*x,2))
@test integrate((a*sech(x)^3)^-5//2, x) == :(26//77*a^-2*(a*sech(x)^3)^-1//2*tanh(x)+2//15*a^-2*(a*sech(x)^3)^-1//2*cosh(x)^5*sinh(x)+26//165*a^-2*(a*sech(x)^3)^-1//2*cosh(x)^3*sinh(x)+78//385*a^-2*(a*sech(x)^3)^-1//2*cosh(x)*sinh(x)+-26//77*im*a^-2*(a*sech(x)^3)^-1//2*cosh(x)^-3//2*Elliptic.F((1/2)*im*x,2))
@test integrate((a*sech(x)^4)^7//2, x) == :(a^3*(a*sech(x)^4)^(1/2)*cosh(x)*sinh(x)+-2*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)+3*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^3+-20//7*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^5+-6//11*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^9+1//13*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^11+5//3*a^3*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^7)
@test integrate((a*sech(x)^4)^5//2, x) == :(a^2*(a*sech(x)^4)^(1/2)*cosh(x)*sinh(x)+-4//3*a^2*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)+-4//7*a^2*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^5+1//9*a^2*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^7+6//5*a^2*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^3)
@test integrate((a*sech(x)^4)^3//2, x) == :(a*(a*sech(x)^4)^(1/2)*cosh(x)*sinh(x)+-2//3*a*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)+1//5*a*(a*sech(x)^4)^(1/2)*sinh(x)^2*tanh(x)^3)
@test integrate((a*sech(x)^4)^(1/2), x) == :((a*sech(x)^4)^(1/2)*cosh(x)*sinh(x))
@test integrate((a*sech(x)^4)^-1//2, x) == :((1/2)*(a*sech(x)^4)^-1//2*tanh(x)+(1/2)*x*(a*sech(x)^4)^-1//2*sech(x)^2)
@test integrate((a*sech(x)^4)^-3//2, x) == :(5//16*a^-1*(a*sech(x)^4)^-1//2*tanh(x)+1//6*a^-1*(a*sech(x)^4)^-1//2*cosh(x)^3*sinh(x)+5//16*x*a^-1*(a*sech(x)^4)^-1//2*sech(x)^2+5//24*a^-1*(a*sech(x)^4)^-1//2*cosh(x)*sinh(x))
@test integrate((a*sech(x)^4)^-5//2, x) == :(63//256*a^-2*(a*sech(x)^4)^-1//2*tanh(x)+1//10*a^-2*(a*sech(x)^4)^-1//2*cosh(x)^7*sinh(x)+9//80*a^-2*(a*sech(x)^4)^-1//2*cosh(x)^5*sinh(x)+21//128*a^-2*(a*sech(x)^4)^-1//2*cosh(x)*sinh(x)+21//160*a^-2*(a*sech(x)^4)^-1//2*cosh(x)^3*sinh(x)+63//256*x*a^-2*(a*sech(x)^4)^-1//2*sech(x)^2)
@test integrate((a+a*sech(x))^-1*sinh(x)^4, x) == :(-1//3*a^-1*sinh(x)^3+-1//8*x*a^-1+-1//8*a^-1*cosh(x)*sinh(x)+1//4*a^-1*cosh(x)^3*sinh(x))
@test integrate((a+a*sech(x))^-1*sinh(x)^3, x) == :(-1//2*a^-1*sinh(x)^2+1//3*a^-1*cosh(x)^3)
@test integrate((a+a*sech(x))^-1*sinh(x)^2, x) == :((1/2)*x*a^-1+-1*a^-1*sinh(x)+(1/2)*a^-1*cosh(x)*sinh(x))
@test integrate((a+a*sech(x))^-1*sinh(x), x) == :(a^-1*cosh(x)+-1*a^-1*log(1+cosh(x)))
@test integrate((a+a*sech(x))^-1*csch(x), x) == :((1/2)*a^-1*csch(x)^2+-1//2*a^-1*arctanh(cosh(x))+-1//2*a^-1*coth(x)*csch(x))
@test integrate((a+a*sech(x))^-1*csch(x)^2, x) == :(-1//3*a^-1*coth(x)^3+1//3*a^-1*csch(x)^3)
@test integrate((a+a*sech(x))^-1*csch(x)^3, x) == :(1//4*a^-1*csch(x)^4+1//8*a^-1*arctanh(cosh(x))+-1//4*a^-1*csch(x)^3*coth(x)+-1//8*a^-1*coth(x)*csch(x))
@test integrate((a+a*sech(x))^-1*csch(x)^4, x) == :(-1//5*a^-1*coth(x)^5+1//3*a^-1*coth(x)^3+1//5*a^-1*csch(x)^5)
@test integrate((a+b*sech(x))^-1*sinh(x)^4, x) == :(-1//12*a^-2*sinh(x)^3*(4b+-3*a*cosh(x))+1//8*x*a^-5*(3*a^4+8*b^4+-12*a^2*b^2)+1//8*a^-4*(8*b*(a^2+-1*b^2)+-1*a*(-4*b^2+3*a^2)*cosh(x))*sinh(x)+-2*b*a^-5*(a+b)^3//2*(a+-1b)^3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sinh(x)^3, x) == :(1//3*a^-1*cosh(x)^3+-1*a^-3*(a^2+-1*b^2)*cosh(x)+-1//2*b*a^-2*cosh(x)^2+b*a^-4*(a^2+-1*b^2)*log(b+a*cosh(x)))
@test integrate((a+b*sech(x))^-1*sinh(x)^2, x) == :(-1//2*x*a^-3*(a^2+-2*b^2)+-1//2*a^-2*(2b+-1*a*cosh(x))*sinh(x)+2*b*a^-3*(a+b)^(1/2)*(a+-1b)^(1/2)*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sinh(x), x) == :(a^-1*cosh(x)+-1*b*a^-2*log(b+a*cosh(x)))
@test integrate((a+b*sech(x))^-1*csch(x), x) == :((2a+2b)^-1*log(1+-1*cosh(x))+-1*(-2b+2a)^-1*log(1+cosh(x))+b*(a^2+-1*b^2)^-1*log(b+a*cosh(x)))
@test integrate((a+b*sech(x))^-1*csch(x)^2, x) == :((a^2+-1*b^2)^-1*(b+-1*a*cosh(x))*csch(x)+2*a*b*(a+b)^-3//2*(a+-1b)^-3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*csch(x)^3, x) == :((-2*b^2+2*a^2)^-1*csch(x)^2*(b+-1*a*cosh(x))+-1//4*a*(a+b)^-2*log(1+-1*cosh(x))+1//4*a*(a+-1b)^-2*log(1+cosh(x))+-1*b*a^2*(a^2+-1*b^2)^-2*log(b+a*cosh(x)))
@test integrate((a+b*sech(x))^-1*csch(x)^4, x) == :((-3*b^2+3*a^2)^-1*csch(x)^3*(b+-1*a*cosh(x))+-1//3*(a^2+-1*b^2)^-2*(3*b*a^2+-1*a*(b^2+2*a^2)*cosh(x))*csch(x)+-2*b*a^3*(a+b)^-5//2*(a+-1b)^-5//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+a*sech(x))^-1*cosh(x)^4, x) == :(-4*a^-1*sinh(x)+-4//3*a^-1*sinh(x)^3+15//8*x*a^-1+-1*(a+a*sech(x))^-1*cosh(x)^3*sinh(x)+5//4*a^-1*cosh(x)^3*sinh(x)+15//8*a^-1*cosh(x)*sinh(x))
@test integrate((a+a*sech(x))^-1*cosh(x)^3, x) == :(4*a^-1*sinh(x)+-3//2*x*a^-1+4//3*a^-1*sinh(x)^3+-1*(a+a*sech(x))^-1*cosh(x)^2*sinh(x)+-3//2*a^-1*cosh(x)*sinh(x))
@test integrate((a+a*sech(x))^-1*cosh(x)^2, x) == :(-2*a^-1*sinh(x)+3//2*x*a^-1+-1*(a+a*sech(x))^-1*cosh(x)*sinh(x)+3//2*a^-1*cosh(x)*sinh(x))
@test integrate((a+a*sech(x))^-1*cosh(x), x) == :(-1*x*a^-1+-1*(a+a*sech(x))^-1*sinh(x)+2*a^-1*sinh(x))
@test integrate((a+a*sech(x))^-1*sech(x), x) == :((a+a*sech(x))^-1*tanh(x))
@test integrate((a+a*sech(x))^-1*sech(x)^2, x) == :(a^-1*arctan(sinh(x))+-1*(a+a*sech(x))^-1*tanh(x))
@test integrate((a+a*sech(x))^-1*sech(x)^3, x) == :(a^-1*tanh(x)+(a+a*sech(x))^-1*tanh(x)+-1*a^-1*arctan(sinh(x)))
@test integrate((a+a*sech(x))^-1*sech(x)^4, x) == :(-2*a^-1*tanh(x)+3//2*a^-1*arctan(sinh(x))+-1*(a+a*sech(x))^-1*sech(x)^2*tanh(x)+3//2*a^-1*sech(x)*tanh(x))
@test integrate((a+a*sech(c+d*x))^-1, x) == :(x*a^-1+-1*d^-1*(a+a*sech(c+d*x))^-1*tanh(c+d*x))
@test integrate((a+-1*a*sech(c+d*x))^-1, x) == :(x*a^-1+-1*d^-1*(a+-1*a*sech(c+d*x))^-1*tanh(c+d*x))
@test integrate((a+a*sech(c+d*x))^5//2, x) == :(2*a^5//2*d^-1*arctanh(a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))+2//3*a^2*d^-1*(a+a*sech(c+d*x))^(1/2)*tanh(c+d*x)+14//3*a^3*d^-1*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))
@test integrate((a+a*sech(c+d*x))^3//2, x) == :(2*a^3//2*d^-1*arctanh(a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))+2*a^2*d^-1*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))
@test integrate((a+a*sech(c+d*x))^(1/2), x) == :(2*a^(1/2)*d^-1*arctanh(a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x)))
@test integrate((a+a*sech(c+d*x))^-1//2, x) == :(2*a^-1//2*d^-1*arctanh(a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))+-1*2^(1/2)*a^-1//2*d^-1*arctanh((1/2)*2^(1/2)*a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x)))
@test integrate((a+a*sech(c+d*x))^-3//2, x) == :(2*a^-3//2*d^-1*arctanh(a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x))+-1//2*d^-1*(a+a*sech(c+d*x))^-3//2*tanh(c+d*x)+-5//4*2^(1/2)*a^-3//2*d^-1*arctanh((1/2)*2^(1/2)*a^(1/2)*(a+a*sech(c+d*x))^-1//2*tanh(c+d*x)))
@test integrate((a+-1*a*sech(c+d*x))^(1/2), x) == :(2*a^(1/2)*d^-1*arctanh(a^(1/2)*(a+-1*a*sech(c+d*x))^-1//2*tanh(c+d*x)))
@test integrate((a+-1*a*sech(c+d*x))^-1//2, x) == :(2*a^-1//2*d^-1*arctanh(a^(1/2)*(a+-1*a*sech(c+d*x))^-1//2*tanh(c+d*x))+-1*2^(1/2)*a^-1//2*d^-1*arctanh((1/2)*2^(1/2)*a^(1/2)*(a+-1*a*sech(c+d*x))^-1//2*tanh(c+d*x)))
@test integrate((3+3*sech(x))^(1/2), x) == :(2*3^(1/2)*arctanh((1+sech(x))^-1//2*tanh(x)))
@test integrate((3+-3*sech(x))^(1/2), x) == :(2*3^(1/2)*arctanh((1+-1*sech(x))^-1//2*tanh(x)))
@test integrate((a+b*sech(c+d*x))^4, x) == :(x*a^4+1//3*b^2*d^-1*(a+b*sech(c+d*x))^2*tanh(c+d*x)+1//3*b^2*d^-1*(2*b^2+17*a^2)*tanh(c+d*x)+2*a*b*d^-1*(b^2+2*a^2)*arctan(sinh(c+d*x))+4//3*a*b^3*d^-1*sech(c+d*x)*tanh(c+d*x))
@test integrate((a+b*sech(c+d*x))^3, x) == :(x*a^3+(1/2)*b*d^-1*(b^2+6*a^2)*arctan(sinh(c+d*x))+(1/2)*b^2*d^-1*(a+b*sech(c+d*x))*tanh(c+d*x)+5//2*a*b^2*d^-1*tanh(c+d*x))
@test integrate((a+b*sech(c+d*x))^2, x) == :(x*a^2+b^2*d^-1*tanh(c+d*x)+2*a*b*d^-1*arctan(sinh(c+d*x)))
@test integrate(a+b*sech(c+d*x), x) == :(a*x+b*d^-1*arctan(sinh(c+d*x)))
@test integrate((a+b*sech(c+d*x))^-1, x) == :(x*a^-1+-2*b*a^-1*d^-1*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*c+(1/2)*d*x)))
@test integrate((a+b*sech(c+d*x))^-2, x) == :(x*a^-2+a^-1*b^2*d^-1*(a+b*sech(c+d*x))^-1*(a^2+-1*b^2)^-1*tanh(c+d*x)+-2*b*a^-2*d^-1*(a+b)^-3//2*(a+-1b)^-3//2*(-1*b^2+2*a^2)*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*c+(1/2)*d*x)))
@test integrate((a+b*sech(c+d*x))^-3, x) == :(x*a^-3+(1/2)*a^-1*b^2*d^-1*(a+b*sech(c+d*x))^-2*(a^2+-1*b^2)^-1*tanh(c+d*x)+(1/2)*a^-2*b^2*d^-1*(a+b*sech(c+d*x))^-1*(a^2+-1*b^2)^-2*(-2*b^2+5*a^2)*tanh(c+d*x)+-1*b*a^-3*d^-1*(a+b)^-5//2*(a+-1b)^-5//2*(2*b^4+6*a^4+-5*a^2*b^2)*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*c+(1/2)*d*x)))
@test integrate((a+b*sech(x))^-1*cosh(x)^4, x) == :(1//4*a^-1*cosh(x)^3*sinh(x)+1//8*x*a^-5*(3*a^4+8*b^4+4*a^2*b^2)+-1//3*b*a^-4*(2*a^2+3*b^2)*sinh(x)+-1//3*b*a^-2*cosh(x)^2*sinh(x)+1//8*a^-3*(3*a^2+4*b^2)*cosh(x)*sinh(x)+-2*a^-5*b^5*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*cosh(x)^3, x) == :(1//3*a^-1*cosh(x)^2*sinh(x)+1//3*a^-3*(2*a^2+3*b^2)*sinh(x)+-1//2*b*x*a^-4*(a^2+2*b^2)+-1//2*b*a^-2*cosh(x)*sinh(x)+2*a^-4*b^4*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*cosh(x)^2, x) == :((1/2)*x*a^-3*(a^2+2*b^2)+(1/2)*a^-1*cosh(x)*sinh(x)+-1*b*a^-2*sinh(x)+-2*a^-3*b^3*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*cosh(x), x) == :(a^-1*sinh(x)+-1*b*x*a^-2+2*a^-2*b^2*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sech(x), x) == :(2*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sech(x)^2, x) == :(b^-1*arctan(sinh(x))+-2*a*b^-1*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sech(x)^3, x) == :(b^-1*tanh(x)+-1*a*b^-2*arctan(sinh(x))+2*a^2*b^-2*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*sech(x)^4, x) == :((1/2)*b^-1*sech(x)*tanh(x)+(1/2)*b^-3*(b^2+2*a^2)*arctan(sinh(x))+-1*a*b^-2*tanh(x)+-2*a^3*b^-3*(a+b)^-1//2*(a+-1b)^-1//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+a*sech(x))^-1*tanh(x)^6, x) == :(x*a^-1+-3//8*a^-1*arctan(sinh(x))+-1//8*a^-1*(8+-3*sech(x))*tanh(x)+-1//12*a^-1*tanh(x)^3*(4+-3*sech(x)))
@test integrate((a+a*sech(x))^-1*tanh(x)^5, x) == :(a^-1*log(cosh(x))+a^-1*sech(x)+(1/2)*a^-1*sech(x)^2+-1//3*a^-1*sech(x)^3)
@test integrate((a+a*sech(x))^-1*tanh(x)^4, x) == :(x*a^-1+-1//2*a^-1*arctan(sinh(x))+-1//2*a^-1*(2+-1*sech(x))*tanh(x))
@test integrate((a+a*sech(x))^-1*tanh(x)^3, x) == :(a^-1*log(cosh(x))+a^-1*sech(x))
@test integrate((a+a*sech(x))^-1*tanh(x)^2, x) == :(x*a^-1+-1*a^-1*arctan(sinh(x)))
@test integrate((a+a*sech(x))^-1*tanh(x), x) == :(a^-1*log(1+cosh(x)))
@test integrate((a+a*sech(x))^-1*coth(x), x) == :((1/2)*a^-1*(1+cosh(x))^-1+1//4*a^-1*log(1+-1*cosh(x))+3//4*a^-1*log(1+cosh(x)))
@test integrate((a+a*sech(x))^-1*coth(x)^2, x) == :(x*a^-1+-1//3*a^-1*coth(x)^3*(1+-1*sech(x))+-1//3*a^-1*(3+-2*sech(x))*coth(x))
@test integrate((a+a*sech(x))^-1*coth(x)^3, x) == :(-1//8*a^-1*(1+cosh(x))^-2+1//8*a^-1*(1+-1*cosh(x))^-1+3//4*a^-1*(1+cosh(x))^-1+5//16*a^-1*log(1+-1*cosh(x))+11//16*a^-1*log(1+cosh(x)))
@test integrate((a+a*sech(x))^-1*coth(x)^4, x) == :(x*a^-1+-1//5*a^-1*coth(x)^5*(1+-1*sech(x))+-1//15*a^-1*coth(x)^3*(5+-4*sech(x))+-1//15*a^-1*(15+-8*sech(x))*coth(x))
@test integrate((a+b*sech(x))^-1*tanh(x)^7, x) == :(a^-1*log(cosh(x))+1//5*b^-1*sech(x)^5+b^-5*(a^4+3*b^4+-3*a^2*b^2)*sech(x)+-1//4*a*b^-2*sech(x)^4+1//3*b^-3*sech(x)^3*(a^2+-3*b^2)+-1*a^-1*b^-6*(a^2+-1*b^2)^3*log(a+b*sech(x))+-1//2*a*b^-4*sech(x)^2*(a^2+-3*b^2))
@test integrate((a+b*sech(x))^-1*tanh(x)^6, x) == :(x*a^-1+-3//8*b^-1*arctan(sinh(x))+a*b^-2*tanh(x)+-1*b^-5*(a^4+3*b^4+-3*a^2*b^2)*arctan(sinh(x))+-3//8*b^-1*sech(x)*tanh(x)+-1//2*b^-3*(a^2+-3*b^2)*arctan(sinh(x))+-1//3*a*b^-2*tanh(x)^3+-1//4*b^-1*sech(x)^3*tanh(x)+a*b^-4*(a^2+-3*b^2)*tanh(x)+-1//2*b^-3*(a^2+-3*b^2)*sech(x)*tanh(x)+2*a^-1*b^-5*(a+b)^5//2*(a+-1b)^5//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*tanh(x)^5, x) == :(a^-1*log(cosh(x))+-1//3*b^-1*sech(x)^3+(1/2)*a*b^-2*sech(x)^2+-1*b^-3*(a^2+-2*b^2)*sech(x)+a^-1*b^-4*(a^2+-1*b^2)^2*log(a+b*sech(x)))
@test integrate((a+b*sech(x))^-1*tanh(x)^4, x) == :(x*a^-1+(1/2)*b^-1*sech(x)*tanh(x)+(1/2)*b^-3*(-3*b^2+2*a^2)*arctan(sinh(x))+-1*a*b^-2*tanh(x)+-2*a^-1*b^-3*(a+b)^3//2*(a+-1b)^3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*tanh(x)^3, x) == :(a^-1*log(cosh(x))+b^-1*sech(x)+a^-1*(1+-1*a^2*b^-2)*log(a+b*sech(x)))
@test integrate((a+b*sech(x))^-1*tanh(x)^2, x) == :(x*a^-1+-1*b^-1*arctan(sinh(x))+2*a^-1*b^-1*(a+b)^(1/2)*(a+-1b)^(1/2)*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*tanh(x), x) == :(a^-1*log(a+b*sech(x))+a^-1*log(cosh(x)))
@test integrate((a+b*sech(x))^-1*coth(x), x) == :(a^-1*log(cosh(x))+(-2b+2a)^-1*log(1+sech(x))+(2a+2b)^-1*log(1+-1*sech(x))+-1*a^-1*b^2*(a^2+-1*b^2)^-1*log(a+b*sech(x)))
@test integrate((a+b*sech(x))^-1*coth(x)^2, x) == :(a*x*(a^2+-1*b^2)^-1+b*(a^2+-1*b^2)^-1*csch(x)+-1*a*(a^2+-1*b^2)^-1*coth(x)+-1*x*a^-1*b^2*(a^2+-1*b^2)^-1+2*a^-1*b^3*(a+b)^-3//2*(a+-1b)^-3//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*coth(x)^3, x) == :(a^-1*log(cosh(x))+-1*(1+-1*sech(x))^-1*(4a+4b)^-1+-1*(1+sech(x))^-1*(-4b+4a)^-1+1//4*(a+b)^-2*(2a+3b)*log(1+-1*sech(x))+1//4*(a+-1b)^-2*(-3b+2a)*log(1+sech(x))+a^-1*b^4*(a^2+-1*b^2)^-2*log(a+b*sech(x)))
@test integrate((a+b*sech(x))^-1*coth(x)^4, x) == :(a*x*(a^2+-1*b^2)^-1+b*(a^2+-1*b^2)^-1*csch(x)+b*(-3*b^2+3*a^2)^-1*csch(x)^3+-1*a*(a^2+-1*b^2)^-1*coth(x)+-1*a*(-3*b^2+3*a^2)^-1*coth(x)^3+-1*b^3*(a^2+-1*b^2)^-2*csch(x)+a*b^2*(a^2+-1*b^2)^-2*coth(x)+x*a^-1*b^4*(a^2+-1*b^2)^-2+-1*a*x*b^2*(a^2+-1*b^2)^-2+-2*a^-1*b^5*(a+b)^-5//2*(a+-1b)^-5//2*arctan((a+b)^-1//2*(a+-1b)^(1/2)*tanh((1/2)*x)))
@test integrate((a+b*sech(x))^-1*coth(x)^5, x) == :(a^-1*log(cosh(x))+-1*(1+-1*sech(x))^-2*(16a+16b)^-1+-1*(1+sech(x))^-2*(-16b+16a)^-1+-1//16*(1+-1*sech(x))^-1*(a+b)^-2*(5a+7b)+-1//16*(1+sech(x))^-1*(a+-1b)^-2*(-7b+5a)+1//16*(a+b)^-3*(8*a^2+15*b^2+21*a*b)*log(1+-1*sech(x))+1//16*(a+-1b)^-3*(8*a^2+15*b^2+-21*a*b)*log(1+sech(x))+-1*a^-1*b^6*(a^2+-1*b^2)^-3*log(a+b*sech(x)))
@test integrate((a+b*sech(c+d*x))^(1/2)*tanh(c+d*x)^5, x) == :(-2*d^-1*(a+b*sech(c+d*x))^(1/2)+2*a^(1/2)*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-2//9*b^-4*d^-1*(a+b*sech(c+d*x))^9//2+-1//5*b^-4*d^-1*(a+b*sech(c+d*x))^5//2*(-4*b^2+6*a^2)+6//7*a*b^-4*d^-1*(a+b*sech(c+d*x))^7//2+2//3*a*b^-4*d^-1*(a+b*sech(c+d*x))^3//2*(a^2+-2*b^2))
@test integrate((a+b*sech(c+d*x))^(1/2)*tanh(c+d*x)^3, x) == :(-2*d^-1*(a+b*sech(c+d*x))^(1/2)+2*a^(1/2)*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+2//5*b^-2*d^-1*(a+b*sech(c+d*x))^5//2+-2//3*a*b^-2*d^-1*(a+b*sech(c+d*x))^3//2)
@test integrate((a+b*sech(c+d*x))^(1/2)*tanh(c+d*x), x) == :(-2*d^-1*(a+b*sech(c+d*x))^(1/2)+2*a^(1/2)*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^(1/2)*coth(c+d*x), x) == :(-1*d^-1*(a+b)^(1/2)*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*d^-1*(a+-1b)^(1/2)*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+2*a^(1/2)*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^(1/2)*coth(c+d*x)^3, x) == :(2*a^(1/2)*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-1//2*d^-1*(a+b*sech(c+d*x))^(1/2)*coth(c+d*x)^2+-1*a*d^-1*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*a*d^-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-3//4*b*d^-1*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+3//4*b*d^-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^-1//2*tanh(c+d*x)^5, x) == :(2*a^-1//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-2//7*b^-4*d^-1*(a+b*sech(c+d*x))^7//2+-1//3*b^-4*d^-1*(a+b*sech(c+d*x))^3//2*(-4*b^2+6*a^2)+6//5*a*b^-4*d^-1*(a+b*sech(c+d*x))^5//2+2*a*b^-4*d^-1*(a+b*sech(c+d*x))^(1/2)*(a^2+-2*b^2))
@test integrate((a+b*sech(c+d*x))^-1//2*tanh(c+d*x)^3, x) == :(2*a^-1//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+2//3*b^-2*d^-1*(a+b*sech(c+d*x))^3//2+-2*a*b^-2*d^-1*(a+b*sech(c+d*x))^(1/2))
@test integrate((a+b*sech(c+d*x))^-1//2*tanh(c+d*x), x) == :(2*a^-1//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^-1//2*coth(c+d*x), x) == :(-1*d^-1*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*d^-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+2*a^-1//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^-1//2*coth(c+d*x)^3, x) == :(-1*d^-1*(a+b)^-1//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*d^-1*(a+-1b)^-1//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+2*a^-1//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*d^-1*(1+-1*sech(c+d*x))^-1*(a+b*sech(c+d*x))^(1/2)*(4a+4b)^-1+-1*d^-1*(1+sech(c+d*x))^-1*(a+b*sech(c+d*x))^(1/2)*(-4b+4a)^-1+-1//4*b*d^-1*(a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+1//4*b*d^-1*(a+-1b)^-3//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^-3//2*tanh(c+d*x)^5, x) == :(2*a^-3//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-2//5*b^-4*d^-1*(a+b*sech(c+d*x))^5//2+-1*b^-4*d^-1*(a+b*sech(c+d*x))^(1/2)*(-4*b^2+6*a^2)+2*a*b^-4*d^-1*(a+b*sech(c+d*x))^3//2+-2*a^-1*b^-4*d^-1*(a+b*sech(c+d*x))^-1//2*(a^2+-1*b^2)^2)
@test integrate((a+b*sech(c+d*x))^-3//2*tanh(c+d*x)^3, x) == :(2*a^-3//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+2*b^-2*d^-1*(a+b*sech(c+d*x))^(1/2)+a^-1*b^-2*d^-1*(a+b*sech(c+d*x))^-1//2*(-2*b^2+2*a^2))
@test integrate((a+b*sech(c+d*x))^-3//2*tanh(c+d*x), x) == :(-2*a^-1*d^-1*(a+b*sech(c+d*x))^-1//2+2*a^-3//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2)))
@test integrate((a+b*sech(c+d*x))^-3//2*coth(c+d*x), x) == :(-1*d^-1*(a+b)^-3//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1*d^-1*(a+-1b)^-3//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+2*a^-3//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+2*a^-1*b^2*d^-1*(a+b*sech(c+d*x))^-1//2*(a^2+-1*b^2)^-1)
@test integrate((a+b*sech(c+d*x))^-3//2*coth(c+d*x)^3, x) == :(2*a^-3//2*d^-1*arctanh(a^-1//2*(a+b*sech(c+d*x))^(1/2))+-1//2*d^-1*(a+b)^-5//2*(2a+3b)*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1//2*d^-1*(a+-1b)^-5//2*(-3b+2a)*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1//4*b*d^-1*(a+b)^-5//2*arctanh((a+b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-1//4*d^-1*(1+-1*sech(c+d*x))^-1*(a+b)^-2*(a+b*sech(c+d*x))^(1/2)+-1//4*d^-1*(1+sech(c+d*x))^-1*(a+-1b)^-2*(a+b*sech(c+d*x))^(1/2)+1//4*b*d^-1*(a+-1b)^-5//2*arctanh((a+-1b)^-1//2*(a+b*sech(c+d*x))^(1/2))+-2*a^-1*b^4*d^-1*(a+b*sech(c+d*x))^-1//2*(a^2+-1*b^2)^-2)
@test integrate((sech(a*c+b*c*x)^2)^7//2*exp(c*(a+b*x)), x) == :(48*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-4*cosh(a*c+b*c*x)+-192//5*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-5*cosh(a*c+b*c*x)+-64//3*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-3*cosh(a*c+b*c*x)+32//3*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-6*cosh(a*c+b*c*x))
@test integrate((sech(a*c+b*c*x)^2)^5//2*exp(c*(a+b*x)), x) == :(-8*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-2*cosh(a*c+b*c*x)+-4*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-4*cosh(a*c+b*c*x)+32//3*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-3*cosh(a*c+b*c*x))
@test integrate((sech(a*c+b*c*x)^2)^3//2*exp(c*(a+b*x)), x) == :(2*b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*(1+exp(2*c*(a+b*x)))^-2*cosh(a*c+b*c*x)*exp(4*c*(a+b*x)))
@test integrate((sech(a*c+b*c*x)^2)^(1/2)*exp(c*(a+b*x)), x) == :(b^-1*c^-1*(sech(a*c+b*c*x)^2)^(1/2)*cosh(a*c+b*c*x)*log(1+exp(2*c*(a+b*x))))
@test integrate((sech(a*c+b*c*x)^2)^-1//2*exp(c*(a+b*x)), x) == :((1/2)*x*(sech(a*c+b*c*x)^2)^-1//2*sech(a*c+b*c*x)+1//4*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(2*c*(a+b*x))*sech(a*c+b*c*x))
@test integrate((sech(a*c+b*c*x)^2)^-3//2*exp(c*(a+b*x)), x) == :(3//8*x*(sech(a*c+b*c*x)^2)^-1//2*sech(a*c+b*c*x)+-1//16*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(-2*c*(a+b*x))*sech(a*c+b*c*x)+1//32*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(4*c*(a+b*x))*sech(a*c+b*c*x)+3//16*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(2*c*(a+b*x))*sech(a*c+b*c*x))
@test integrate((sech(a*c+b*c*x)^2)^-5//2*exp(c*(a+b*x)), x) == :(5//16*x*(sech(a*c+b*c*x)^2)^-1//2*sech(a*c+b*c*x)+-5//64*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(-2*c*(a+b*x))*sech(a*c+b*c*x)+-1//128*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(-4*c*(a+b*x))*sech(a*c+b*c*x)+1//192*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(6*c*(a+b*x))*sech(a*c+b*c*x)+5//32*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(2*c*(a+b*x))*sech(a*c+b*c*x)+5//128*b^-1*c^-1*(sech(a*c+b*c*x)^2)^-1//2*exp(4*c*(a+b*x))*sech(a*c+b*c*x))
@test integrate(x^5*sech(2*log(c*x))^-1//2, x) == :(1//7*x^6*sech(2*log(c*x))^-1//2+2//21*c^-4*x^2*sech(2*log(c*x))^-1//2+1//21*c^-5*x^-1*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-1*sech(2*log(c*x))^-1//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^4*sech(2*log(c*x))^-1//2, x) == :(1//6*c^-4*x^5*sech(2*log(c*x))^-1//2*(c^4+x^-4))
@test integrate(x^3*sech(2*log(c*x))^-1//2, x) == :(1//5*x^4*sech(2*log(c*x))^-1//2+2//5*c^-4*sech(2*log(c*x))^-1//2+-2//5*c^-4*x^-2*(c^2+x^-2)^-1*sech(2*log(c*x))^-1//2+-1//5*c^-3*x^-1*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-1*sech(2*log(c*x))^-1//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2)+2//5*c^-3*x^-1*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-1*sech(2*log(c*x))^-1//2*(c^2+x^-2)*Elliptic.E(2*arccot(c*x),1/2))
@test integrate(x^2*sech(2*log(c*x))^-1//2, x) == :(1//4*x^3*sech(2*log(c*x))^-1//2+1//4*c^-4*x^-1*(1+c^-4*x^-4)^-1//2*sech(2*log(c*x))^-1//2*arctanh((1+c^-4*x^-4)^(1/2)))
@test integrate(x*sech(2*log(c*x))^-1//2, x) == :(1//3*x^2*sech(2*log(c*x))^-1//2+-1//3*c^-1*x^-1*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-1*sech(2*log(c*x))^-1//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(sech(2*log(c*x))^-1//2, x) == :((1/2)*x*sech(2*log(c*x))^-1//2+-1//2*c^-2*x^-1*(1+c^-4*x^-4)^-1//2*sech(2*log(c*x))^-1//2*arccsch(c^2*x^2))
@test integrate(x^-1*sech(2*log(c*x))^(1/2), x) == :(-1*im*cosh(2*log(c*x))^(1/2)*sech(2*log(c*x))^(1/2)*Elliptic.F(im*log(c*x),2))
@test integrate(x^-2*sech(2*log(c*x))^(1/2), x) == :(-1//2*x*c^2*(1+c^-4*x^-4)^(1/2)*sech(2*log(c*x))^(1/2)*arccsch(c^2*x^2))
@test integrate(x^-3*sech(2*log(c*x))^(1/2), x) == :(-1*(c^2+x^-2)^-1*sech(2*log(c*x))^(1/2)*(c^4+x^-4)+c*x*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*sech(2*log(c*x))^(1/2)*(c^2+x^-2)*Elliptic.E(2*arccot(c*x),1/2)+-1//2*c*x*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*sech(2*log(c*x))^(1/2)*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^-4*sech(2*log(c*x))^(1/2), x) == :(x*sech(2*log(c*x))^(1/2)*(-1//2*c^4+-1//2*x^-4))
@test integrate(x^-5*sech(2*log(c*x))^(1/2), x) == :(sech(2*log(c*x))^(1/2)*(-1//3*c^4+-1//3*x^-4)+1//6*x*c^3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*sech(2*log(c*x))^(1/2)*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^8*sech(2*log(c*x))^-3//2, x) == :(1//12*x^9*sech(2*log(c*x))^-3//2+x^5*(16*c^4+16*x^-4)^-1*sech(2*log(c*x))^-3//2+1//32*x*c^-4*(c^4+x^-4)^-1*sech(2*log(c*x))^-3//2+-1//32*c^-12*x^-3*(1+c^-4*x^-4)^-3//2*sech(2*log(c*x))^-3//2*arctanh((1+c^-4*x^-4)^(1/2)))
@test integrate(x^7*sech(2*log(c*x))^-3//2, x) == :(1//11*x^8*sech(2*log(c*x))^-3//2+6*x^4*(77*c^4+77*x^-4)^-1*sech(2*log(c*x))^-3//2+4//77*c^-4*(c^4+x^-4)^-1*sech(2*log(c*x))^-3//2+2//77*c^-5*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^6*sech(2*log(c*x))^-3//2, x) == :(1//10*c^-4*x^7*sech(2*log(c*x))^-3//2*(c^4+x^-4))
@test integrate(x^5*sech(2*log(c*x))^-3//2, x) == :(1//9*x^6*sech(2*log(c*x))^-3//2+2*x^2*(15*c^4+15*x^-4)^-1*sech(2*log(c*x))^-3//2+4//15*c^-4*x^-2*(c^4+x^-4)^-1*sech(2*log(c*x))^-3//2+-4//15*c^-4*x^-4*(c^2+x^-2)^-1*(c^4+x^-4)^-1*sech(2*log(c*x))^-3//2+-2//15*c^-3*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2)+4//15*c^-3*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.E(2*arccot(c*x),1/2))
@test integrate(x^4*sech(2*log(c*x))^-3//2, x) == :(1//8*x^5*sech(2*log(c*x))^-3//2+3*x*(16*c^4+16*x^-4)^-1*sech(2*log(c*x))^-3//2+3//16*c^-8*x^-3*(1+c^-4*x^-4)^-3//2*sech(2*log(c*x))^-3//2*arctanh((1+c^-4*x^-4)^(1/2)))
@test integrate(x^3*sech(2*log(c*x))^-3//2, x) == :(2*(7*c^4+7*x^-4)^-1*sech(2*log(c*x))^-3//2+1//7*x^4*sech(2*log(c*x))^-3//2+-2//7*c^-1*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^2*sech(2*log(c*x))^-3//2, x) == :(1//6*x^3*sech(2*log(c*x))^-3//2+x^-1*(2*c^4+2*x^-4)^-1*sech(2*log(c*x))^-3//2+-1//2*c^-6*x^-3*(1+c^-4*x^-4)^-3//2*sech(2*log(c*x))^-3//2*arccsch(c^2*x^2))
@test integrate(x*sech(2*log(c*x))^-3//2, x) == :(1//5*x^2*sech(2*log(c*x))^-3//2+6*x^-2*(5*c^4+5*x^-4)^-1*sech(2*log(c*x))^-3//2+-12*x^-4*(c^2+x^-2)^-1*(5*c^4+5*x^-4)^-1*sech(2*log(c*x))^-3//2+-6//5*c*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.F(2*arccot(c*x),1/2)+12//5*c*x^-3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*(c^4+x^-4)^-2*sech(2*log(c*x))^-3//2*(c^2+x^-2)*Elliptic.E(2*arccot(c*x),1/2))
@test integrate(sech(2*log(c*x))^-3//2, x) == :(1//4*x*sech(2*log(c*x))^-3//2+-3*x^-3*(4*c^4+4*x^-4)^-1*sech(2*log(c*x))^-3//2+3//4*c^-4*x^-3*(1+c^-4*x^-4)^-3//2*sech(2*log(c*x))^-3//2*arctanh((1+c^-4*x^-4)^(1/2)))
@test integrate(x^-1*sech(2*log(c*x))^3//2, x) == :(sech(2*log(c*x))^(1/2)*sinh(2*log(c*x))+im*cosh(2*log(c*x))^(1/2)*sech(2*log(c*x))^(1/2)*Elliptic.E(im*log(c*x),2))
@test integrate(x^-2*sech(2*log(c*x))^3//2, x) == :(x^3*sech(2*log(c*x))^3//2*((1/2)*c^4+(1/2)*x^-4))
@test integrate(x^-3*sech(2*log(c*x))^3//2, x) == :(x^2*sech(2*log(c*x))^3//2*((1/2)*c^4+(1/2)*x^-4)+-1//4*c^-1*x^3*((c^2+x^-2)^-2*(c^4+x^-4))^(1/2)*sech(2*log(c*x))^3//2*(c^2+x^-2)*(c^4+x^-4)*Elliptic.F(2*arccot(c*x),1/2))
@test integrate(x^-4*sech(2*log(c*x))^3//2, x) == :(x*sech(2*log(c*x))^3//2*((1/2)*c^4+(1/2)*x^-4)+-1//2*c^6*x^3*(1+c^-4*x^-4)^3//2*sech(2*log(c*x))^3//2*arccsch(c^2*x^2))
@test integrate((1+-1*b^2*n^2)*sech(a+b*log(c*x^n))+2*b^2*n^2*sech(a+b*log(c*x^n))^3, x) == :(x*sech(a+b*log(c*x^n))+b*n*x*sech(a+b*log(c*x^n))*tanh(a+b*log(c*x^n)))
@test integrate(sech(a+2*log(c*x^(1/2)))^3, x) == :(2*c^6*(c^4+x^-2*exp(-2a))^-2*exp(-1a))
@test integrate(sech(a+2*log(c*x^-1//2))^3, x) == :(2*c^2*(c^4*x^-2+exp(-2a))^-2*exp(-3a))
@test integrate(sech(a+n^-1*(-2+p)^-1*log(c*x^n))^p, x) == :(x*(c*x^n)^(-2*n^-1*(2+-1p)^-1)*(2+-2p)^-1*sech(a+-1*n^-1*(2+-1p)^-1*log(c*x^n))^p*(1+(c*x^n)^(2*n^-1*(2+-1p)^-1)*exp(-2a))*(2+-1p)*exp(2a))
@test integrate(sech(a+-1*n^-1*(-2+p)^-1*log(c*x^n))^p, x) == :(x*(2+-2p)^-1*sech(a+n^-1*(2+-1p)^-1*log(c*x^n))^p*(1+(c*x^n)^(-2*n^-1*(2+-1p)^-1)*exp(-2a))*(2+-1p))
@test integrate(x^-1*sech(a+b*log(c*x^n)), x) == :(b^-1*n^-1*arctan(sinh(a+b*log(c*x^n))))
@test integrate(x^-1*sech(a+b*log(c*x^n))^2, x) == :(b^-1*n^-1*tanh(a+b*log(c*x^n)))
@test integrate(x^-1*sech(a+b*log(c*x^n))^3, x) == :((1/2)*b^-1*n^-1*arctan(sinh(a+b*log(c*x^n)))+(1/2)*b^-1*n^-1*sech(a+b*log(c*x^n))*tanh(a+b*log(c*x^n)))
@test integrate(x^-1*sech(a+b*log(c*x^n))^4, x) == :(b^-1*n^-1*tanh(a+b*log(c*x^n))+-1//3*b^-1*n^-1*tanh(a+b*log(c*x^n))^3)
@test integrate(x^-1*sech(a+b*log(c*x^n))^5, x) == :(3//8*b^-1*n^-1*arctan(sinh(a+b*log(c*x^n)))+1//4*b^-1*n^-1*sech(a+b*log(c*x^n))^3*tanh(a+b*log(c*x^n))+3//8*b^-1*n^-1*sech(a+b*log(c*x^n))*tanh(a+b*log(c*x^n)))
@test integrate(x^-1*sech(a+b*log(c*x^n))^5//2, x) == :(2//3*b^-1*n^-1*sech(a+b*log(c*x^n))^3//2*sinh(a+b*log(c*x^n))+-2//3*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.F((1/2)*im*(a+b*log(c*x^n)),2))
@test integrate(x^-1*sech(a+b*log(c*x^n))^3//2, x) == :(2*b^-1*n^-1*sech(a+b*log(c*x^n))^(1/2)*sinh(a+b*log(c*x^n))+2*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.E((1/2)*im*(a+b*log(c*x^n)),2))
@test integrate(x^-1*sech(a+b*log(c*x^n))^(1/2), x) == :(-2*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.F((1/2)*im*(a+b*log(c*x^n)),2))
@test integrate(x^-1*sech(a+b*log(c*x^n))^-1//2, x) == :(-2*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.E((1/2)*im*(a+b*log(c*x^n)),2))
@test integrate(x^-1*sech(a+b*log(c*x^n))^-3//2, x) == :(2//3*b^-1*n^-1*sech(a+b*log(c*x^n))^-1//2*sinh(a+b*log(c*x^n))+-2//3*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.F((1/2)*im*(a+b*log(c*x^n)),2))
@test integrate(x^-1*sech(a+b*log(c*x^n))^-5//2, x) == :(2//5*b^-1*n^-1*sech(a+b*log(c*x^n))^-3//2*sinh(a+b*log(c*x^n))+-6//5*im*b^-1*n^-1*cosh(a+b*log(c*x^n))^(1/2)*sech(a+b*log(c*x^n))^(1/2)*Elliptic.E((1/2)*im*(a+b*log(c*x^n)),2))
