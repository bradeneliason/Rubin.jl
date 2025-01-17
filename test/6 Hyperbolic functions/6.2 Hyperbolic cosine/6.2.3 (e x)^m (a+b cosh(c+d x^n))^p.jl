using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x^3*cosh(a+b*x^2), x) == :(-1//2*b^-2*cosh(a+b*x^2)+(1/2)*b^-1*x^2*sinh(a+b*x^2))
@test integrate(x^2*cosh(a+b*x^2), x) == :((1/2)*x*b^-1*sinh(a+b*x^2)+-1//8*pi^(1/2)*b^-3//2*erfi(x*b^(1/2))*exp(a)+1//8*pi^(1/2)*b^-3//2*erf(x*b^(1/2))*exp(-1a))
@test integrate(x*cosh(a+b*x^2), x) == :((1/2)*b^-1*sinh(a+b*x^2))
@test integrate(cosh(a+b*x^2), x) == :(1//4*pi^(1/2)*b^-1//2*erf(x*b^(1/2))*exp(-1a)+1//4*pi^(1/2)*b^-1//2*erfi(x*b^(1/2))*exp(a))
@test integrate(x^-1*cosh(a+b*x^2), x) == :((1/2)*cosh(a)*coshintegral(b*x^2)+(1/2)*sinh(a)*sinhintegral(b*x^2))
@test integrate(x^-2*cosh(a+b*x^2), x) == :(-1*x^-1*cosh(a+b*x^2)+(1/2)*pi^(1/2)*b^(1/2)*erfi(x*b^(1/2))*exp(a)+-1//2*pi^(1/2)*b^(1/2)*erf(x*b^(1/2))*exp(-1a))
@test integrate(x^-3*cosh(a+b*x^2), x) == :(-1//2*x^-2*cosh(a+b*x^2)+(1/2)*b*cosh(a)*sinhintegral(b*x^2)+(1/2)*b*coshintegral(b*x^2)*sinh(a))
@test integrate(x^3*cosh(a+b*x^2)^2, x) == :(1//8*x^4+-1//8*b^-2*cosh(a+b*x^2)^2+1//4*b^-1*x^2*cosh(a+b*x^2)*sinh(a+b*x^2))
@test integrate(x^2*cosh(a+b*x^2)^2, x) == :(1//6*x^3+1//8*x*b^-1*sinh(2a+2*b*x^2)+-1//64*2^(1/2)*pi^(1/2)*b^-3//2*erfi(x*2^(1/2)*b^(1/2))*exp(2a)+1//64*2^(1/2)*pi^(1/2)*b^-3//2*erf(x*2^(1/2)*b^(1/2))*exp(-2a))
@test integrate(x*cosh(a+b*x^2)^2, x) == :(1//4*x^2+1//4*b^-1*cosh(a+b*x^2)*sinh(a+b*x^2))
@test integrate(cosh(a+b*x^2)^2, x) == :((1/2)*x+1//16*2^(1/2)*pi^(1/2)*b^-1//2*erf(x*2^(1/2)*b^(1/2))*exp(-2a)+1//16*2^(1/2)*pi^(1/2)*b^-1//2*erfi(x*2^(1/2)*b^(1/2))*exp(2a))
@test integrate(x^-1*cosh(a+b*x^2)^2, x) == :((1/2)*log(x)+1//4*cosh(2a)*coshintegral(2*b*x^2)+1//4*sinh(2a)*sinhintegral(2*b*x^2))
@test integrate(x^-2*cosh(a+b*x^2)^2, x) == :(-1*x^-1*cosh(a+b*x^2)^2+-1//4*2^(1/2)*pi^(1/2)*b^(1/2)*erf(x*2^(1/2)*b^(1/2))*exp(-2a)+1//4*2^(1/2)*pi^(1/2)*b^(1/2)*erfi(x*2^(1/2)*b^(1/2))*exp(2a))
@test integrate(x^-3*cosh(a+b*x^2)^2, x) == :(-1//4*x^-2+-1//4*x^-2*cosh(2a+2*b*x^2)+(1/2)*b*cosh(2a)*sinhintegral(2*b*x^2)+(1/2)*b*coshintegral(2*b*x^2)*sinh(2a))
@test integrate(x^3*cosh(a+b*x^2)^3, x) == :(-1//3*b^-2*cosh(a+b*x^2)+-1//18*b^-2*cosh(a+b*x^2)^3+1//3*b^-1*x^2*sinh(a+b*x^2)+1//6*b^-1*x^2*cosh(a+b*x^2)^2*sinh(a+b*x^2))
@test integrate(x^2*cosh(a+b*x^2)^3, x) == :(1//24*x*b^-1*sinh(3a+3*b*x^2)+3//8*x*b^-1*sinh(a+b*x^2)+-3//32*pi^(1/2)*b^-3//2*erfi(x*b^(1/2))*exp(a)+3//32*pi^(1/2)*b^-3//2*erf(x*b^(1/2))*exp(-1a)+-1//288*3^(1/2)*pi^(1/2)*b^-3//2*erfi(x*3^(1/2)*b^(1/2))*exp(3a)+1//288*3^(1/2)*pi^(1/2)*b^-3//2*erf(x*3^(1/2)*b^(1/2))*exp(-3a))
@test integrate(x*cosh(a+b*x^2)^3, x) == :((1/2)*b^-1*sinh(a+b*x^2)+1//6*b^-1*sinh(a+b*x^2)^3)
@test integrate(cosh(a+b*x^2)^3, x) == :(3//16*pi^(1/2)*b^-1//2*erf(x*b^(1/2))*exp(-1a)+3//16*pi^(1/2)*b^-1//2*erfi(x*b^(1/2))*exp(a)+1//48*3^(1/2)*pi^(1/2)*b^-1//2*erf(x*3^(1/2)*b^(1/2))*exp(-3a)+1//48*3^(1/2)*pi^(1/2)*b^-1//2*erfi(x*3^(1/2)*b^(1/2))*exp(3a))
@test integrate(x^-1*cosh(a+b*x^2)^3, x) == :(1//8*cosh(3a)*coshintegral(3*b*x^2)+1//8*sinh(3a)*sinhintegral(3*b*x^2)+3//8*cosh(a)*coshintegral(b*x^2)+3//8*sinh(a)*sinhintegral(b*x^2))
@test integrate(x^-2*cosh(a+b*x^2)^3, x) == :(-1*x^-1*cosh(a+b*x^2)^3+-3//8*pi^(1/2)*b^(1/2)*erf(x*b^(1/2))*exp(-1a)+3//8*pi^(1/2)*b^(1/2)*erfi(x*b^(1/2))*exp(a)+-1//8*3^(1/2)*pi^(1/2)*b^(1/2)*erf(x*3^(1/2)*b^(1/2))*exp(-3a)+1//8*3^(1/2)*pi^(1/2)*b^(1/2)*erfi(x*3^(1/2)*b^(1/2))*exp(3a))
@test integrate(x^-3*cosh(a+b*x^2)^3, x) == :(-3//8*x^-2*cosh(a+b*x^2)+-1//8*x^-2*cosh(3a+3*b*x^2)+3//8*b*cosh(a)*sinhintegral(b*x^2)+3//8*b*cosh(3a)*sinhintegral(3*b*x^2)+3//8*b*coshintegral(b*x^2)*sinh(a)+3//8*b*coshintegral(3*b*x^2)*sinh(3a))
@test integrate(x*cosh(a+b*x^2)^7, x) == :((1/2)*b^-1*sinh(a+b*x^2)^3+(1/2)*b^-1*sinh(a+b*x^2)+1//14*b^-1*sinh(a+b*x^2)^7+3//10*b^-1*sinh(a+b*x^2)^5)
@test integrate(x^2*cosh(x^3), x) == :(1//3*sinh(x^3))
@test integrate(x^-6*cosh(x^-5), x) == :(-1//5*sinh(x^-5))
@test integrate(cosh(a+b*x^-1), x) == :(x*cosh(a+b*x^-1)+-1*b*cosh(a)*sinhintegral(b*x^-1)+-1*b*coshintegral(b*x^-1)*sinh(a))
@test integrate(x^-1*cosh(a+b*x^-1), x) == :(-1*cosh(a)*coshintegral(b*x^-1)+-1*sinh(a)*sinhintegral(b*x^-1))
@test integrate(x^-2*cosh(a+b*x^-1), x) == :(-1*b^-1*sinh(a+b*x^-1))
@test integrate(x^-3*cosh(a+b*x^-1), x) == :(b^-2*cosh(a+b*x^-1)+-1*b^-1*x^-1*sinh(a+b*x^-1))
@test integrate(x^-4*cosh(a+b*x^-1), x) == :(-2*b^-3*sinh(a+b*x^-1)+-1*b^-1*x^-2*sinh(a+b*x^-1)+2*b^-2*x^-1*cosh(a+b*x^-1))
@test integrate(cosh(a+b*x^-2), x) == :(x*cosh(a+b*x^-2)+(1/2)*pi^(1/2)*b^(1/2)*erf(b^(1/2)*x^-1)*exp(-1a)+-1//2*pi^(1/2)*b^(1/2)*erfi(b^(1/2)*x^-1)*exp(a))
@test integrate(x^-1*cosh(a+b*x^-2), x) == :(-1//2*cosh(a)*coshintegral(b*x^-2)+-1//2*sinh(a)*sinhintegral(b*x^-2))
@test integrate(x^-2*cosh(a+b*x^-2), x) == :(-1//4*pi^(1/2)*b^-1//2*erf(b^(1/2)*x^-1)*exp(-1a)+-1//4*pi^(1/2)*b^-1//2*erfi(b^(1/2)*x^-1)*exp(a))
@test integrate(x^-3*cosh(a+b*x^-2), x) == :(-1//2*b^-1*sinh(a+b*x^-2))
@test integrate(x^-4*cosh(a+b*x^-2), x) == :(-1//2*b^-1*x^-1*sinh(a+b*x^-2)+-1//8*pi^(1/2)*b^-3//2*erf(b^(1/2)*x^-1)*exp(-1a)+1//8*pi^(1/2)*b^-3//2*erfi(b^(1/2)*x^-1)*exp(a))
@test integrate(cosh(a+b*x^n), x) == :(-1//2*x*n^-1*(b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,b*x^n)*exp(-1a)+-1//2*x*n^-1*(-1*b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,-1*b*x^n)*exp(a))
@test integrate(x^-1*cosh(a+b*x^n), x) == :(n^-1*cosh(a)*coshintegral(b*x^n)+n^-1*sinh(a)*sinhintegral(b*x^n))
@test integrate(cosh(a+b*x^n)^2, x) == :((1/2)*x+-1*x*2^(-2+-1*n^-1)*n^-1*(b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,2*b*x^n)*exp(-2a)+-1*x*2^(-2+-1*n^-1)*n^-1*(-1*b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,-2*b*x^n)*exp(2a))
@test integrate(x^-1*cosh(a+b*x^n)^2, x) == :((1/2)*log(x)+(1/2)*n^-1*cosh(2a)*coshintegral(2*b*x^n)+(1/2)*n^-1*sinh(2a)*sinhintegral(2*b*x^n))
@test integrate(cosh(a+b*x^n)^3, x) == :(-3//8*x*n^-1*(b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,b*x^n)*exp(-1a)+-3//8*x*n^-1*(-1*b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,-1*b*x^n)*exp(a)+-1//8*x*3^(-1*n^-1)*n^-1*(b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,3*b*x^n)*exp(-3a)+-1//8*x*3^(-1*n^-1)*n^-1*(-1*b*x^n)^(-1*n^-1)*SpecialFunctions.gamma(n^-1,-3*b*x^n)*exp(3a))
@test integrate(x^-1*cosh(a+b*x^n)^3, x) == :(1//4*n^-1*cosh(3a)*coshintegral(3*b*x^n)+1//4*n^-1*sinh(3a)*sinhintegral(3*b*x^n)+3//4*n^-1*cosh(a)*coshintegral(b*x^n)+3//4*n^-1*sinh(a)*sinhintegral(b*x^n))
@test integrate(x^m*cosh(a+b*x^n), x) == :(-1//2*n^-1*x^(1+m)*(b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),b*x^n)*exp(-1a)+-1//2*n^-1*x^(1+m)*(-1*b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),-1*b*x^n)*exp(a))
@test integrate(x^m*cosh(a+b*x^n)^2, x) == :(x^(1+m)*(2+2m)^-1+-1*2^(-1*n^-1*(1+m+2n))*n^-1*x^(1+m)*(b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),2*b*x^n)*exp(-2a)+-1*2^(-1*n^-1*(1+m+2n))*n^-1*x^(1+m)*(-1*b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),-2*b*x^n)*exp(2a))
@test integrate(x^m*cosh(a+b*x^n)^3, x) == :(-3//8*n^-1*x^(1+m)*(b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),b*x^n)*exp(-1a)+-3//8*n^-1*x^(1+m)*(-1*b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),-1*b*x^n)*exp(a)+-1//8*3^(-1*n^-1*(1+m))*n^-1*x^(1+m)*(b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),3*b*x^n)*exp(-3a)+-1//8*3^(-1*n^-1*(1+m))*n^-1*x^(1+m)*(-1*b*x^n)^(-1*n^-1*(1+m))*SpecialFunctions.gamma(n^-1*(1+m),-3*b*x^n)*exp(3a))
@test integrate(x^(-1+-1n)*cosh(a+b*x^n), x) == :(-1*n^-1*x^(-1n)*cosh(a+b*x^n)+b*n^-1*cosh(a)*sinhintegral(b*x^n)+b*n^-1*coshintegral(b*x^n)*sinh(a))
@test integrate(x^(-1+-1n)*cosh(a+b*x^n)^2, x) == :(-1//2*n^-1*x^(-1n)+-1//2*n^-1*x^(-1n)*cosh(2a+2*b*x^n)+b*n^-1*cosh(2a)*sinhintegral(2*b*x^n)+b*n^-1*coshintegral(2*b*x^n)*sinh(2a))
@test integrate(x^(-1+-1n)*cosh(a+b*x^n)^3, x) == :(-3//4*n^-1*x^(-1n)*cosh(a+b*x^n)+-1//4*n^-1*x^(-1n)*cosh(3a+3*b*x^n)+3//4*b*n^-1*cosh(a)*sinhintegral(b*x^n)+3//4*b*n^-1*cosh(3a)*sinhintegral(3*b*x^n)+3//4*b*n^-1*coshintegral(b*x^n)*sinh(a)+3//4*b*n^-1*coshintegral(3*b*x^n)*sinh(3a))
@test integrate(x^(-1+(1/2)*n)*cosh(a+b*x^n), x) == :((1/2)*pi^(1/2)*b^-1//2*n^-1*erf(b^(1/2)*x^((1/2)*n))*exp(-1a)+(1/2)*pi^(1/2)*b^-1//2*n^-1*erfi(b^(1/2)*x^((1/2)*n))*exp(a))
@test integrate(x^2*cosh((a+b*x)^2), x) == :((1/2)*b^-3*(a+b*x)*sinh((a+b*x)^2)+-1*a*b^-3*sinh((a+b*x)^2)+-1//8*pi^(1/2)*b^-3*erfi(a+b*x)+1//8*pi^(1/2)*b^-3*erf(a+b*x)+1//4*pi^(1/2)*a^2*b^-3*erf(a+b*x)+1//4*pi^(1/2)*a^2*b^-3*erfi(a+b*x))
@test integrate(x*cosh((a+b*x)^2), x) == :((1/2)*b^-2*sinh((a+b*x)^2)+-1//4*a*pi^(1/2)*b^-2*erf(a+b*x)+-1//4*a*pi^(1/2)*b^-2*erfi(a+b*x))
@test integrate(cosh((a+b*x)^2), x) == :(1//4*pi^(1/2)*b^-1*erf(a+b*x)+1//4*pi^(1/2)*b^-1*erfi(a+b*x))
@test integrate(x^2*cosh(a+b*(c+d*x)^(1/2)), x) == :(-240*b^-6*d^-3*cosh(a+b*(c+d*x)^(1/2))+-1*b^-4*d^-3*(120c+120*d*x)*cosh(a+b*(c+d*x)^(1/2))+-10*b^-2*d^-3*(c+d*x)^2*cosh(a+b*(c+d*x)^(1/2))+-2*b^-2*c^2*d^-3*cosh(a+b*(c+d*x)^(1/2))+2*b^-1*d^-3*(c+d*x)^5//2*sinh(a+b*(c+d*x)^(1/2))+24*c*b^-4*d^-3*cosh(a+b*(c+d*x)^(1/2))+40*b^-3*d^-3*(c+d*x)^3//2*sinh(a+b*(c+d*x)^(1/2))+240*b^-5*d^-3*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2))+-24*c*b^-3*d^-3*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2))+-4*c*b^-1*d^-3*(c+d*x)^3//2*sinh(a+b*(c+d*x)^(1/2))+2*b^-1*c^2*d^-3*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2))+12*c*b^-2*d^-3*(c+d*x)*cosh(a+b*(c+d*x)^(1/2)))
@test integrate(x*cosh(a+b*(c+d*x)^(1/2)), x) == :(-12*b^-4*d^-2*cosh(a+b*(c+d*x)^(1/2))+-1*b^-2*d^-2*(6c+6*d*x)*cosh(a+b*(c+d*x)^(1/2))+2*c*b^-2*d^-2*cosh(a+b*(c+d*x)^(1/2))+2*b^-1*d^-2*(c+d*x)^3//2*sinh(a+b*(c+d*x)^(1/2))+12*b^-3*d^-2*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2))+-2*c*b^-1*d^-2*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2)))
@test integrate(cosh(a+b*(c+d*x)^(1/2)), x) == :(-2*b^-2*d^-1*cosh(a+b*(c+d*x)^(1/2))+2*b^-1*d^-1*(c+d*x)^(1/2)*sinh(a+b*(c+d*x)^(1/2)))
@test integrate(x^-1*cosh(a+b*(c+d*x)^(1/2)), x) == :(cosh(a+b*c^(1/2))*coshintegral(b*(c^(1/2)+-1*(c+d*x)^(1/2)))+cosh(a+-1*b*c^(1/2))*coshintegral(b*(c^(1/2)+(c+d*x)^(1/2)))+sinh(a+-1*b*c^(1/2))*sinhintegral(b*(c^(1/2)+(c+d*x)^(1/2)))+-1*sinh(a+b*c^(1/2))*sinhintegral(b*(c^(1/2)+-1*(c+d*x)^(1/2))))
@test integrate(x^-2*cosh(a+b*(c+d*x)^(1/2)), x) == :(-1*x^-1*cosh(a+b*(c+d*x)^(1/2))+(1/2)*b*d*c^-1//2*coshintegral(b*(c^(1/2)+-1*(c+d*x)^(1/2)))*sinh(a+b*c^(1/2))+-1//2*b*d*c^-1//2*cosh(a+b*c^(1/2))*sinhintegral(b*(c^(1/2)+-1*(c+d*x)^(1/2)))+-1//2*b*d*c^-1//2*cosh(a+-1*b*c^(1/2))*sinhintegral(b*(c^(1/2)+(c+d*x)^(1/2)))+-1//2*b*d*c^-1//2*coshintegral(b*(c^(1/2)+(c+d*x)^(1/2)))*sinh(a+-1*b*c^(1/2)))
@test integrate(x^2*cosh(a+b*(c+d*x)^1//3), x) == :(120960*b^-9*d^-3*sinh(a+b*(c+d*x)^1//3)+-1*b^-6*d^-3*(20160c+20160*d*x)*cosh(a+b*(c+d*x)^1//3)+-120960*b^-8*d^-3*(c+d*x)^1//3*cosh(a+b*(c+d*x)^1//3)+-1008*b^-4*d^-3*(c+d*x)^5//3*cosh(a+b*(c+d*x)^1//3)+-24*b^-2*d^-3*(c+d*x)^7//3*cosh(a+b*(c+d*x)^1//3)+3*b^-1*d^-3*(c+d*x)^8//3*sinh(a+b*(c+d*x)^1//3)+6*b^-3*c^2*d^-3*sinh(a+b*(c+d*x)^1//3)+168*b^-3*d^-3*(c+d*x)^2*sinh(a+b*(c+d*x)^1//3)+720*c*b^-6*d^-3*cosh(a+b*(c+d*x)^1//3)+5040*b^-5*d^-3*(c+d*x)^4//3*sinh(a+b*(c+d*x)^1//3)+60480*b^-7*d^-3*(c+d*x)^2//3*sinh(a+b*(c+d*x)^1//3)+-720*c*b^-5*d^-3*(c+d*x)^1//3*sinh(a+b*(c+d*x)^1//3)+-120*c*b^-3*d^-3*(c+d*x)*sinh(a+b*(c+d*x)^1//3)+-6*c*b^-1*d^-3*(c+d*x)^5//3*sinh(a+b*(c+d*x)^1//3)+-6*b^-2*c^2*d^-3*(c+d*x)^1//3*cosh(a+b*(c+d*x)^1//3)+3*b^-1*c^2*d^-3*(c+d*x)^2//3*sinh(a+b*(c+d*x)^1//3)+30*c*b^-2*d^-3*(c+d*x)^4//3*cosh(a+b*(c+d*x)^1//3)+360*c*b^-4*d^-3*(c+d*x)^2//3*cosh(a+b*(c+d*x)^1//3))
@test integrate(x*cosh(a+b*(c+d*x)^1//3), x) == :(-360*b^-6*d^-2*cosh(a+b*(c+d*x)^1//3)+b^-3*d^-2*(60c+60*d*x)*sinh(a+b*(c+d*x)^1//3)+-180*b^-4*d^-2*(c+d*x)^2//3*cosh(a+b*(c+d*x)^1//3)+-15*b^-2*d^-2*(c+d*x)^4//3*cosh(a+b*(c+d*x)^1//3)+-6*c*b^-3*d^-2*sinh(a+b*(c+d*x)^1//3)+3*b^-1*d^-2*(c+d*x)^5//3*sinh(a+b*(c+d*x)^1//3)+360*b^-5*d^-2*(c+d*x)^1//3*sinh(a+b*(c+d*x)^1//3)+-3*c*b^-1*d^-2*(c+d*x)^2//3*sinh(a+b*(c+d*x)^1//3)+6*c*b^-2*d^-2*(c+d*x)^1//3*cosh(a+b*(c+d*x)^1//3))
@test integrate(cosh(a+b*(c+d*x)^1//3), x) == :(6*b^-3*d^-1*sinh(a+b*(c+d*x)^1//3)+-6*b^-2*d^-1*(c+d*x)^1//3*cosh(a+b*(c+d*x)^1//3)+3*b^-1*d^-1*(c+d*x)^2//3*sinh(a+b*(c+d*x)^1//3))
@test integrate(x^-1*cosh(a+b*(c+d*x)^1//3), x) == :(cosh(a+b*c^1//3)*coshintegral(b*(c^1//3+-1*(c+d*x)^1//3))+cosh(a+b*(-1)^2//3*c^1//3)*coshintegral(-1*b*(-1*(c+d*x)^1//3+(-1)^2//3*c^1//3))+cosh(a+-1*b*(-1)^1//3*c^1//3)*coshintegral(b*((c+d*x)^1//3+(-1)^1//3*c^1//3))+sinh(a+-1*b*(-1)^1//3*c^1//3)*sinhintegral(b*((c+d*x)^1//3+(-1)^1//3*c^1//3))+-1*sinh(a+b*c^1//3)*sinhintegral(b*(c^1//3+-1*(c+d*x)^1//3))+-1*sinh(a+b*(-1)^2//3*c^1//3)*sinhintegral(b*(-1*(c+d*x)^1//3+(-1)^2//3*c^1//3)))
@test integrate(x^-2*cosh(a+b*(c+d*x)^1//3), x) == :(-1*x^-1*cosh(a+b*(c+d*x)^1//3)+-1//3*b*d*c^-2//3*cosh(a+b*c^1//3)*sinhintegral(b*(c^1//3+-1*(c+d*x)^1//3))+1//3*b*d*c^-2//3*coshintegral(b*(c^1//3+-1*(c+d*x)^1//3))*sinh(a+b*c^1//3)+-1//3*b*d*(-1)^1//3*c^-2//3*cosh(a+-1*b*(-1)^1//3*c^1//3)*sinhintegral(b*((c+d*x)^1//3+(-1)^1//3*c^1//3))+-1//3*b*d*(-1)^1//3*c^-2//3*coshintegral(b*((c+d*x)^1//3+(-1)^1//3*c^1//3))*sinh(a+-1*b*(-1)^1//3*c^1//3)+-1//3*b*d*(-1)^2//3*c^-2//3*cosh(a+b*(-1)^2//3*c^1//3)*sinhintegral(b*(-1*(c+d*x)^1//3+(-1)^2//3*c^1//3))+1//3*b*d*(-1)^2//3*c^-2//3*coshintegral(-1*b*(-1*(c+d*x)^1//3+(-1)^2//3*c^1//3))*sinh(a+b*(-1)^2//3*c^1//3))
