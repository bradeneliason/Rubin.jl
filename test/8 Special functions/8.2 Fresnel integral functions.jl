using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate(x^7*fresnels(b*x), x) == :(1//8*x^8*fresnels(b*x)+-105//8*pi^-4*b^-8*fresnels(b*x)+-35//8*pi^-3*b^-5*x^3*cos((1/2)*pi*b^2*x^2)+-7//8*pi^-2*b^-3*x^5*sin((1/2)*pi*b^2*x^2)+1//8*pi^-1*b^-1*x^7*cos((1/2)*pi*b^2*x^2)+105//8*x*pi^-4*b^-7*sin((1/2)*pi*b^2*x^2))
@test integrate(x^6*fresnels(b*x), x) == :(1//7*x^7*fresnels(b*x)+48//7*pi^-4*b^-7*sin((1/2)*pi*b^2*x^2)+-24//7*pi^-3*b^-5*x^2*cos((1/2)*pi*b^2*x^2)+-6//7*pi^-2*b^-3*x^4*sin((1/2)*pi*b^2*x^2)+1//7*pi^-1*b^-1*x^6*cos((1/2)*pi*b^2*x^2))
@test integrate(x^5*fresnels(b*x), x) == :(1//6*x^6*fresnels(b*x)+5//2*pi^-3*b^-6*fresnelc(b*x)+-5//2*x*pi^-3*b^-5*cos((1/2)*pi*b^2*x^2)+-5//6*pi^-2*b^-3*x^3*sin((1/2)*pi*b^2*x^2)+1//6*pi^-1*b^-1*x^5*cos((1/2)*pi*b^2*x^2))
@test integrate(x^4*fresnels(b*x), x) == :(1//5*x^5*fresnels(b*x)+-8//5*pi^-3*b^-5*cos((1/2)*pi*b^2*x^2)+-4//5*pi^-2*b^-3*x^2*sin((1/2)*pi*b^2*x^2)+1//5*pi^-1*b^-1*x^4*cos((1/2)*pi*b^2*x^2))
@test integrate(x^3*fresnels(b*x), x) == :(1//4*x^4*fresnels(b*x)+3//4*pi^-2*b^-4*fresnels(b*x)+-3//4*x*pi^-2*b^-3*sin((1/2)*pi*b^2*x^2)+1//4*pi^-1*b^-1*x^3*cos((1/2)*pi*b^2*x^2))
@test integrate(x^2*fresnels(b*x), x) == :(1//3*x^3*fresnels(b*x)+-2//3*pi^-2*b^-3*sin((1/2)*pi*b^2*x^2)+1//3*pi^-1*b^-1*x^2*cos((1/2)*pi*b^2*x^2))
@test integrate(x*fresnels(b*x), x) == :((1/2)*x^2*fresnels(b*x)+-1//2*pi^-1*b^-2*fresnelc(b*x)+(1/2)*x*pi^-1*b^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(fresnels(b*x), x) == :(x*fresnels(b*x)+pi^-1*b^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-2*fresnels(b*x), x) == :((1/2)*b*sinintegral((1/2)*pi*b^2*x^2)+-1*x^-1*fresnels(b*x))
@test integrate(x^-3*fresnels(b*x), x) == :(-1//2*x^-2*fresnels(b*x)+(1/2)*pi*b^2*fresnelc(b*x)+-1//2*b*x^-1*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-4*fresnels(b*x), x) == :(-1//3*x^-3*fresnels(b*x)+-1//6*b*x^-2*sin((1/2)*pi*b^2*x^2)+1//12*pi*b^3*cosintegral((1/2)*pi*b^2*x^2))
@test integrate(x^-5*fresnels(b*x), x) == :(-1//4*x^-4*fresnels(b*x)+-1//12*b*x^-3*sin((1/2)*pi*b^2*x^2)+-1//12*pi^2*b^4*fresnels(b*x)+-1//12*pi*b^3*x^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-6*fresnels(b*x), x) == :(-1//5*x^-5*fresnels(b*x)+-1//20*b*x^-4*sin((1/2)*pi*b^2*x^2)+-1//80*pi^2*b^5*sinintegral((1/2)*pi*b^2*x^2)+-1//40*pi*b^3*x^-2*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-7*fresnels(b*x), x) == :(-1//6*x^-6*fresnels(b*x)+-1//30*b*x^-5*sin((1/2)*pi*b^2*x^2)+-1//90*pi^3*b^6*fresnelc(b*x)+-1//90*pi*b^3*x^-3*cos((1/2)*pi*b^2*x^2)+1//90*pi^2*b^5*x^-1*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-8*fresnels(b*x), x) == :(-1//7*x^-7*fresnels(b*x)+-1//42*b*x^-6*sin((1/2)*pi*b^2*x^2)+-1//672*pi^3*b^7*cosintegral((1/2)*pi*b^2*x^2)+-1//168*pi*b^3*x^-4*cos((1/2)*pi*b^2*x^2)+1//336*pi^2*b^5*x^-2*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-9*fresnels(b*x), x) == :(-1//8*x^-8*fresnels(b*x)+-1//56*b*x^-7*sin((1/2)*pi*b^2*x^2)+1//840*pi^4*b^8*fresnels(b*x)+-1//280*pi*b^3*x^-5*cos((1/2)*pi*b^2*x^2)+1//840*pi^2*b^5*x^-3*sin((1/2)*pi*b^2*x^2)+1//840*pi^3*b^7*x^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-10*fresnels(b*x), x) == :(-1//9*x^-9*fresnels(b*x)+-1//72*b*x^-8*sin((1/2)*pi*b^2*x^2)+1//6912*pi^4*b^9*sinintegral((1/2)*pi*b^2*x^2)+-1//432*pi*b^3*x^-6*cos((1/2)*pi*b^2*x^2)+1//1728*pi^2*b^5*x^-4*sin((1/2)*pi*b^2*x^2)+1//3456*pi^3*b^7*x^-2*cos((1/2)*pi*b^2*x^2))
@test integrate((c+d*x)^3*fresnels(a+b*x), x) == :(1//4*d^-1*(c+d*x)^4*fresnels(a+b*x)+pi^-1*b^-4*(b*c+-1*a*d)^3*cos((1/2)*pi*(a+b*x)^2)+-1//4*b^-4*d^-1*(b*c+-1*a*d)^4*fresnels(a+b*x)+3//4*pi^-2*b^-4*d^3*fresnels(a+b*x)+-2*pi^-2*b^-4*d^2*(b*c+-1*a*d)*sin((1/2)*pi*(a+b*x)^2)+-3//2*d*pi^-1*b^-4*(b*c+-1*a*d)^2*fresnelc(a+b*x)+-3//4*pi^-2*b^-4*d^3*(a+b*x)*sin((1/2)*pi*(a+b*x)^2)+1//4*pi^-1*b^-4*d^3*(a+b*x)^3*cos((1/2)*pi*(a+b*x)^2)+pi^-1*b^-4*d^2*(a+b*x)^2*(b*c+-1*a*d)*cos((1/2)*pi*(a+b*x)^2)+3//2*d*pi^-1*b^-4*(b*c+-1*a*d)^2*(a+b*x)*cos((1/2)*pi*(a+b*x)^2))
@test integrate((c+d*x)^2*fresnels(a+b*x), x) == :(1//3*d^-1*(c+d*x)^3*fresnels(a+b*x)+pi^-1*b^-3*(b*c+-1*a*d)^2*cos((1/2)*pi*(a+b*x)^2)+-2//3*pi^-2*b^-3*d^2*sin((1/2)*pi*(a+b*x)^2)+-1//3*b^-3*d^-1*(b*c+-1*a*d)^3*fresnels(a+b*x)+-1*d*pi^-1*b^-3*(b*c+-1*a*d)*fresnelc(a+b*x)+1//3*pi^-1*b^-3*d^2*(a+b*x)^2*cos((1/2)*pi*(a+b*x)^2)+d*pi^-1*b^-3*(a+b*x)*(b*c+-1*a*d)*cos((1/2)*pi*(a+b*x)^2))
@test integrate((c+d*x)*fresnels(a+b*x), x) == :((1/2)*d^-1*(c+d*x)^2*fresnels(a+b*x)+pi^-1*b^-2*(b*c+-1*a*d)*cos((1/2)*pi*(a+b*x)^2)+-1//2*d*pi^-1*b^-2*fresnelc(a+b*x)+-1//2*b^-2*d^-1*(b*c+-1*a*d)^2*fresnels(a+b*x)+(1/2)*d*pi^-1*b^-2*(a+b*x)*cos((1/2)*pi*(a+b*x)^2))
@test integrate(fresnels(a+b*x), x) == :(pi^-1*b^-1*cos((1/2)*pi*(a+b*x)^2)+b^-1*(a+b*x)*fresnels(a+b*x))
@test integrate(x^3*fresnels(a+b*x), x) == :(1//4*x^4*fresnels(a+b*x)+-1//4*a^4*b^-4*fresnels(a+b*x)+3//4*pi^-2*b^-4*fresnels(a+b*x)+-1*pi^-1*a^3*b^-4*cos((1/2)*pi*(a+b*x)^2)+2*a*pi^-2*b^-4*sin((1/2)*pi*(a+b*x)^2)+-3//2*pi^-1*a^2*b^-4*fresnelc(a+b*x)+-1//4*pi^-2*b^-4*(3a+3*b*x)*sin((1/2)*pi*(a+b*x)^2)+1//4*pi^-1*b^-4*(a+b*x)^3*cos((1/2)*pi*(a+b*x)^2)+-1*a*pi^-1*b^-4*(a+b*x)^2*cos((1/2)*pi*(a+b*x)^2)+3//2*pi^-1*a^2*b^-4*(a+b*x)*cos((1/2)*pi*(a+b*x)^2))
@test integrate(x^2*fresnels(a+b*x), x) == :(1//3*x^3*fresnels(a+b*x)+-2//3*pi^-2*b^-3*sin((1/2)*pi*(a+b*x)^2)+1//3*a^3*b^-3*fresnels(a+b*x)+a*pi^-1*b^-3*fresnelc(a+b*x)+pi^-1*a^2*b^-3*cos((1/2)*pi*(a+b*x)^2)+1//3*pi^-1*b^-3*(a+b*x)^2*cos((1/2)*pi*(a+b*x)^2)+-1*a*pi^-1*b^-3*(a+b*x)*cos((1/2)*pi*(a+b*x)^2))
@test integrate(x*fresnels(a+b*x), x) == :((1/2)*x^2*fresnels(a+b*x)+-1//2*pi^-1*b^-2*fresnelc(a+b*x)+-1//2*a^2*b^-2*fresnels(a+b*x)+(1/2)*pi^-1*b^-2*(a+b*x)*cos((1/2)*pi*(a+b*x)^2)+-1*a*pi^-1*b^-2*cos((1/2)*pi*(a+b*x)^2))
@test integrate(fresnels(a+b*x), x) == :(pi^-1*b^-1*cos((1/2)*pi*(a+b*x)^2)+b^-1*(a+b*x)*fresnels(a+b*x))
@test integrate(x^7*fresnels(b*x)^2, x) == :(1//8*x^8*fresnels(b*x)^2+10*pi^-5*b^-8*sin(pi*b^2*x^2)+-105//8*pi^-4*b^-8*fresnels(b*x)^2+-105//16*pi^-4*b^-6*x^2+7//48*pi^-2*b^-2*x^6+-55//16*pi^-4*b^-6*x^2*cos(pi*b^2*x^2)+-5//8*pi^-3*b^-4*x^4*sin(pi*b^2*x^2)+1//16*pi^-2*b^-2*x^6*cos(pi*b^2*x^2)+-35//4*pi^-3*b^-5*x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-7//4*pi^-2*b^-3*x^5*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//4*pi^-1*b^-1*x^7*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+105//4*x*pi^-4*b^-7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^6*fresnels(b*x)^2, x) == :(1//7*x^7*fresnels(b*x)^2+-48//7*x*pi^-4*b^-6+6//35*pi^-2*b^-2*x^5+-21//8*x*pi^-4*b^-6*cos(pi*b^2*x^2)+-17//28*pi^-3*b^-4*x^3*sin(pi*b^2*x^2)+1//14*pi^-2*b^-2*x^5*cos(pi*b^2*x^2)+96//7*pi^-4*b^-7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+531//112*2^(1/2)*pi^-4*b^-7*fresnelc(b*x*2^(1/2))+-48//7*pi^-3*b^-5*x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-12//7*pi^-2*b^-3*x^4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+2//7*pi^-1*b^-1*x^6*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^4*fresnels(b*x)^2, x) == :(1//5*x^5*fresnels(b*x)^2+4//15*pi^-2*b^-2*x^3+-16//5*pi^-3*b^-5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-11//20*x*pi^-3*b^-4*sin(pi*b^2*x^2)+1//10*pi^-2*b^-2*x^3*cos(pi*b^2*x^2)+43//40*2^(1/2)*pi^-3*b^-5*fresnels(b*x*2^(1/2))+-8//5*pi^-2*b^-3*x^2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+2//5*pi^-1*b^-1*x^4*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^3*fresnels(b*x)^2, x) == :(1//4*x^4*fresnels(b*x)^2+-1//2*pi^-3*b^-4*sin(pi*b^2*x^2)+3//4*pi^-2*b^-4*fresnels(b*x)^2+3//8*pi^-2*b^-2*x^2+1//8*pi^-2*b^-2*x^2*cos(pi*b^2*x^2)+(1/2)*pi^-1*b^-1*x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-3//2*x*pi^-2*b^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^2*fresnels(b*x)^2, x) == :(1//3*x^3*fresnels(b*x)^2+2//3*x*pi^-2*b^-2+-5//12*2^(1/2)*pi^-2*b^-3*fresnelc(b*x*2^(1/2))+-4//3*pi^-2*b^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//6*x*pi^-2*b^-2*cos(pi*b^2*x^2)+2//3*pi^-1*b^-1*x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(fresnels(b*x)^2, x) == :(x*fresnels(b*x)^2+2*pi^-1*b^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-1//2*2^(1/2)*pi^-1*b^-1*fresnels(b*x*2^(1/2)))
@test integrate(x^-5*fresnels(b*x)^2, x) == :(-1//4*x^-4*fresnels(b*x)^2+-1//24*b^2*x^-2+-1//12*pi^2*b^4*fresnels(b*x)^2+1//12*pi*b^4*sinintegral(pi*b^2*x^2)+1//24*b^2*x^-2*cos(pi*b^2*x^2)+-1//6*b*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//6*pi*b^3*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^-9*fresnels(b*x)^2, x) == :(-1//8*x^-8*fresnels(b*x)^2+-1//336*b^2*x^-6+-1//280*pi^3*b^8*sinintegral(pi*b^2*x^2)+1//336*b^2*x^-6*cos(pi*b^2*x^2)+1//840*pi^4*b^8*fresnels(b*x)^2+1//1680*pi^2*b^6*x^-2+-1//28*b*x^-7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//336*pi^2*b^6*x^-2*cos(pi*b^2*x^2)+-1//420*pi*b^4*x^-4*sin(pi*b^2*x^2)+-1//140*pi*b^3*x^-5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+1//420*pi^2*b^5*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//420*pi^3*b^7*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(fresnels(a+b*x)^2, x) == :(b^-1*fresnels(a+b*x)^2*(a+b*x)+2*pi^-1*b^-1*cos((1/2)*pi*(a+b*x)^2)*fresnels(a+b*x)+-1//2*2^(1/2)*pi^-1*b^-1*fresnels(2^(1/2)*(a+b*x)))
@test integrate(x^2*fresnels(d*(a+b*log(c*x^n))), x) == :(1//3*x^3*fresnels(d*(a+b*log(c*x^n)))+x^3*(c*x^n)^(-3*n^-1)*(1//12+-1//12*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(3*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-3*a*b^-1*n^-1+9//2*im*pi^-1*b^-2*d^-2*n^-2)+x^3*(c*x^n)^(-3*n^-1)*(1//12+-1//12*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(3*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-3*a*b^-1*n^-1+-9//2*im*pi^-1*b^-2*d^-2*n^-2))
@test integrate(x*fresnels(d*(a+b*log(c*x^n))), x) == :((1/2)*x^2*fresnels(d*(a+b*log(c*x^n)))+x^2*(c*x^n)^(-2*n^-1)*(1//8+-1//8*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(pi^-1*b^-2*d^-2*n^-2*(2im+-2*pi*a*b*n*d^2))+x^2*(c*x^n)^(-2*n^-1)*(1//8+-1//8*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-1*pi^-1*b^-2*d^-2*n^-2*(2im+2*pi*a*b*n*d^2)))
@test integrate(fresnels(d*(a+b*log(c*x^n))), x) == :(x*fresnels(d*(a+b*log(c*x^n)))+x*(c*x^n)^(-1*n^-1)*(1//4+-1//4*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-1//2*b^-2*n^-2*(-1*im*pi^-1*d^-2+2*a*b*n))+x*(c*x^n)^(-1*n^-1)*(1//4+-1//4*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-1//2*b^-2*n^-2*(im*pi^-1*d^-2+2*a*b*n)))
@test integrate(x^-1*fresnels(d*(a+b*log(c*x^n))), x) == :(b^-1*n^-1*(a+b*log(c*x^n))*fresnels(d*(a+b*log(c*x^n)))+pi^-1*b^-1*d^-1*n^-1*cos((1/2)*pi*d^2*(a+b*log(c*x^n))^2))
@test integrate(x^-2*fresnels(d*(a+b*log(c*x^n))), x) == :(-1*x^-1*fresnels(d*(a+b*log(c*x^n)))+x^-1*(c*x^n)^(n^-1)*(1//4+-1//4*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp((1/2)*b^-2*n^-2*(im*pi^-1*d^-2+2*a*b*n))+x^-1*(c*x^n)^(n^-1)*(1//4+-1//4*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp((1/2)*b^-2*n^-2*(-1*im*pi^-1*d^-2+2*a*b*n)))
@test integrate(x^-3*fresnels(d*(a+b*log(c*x^n))), x) == :(-1//2*x^-2*fresnels(d*(a+b*log(c*x^n)))+x^-2*(c*x^n)^(2*n^-1)*(1//8+-1//8*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(pi^-1*b^-2*d^-2*n^-2*(2im+2*pi*a*b*n*d^2))+x^-2*(c*x^n)^(2*n^-1)*(1//8+-1//8*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-1*pi^-1*b^-2*d^-2*n^-2*(2im+-2*pi*a*b*n*d^2)))
@test integrate((e*x)^m*fresnels(d*(a+b*log(c*x^n))), x) == :(e^-1*(e*x)^(1+m)*(1+m)^-1*fresnels(d*(a+b*log(c*x^n)))+x*(c*x^n)^(-1*n^-1*(1+m))*(e*x)^m*(1+m)^-1*(1//4+-1//4*im)*erf(pi^-1//2*b^-1*d^-1*n^-1*(1/2+(1/2)*im)*(1+m+pi*im*a*b*n*d^2+pi*im*n*b^2*d^2*log(c*x^n)))*exp((1/2)*im*pi^-1*b^-2*d^-2*n^-2*(1+m)*(1+m+2*pi*im*a*b*n*d^2))+x*(c*x^n)^(-1*n^-1*(1+m))*(e*x)^m*(1+m)^-1*(1//4+-1//4*im)*erfi(pi^-1//2*b^-1*d^-1*n^-1*(1/2+(1/2)*im)*(1+m+-1*pi*im*a*b*n*d^2+-1*pi*im*n*b^2*d^2*log(c*x^n)))*exp(-1//2*im*pi^-1*b^-2*d^-2*n^-2*(1+m)*(1+m+-2*pi*im*a*b*n*d^2)))
@test integrate(fresnels(b*x)^2*sin((1/2)*pi*b^2*x^2), x) == :(1//3*b^-1*fresnels(b*x)^3)
@test integrate(fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :((1/2)*b^-1*fresnels(b*x)^2)
@test integrate(fresnels(b*x)^-1*sin((1/2)*pi*b^2*x^2), x) == :(b^-1*log(fresnels(b*x)))
@test integrate(fresnels(b*x)^-2*sin((1/2)*pi*b^2*x^2), x) == :(-1*b^-1*fresnels(b*x)^-1)
@test integrate(fresnels(b*x)^-3*sin((1/2)*pi*b^2*x^2), x) == :(-1//2*b^-1*fresnels(b*x)^-2)
@test integrate(fresnels(b*x)^n*sin((1/2)*pi*b^2*x^2), x) == :(b^-1*(1+n)^-1*fresnels(b*x)^(1+n))
@test integrate(x^8*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-40*pi^-5*b^-9*sin(pi*b^2*x^2)+-7//12*pi^-2*b^-3*x^6+105//2*pi^-4*b^-9*fresnels(b*x)^2+105//4*pi^-4*b^-7*x^2+-1//4*pi^-2*b^-3*x^6*cos(pi*b^2*x^2)+5//2*pi^-3*b^-5*x^4*sin(pi*b^2*x^2)+55//4*pi^-4*b^-7*x^2*cos(pi*b^2*x^2)+-1*pi^-1*b^-2*x^7*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-105*x*pi^-4*b^-8*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+7*pi^-2*b^-4*x^5*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+35*pi^-3*b^-6*x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(24*x*pi^-4*b^-7+-3//5*pi^-2*b^-3*x^5+-48*pi^-4*b^-8*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-531//32*2^(1/2)*pi^-4*b^-8*fresnelc(b*x*2^(1/2))+-1//4*pi^-2*b^-3*x^5*cos(pi*b^2*x^2)+17//8*pi^-3*b^-5*x^3*sin(pi*b^2*x^2)+147//16*x*pi^-4*b^-7*cos(pi*b^2*x^2)+-1*pi^-1*b^-2*x^6*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+6*pi^-2*b^-4*x^4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+24*pi^-3*b^-6*x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^5*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-2//3*pi^-2*b^-3*x^3+8*pi^-3*b^-6*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-43//16*2^(1/2)*pi^-3*b^-6*fresnels(b*x*2^(1/2))+-1//4*pi^-2*b^-3*x^3*cos(pi*b^2*x^2)+11//8*x*pi^-3*b^-5*sin(pi*b^2*x^2)+-1*pi^-1*b^-2*x^4*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+4*pi^-2*b^-4*x^2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(pi^-3*b^-5*sin(pi*b^2*x^2)+-3//2*pi^-2*b^-5*fresnels(b*x)^2+-3//4*pi^-2*b^-3*x^2+-1//4*pi^-2*b^-3*x^2*cos(pi*b^2*x^2)+-1*pi^-1*b^-2*x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+3*x*pi^-2*b^-4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-1*x*pi^-2*b^-3+2*pi^-2*b^-4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//4*x*pi^-2*b^-3*cos(pi*b^2*x^2)+5//8*2^(1/2)*pi^-2*b^-4*fresnelc(b*x*2^(1/2))+-1*pi^-1*b^-2*x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-1*pi^-1*b^-2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+1//4*2^(1/2)*pi^-1*b^-2*fresnels(b*x*2^(1/2)))
@test integrate(fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :((1/2)*b^-1*fresnels(b*x)^2)
@test integrate(x^-4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-1//12*b*x^-2+-1//3*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//6*pi^2*b^3*fresnels(b*x)^2+1//6*pi*b^3*sinintegral(pi*b^2*x^2)+1//12*b*x^-2*cos(pi*b^2*x^2)+-1//3*pi*b^2*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^-8*fresnels(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-1//84*b*x^-6+-1//7*x^-7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//70*pi^3*b^7*sinintegral(pi*b^2*x^2)+1//84*b*x^-6*cos(pi*b^2*x^2)+1//210*pi^4*b^7*fresnels(b*x)^2+1//420*pi^2*b^5*x^-2+-1//84*pi^2*b^5*x^-2*cos(pi*b^2*x^2)+-1//105*pi*b^3*x^-4*sin(pi*b^2*x^2)+-1//35*pi*b^2*x^-5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+1//105*pi^2*b^4*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//105*pi^3*b^6*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^7*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(4*pi^-3*b^-5*x^3+-1//14*pi^-1*b^-1*x^7+-48*pi^-4*b^-8*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-147//16*x*pi^-4*b^-7*sin(pi*b^2*x^2)+1//4*pi^-2*b^-3*x^5*sin(pi*b^2*x^2)+17//8*pi^-3*b^-5*x^3*cos(pi*b^2*x^2)+531//32*2^(1/2)*pi^-4*b^-8*fresnels(b*x*2^(1/2))+pi^-1*b^-2*x^6*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-24*pi^-3*b^-6*x^2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+6*pi^-2*b^-4*x^4*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^6*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-11//2*pi^-4*b^-7*sin(pi*b^2*x^2)+-1//12*pi^-1*b^-1*x^6+15//2*pi^-3*b^-7*fresnels(b*x)^2+15//4*pi^-3*b^-5*x^2+1//4*pi^-2*b^-3*x^4*sin(pi*b^2*x^2)+7//4*pi^-3*b^-5*x^2*cos(pi*b^2*x^2)+pi^-1*b^-2*x^5*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-15*x*pi^-3*b^-6*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+5*pi^-2*b^-4*x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(4*x*pi^-3*b^-5+-1//10*pi^-1*b^-1*x^5+-8*pi^-3*b^-6*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-43//16*2^(1/2)*pi^-3*b^-6*fresnelc(b*x*2^(1/2))+1//4*pi^-2*b^-3*x^3*sin(pi*b^2*x^2)+11//8*x*pi^-3*b^-5*cos(pi*b^2*x^2)+pi^-1*b^-2*x^4*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+4*pi^-2*b^-4*x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^3*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-1//6*pi^-1*b^-1*x^3+2*pi^-2*b^-4*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-5//8*2^(1/2)*pi^-2*b^-4*fresnels(b*x*2^(1/2))+1//4*x*pi^-2*b^-3*sin(pi*b^2*x^2)+pi^-1*b^-2*x^2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-1//2*pi^-1*b^-3*fresnels(b*x)^2+-1//4*pi^-1*b^-1*x^2+1//4*pi^-2*b^-3*sin(pi*b^2*x^2)+x*pi^-1*b^-2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-1//2*x*pi^-1*b^-1+pi^-1*b^-2*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//4*2^(1/2)*pi^-1*b^-2*fresnelc(b*x*2^(1/2)))
@test integrate(x^-2*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(1//4*b*sinintegral(pi*b^2*x^2)+-1*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-1//2*pi*b*fresnels(b*x)^2)
@test integrate(x^-6*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-7//120*pi^2*b^5*sinintegral(pi*b^2*x^2)+-1//5*x^-5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-1//40*b*x^-4*sin(pi*b^2*x^2)+1//30*pi^3*b^5*fresnels(b*x)^2+1//60*pi*b^3*x^-2+-1//24*pi*b^3*x^-2*cos(pi*b^2*x^2)+1//15*pi*b^2*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//15*pi^2*b^4*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^-10*cos((1/2)*pi*b^2*x^2)*fresnels(b*x), x) == :(-1//9*x^-9*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+-1//144*b*x^-8*sin(pi*b^2*x^2)+-1//1890*pi^5*b^9*fresnels(b*x)^2+-1//3780*pi^3*b^7*x^-2+1//756*pi*b^3*x^-6+83//30240*pi^4*b^9*sinintegral(pi*b^2*x^2)+-11//3024*pi*b^3*x^-6*cos(pi*b^2*x^2)+5//2016*pi^3*b^7*x^-2*cos(pi*b^2*x^2)+67//30240*pi^2*b^5*x^-4*sin(pi*b^2*x^2)+-1//945*pi^3*b^6*x^-3*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+-1//945*pi^4*b^8*x^-1*cos((1/2)*pi*b^2*x^2)*fresnels(b*x)+1//63*pi*b^2*x^-7*fresnels(b*x)*sin((1/2)*pi*b^2*x^2)+1//315*pi^2*b^4*x^-5*cos((1/2)*pi*b^2*x^2)*fresnels(b*x))
@test integrate(x^7*fresnelc(b*x), x) == :(1//8*x^8*fresnelc(b*x)+-105//8*pi^-4*b^-8*fresnelc(b*x)+-7//8*pi^-2*b^-3*x^5*cos((1/2)*pi*b^2*x^2)+-1//8*pi^-1*b^-1*x^7*sin((1/2)*pi*b^2*x^2)+35//8*pi^-3*b^-5*x^3*sin((1/2)*pi*b^2*x^2)+105//8*x*pi^-4*b^-7*cos((1/2)*pi*b^2*x^2))
@test integrate(x^6*fresnelc(b*x), x) == :(1//7*x^7*fresnelc(b*x)+48//7*pi^-4*b^-7*cos((1/2)*pi*b^2*x^2)+-6//7*pi^-2*b^-3*x^4*cos((1/2)*pi*b^2*x^2)+-1//7*pi^-1*b^-1*x^6*sin((1/2)*pi*b^2*x^2)+24//7*pi^-3*b^-5*x^2*sin((1/2)*pi*b^2*x^2))
@test integrate(x^5*fresnelc(b*x), x) == :(1//6*x^6*fresnelc(b*x)+-5//2*pi^-3*b^-6*fresnels(b*x)+-5//6*pi^-2*b^-3*x^3*cos((1/2)*pi*b^2*x^2)+-1//6*pi^-1*b^-1*x^5*sin((1/2)*pi*b^2*x^2)+5//2*x*pi^-3*b^-5*sin((1/2)*pi*b^2*x^2))
@test integrate(x^4*fresnelc(b*x), x) == :(1//5*x^5*fresnelc(b*x)+8//5*pi^-3*b^-5*sin((1/2)*pi*b^2*x^2)+-4//5*pi^-2*b^-3*x^2*cos((1/2)*pi*b^2*x^2)+-1//5*pi^-1*b^-1*x^4*sin((1/2)*pi*b^2*x^2))
@test integrate(x^3*fresnelc(b*x), x) == :(1//4*x^4*fresnelc(b*x)+3//4*pi^-2*b^-4*fresnelc(b*x)+-3//4*x*pi^-2*b^-3*cos((1/2)*pi*b^2*x^2)+-1//4*pi^-1*b^-1*x^3*sin((1/2)*pi*b^2*x^2))
@test integrate(x^2*fresnelc(b*x), x) == :(1//3*x^3*fresnelc(b*x)+-2//3*pi^-2*b^-3*cos((1/2)*pi*b^2*x^2)+-1//3*pi^-1*b^-1*x^2*sin((1/2)*pi*b^2*x^2))
@test integrate(x*fresnelc(b*x), x) == :((1/2)*x^2*fresnelc(b*x)+(1/2)*pi^-1*b^-2*fresnels(b*x)+-1//2*x*pi^-1*b^-1*sin((1/2)*pi*b^2*x^2))
@test integrate(fresnelc(b*x), x) == :(x*fresnelc(b*x)+-1*pi^-1*b^-1*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-2*fresnelc(b*x), x) == :((1/2)*b*cosintegral((1/2)*pi*b^2*x^2)+-1*x^-1*fresnelc(b*x))
@test integrate(x^-3*fresnelc(b*x), x) == :(-1//2*x^-2*fresnelc(b*x)+-1//2*pi*b^2*fresnels(b*x)+-1//2*b*x^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-4*fresnelc(b*x), x) == :(-1//3*x^-3*fresnelc(b*x)+-1//6*b*x^-2*cos((1/2)*pi*b^2*x^2)+-1//12*pi*b^3*sinintegral((1/2)*pi*b^2*x^2))
@test integrate(x^-5*fresnelc(b*x), x) == :(-1//4*x^-4*fresnelc(b*x)+-1//12*b*x^-3*cos((1/2)*pi*b^2*x^2)+-1//12*pi^2*b^4*fresnelc(b*x)+1//12*pi*b^3*x^-1*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-6*fresnelc(b*x), x) == :(-1//5*x^-5*fresnelc(b*x)+-1//20*b*x^-4*cos((1/2)*pi*b^2*x^2)+-1//80*pi^2*b^5*cosintegral((1/2)*pi*b^2*x^2)+1//40*pi*b^3*x^-2*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-7*fresnelc(b*x), x) == :(-1//6*x^-6*fresnelc(b*x)+-1//30*b*x^-5*cos((1/2)*pi*b^2*x^2)+1//90*pi^3*b^6*fresnels(b*x)+1//90*pi*b^3*x^-3*sin((1/2)*pi*b^2*x^2)+1//90*pi^2*b^5*x^-1*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-8*fresnelc(b*x), x) == :(-1//7*x^-7*fresnelc(b*x)+-1//42*b*x^-6*cos((1/2)*pi*b^2*x^2)+1//672*pi^3*b^7*sinintegral((1/2)*pi*b^2*x^2)+1//168*pi*b^3*x^-4*sin((1/2)*pi*b^2*x^2)+1//336*pi^2*b^5*x^-2*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-9*fresnelc(b*x), x) == :(-1//8*x^-8*fresnelc(b*x)+-1//56*b*x^-7*cos((1/2)*pi*b^2*x^2)+1//840*pi^4*b^8*fresnelc(b*x)+-1//840*pi^3*b^7*x^-1*sin((1/2)*pi*b^2*x^2)+1//280*pi*b^3*x^-5*sin((1/2)*pi*b^2*x^2)+1//840*pi^2*b^5*x^-3*cos((1/2)*pi*b^2*x^2))
@test integrate(x^-10*fresnelc(b*x), x) == :(-1//9*x^-9*fresnelc(b*x)+-1//72*b*x^-8*cos((1/2)*pi*b^2*x^2)+1//6912*pi^4*b^9*cosintegral((1/2)*pi*b^2*x^2)+-1//3456*pi^3*b^7*x^-2*sin((1/2)*pi*b^2*x^2)+1//432*pi*b^3*x^-6*sin((1/2)*pi*b^2*x^2)+1//1728*pi^2*b^5*x^-4*cos((1/2)*pi*b^2*x^2))
@test integrate((c+d*x)^3*fresnelc(a+b*x), x) == :(1//4*d^-1*(c+d*x)^4*fresnelc(a+b*x)+-1*pi^-1*b^-4*(b*c+-1*a*d)^3*sin((1/2)*pi*(a+b*x)^2)+-1//4*b^-4*d^-1*(b*c+-1*a*d)^4*fresnelc(a+b*x)+3//4*pi^-2*b^-4*d^3*fresnelc(a+b*x)+-2*pi^-2*b^-4*d^2*(b*c+-1*a*d)*cos((1/2)*pi*(a+b*x)^2)+-3//4*pi^-2*b^-4*d^3*(a+b*x)*cos((1/2)*pi*(a+b*x)^2)+-1//4*pi^-1*b^-4*d^3*(a+b*x)^3*sin((1/2)*pi*(a+b*x)^2)+3//2*d*pi^-1*b^-4*(b*c+-1*a*d)^2*fresnels(a+b*x)+-1*pi^-1*b^-4*d^2*(a+b*x)^2*(b*c+-1*a*d)*sin((1/2)*pi*(a+b*x)^2)+-3//2*d*pi^-1*b^-4*(b*c+-1*a*d)^2*(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate((c+d*x)^2*fresnelc(a+b*x), x) == :(1//3*d^-1*(c+d*x)^3*fresnelc(a+b*x)+-1*pi^-1*b^-3*(b*c+-1*a*d)^2*sin((1/2)*pi*(a+b*x)^2)+-2//3*pi^-2*b^-3*d^2*cos((1/2)*pi*(a+b*x)^2)+-1//3*b^-3*d^-1*(b*c+-1*a*d)^3*fresnelc(a+b*x)+d*pi^-1*b^-3*(b*c+-1*a*d)*fresnels(a+b*x)+-1//3*pi^-1*b^-3*d^2*(a+b*x)^2*sin((1/2)*pi*(a+b*x)^2)+-1*d*pi^-1*b^-3*(a+b*x)*(b*c+-1*a*d)*sin((1/2)*pi*(a+b*x)^2))
@test integrate((c+d*x)*fresnelc(a+b*x), x) == :((1/2)*d^-1*(c+d*x)^2*fresnelc(a+b*x)+(1/2)*d*pi^-1*b^-2*fresnels(a+b*x)+-1*pi^-1*b^-2*(b*c+-1*a*d)*sin((1/2)*pi*(a+b*x)^2)+-1//2*b^-2*d^-1*(b*c+-1*a*d)^2*fresnelc(a+b*x)+-1//2*d*pi^-1*b^-2*(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate(fresnelc(a+b*x), x) == :(b^-1*(a+b*x)*fresnelc(a+b*x)+-1*pi^-1*b^-1*sin((1/2)*pi*(a+b*x)^2))
@test integrate(x^3*fresnelc(a+b*x), x) == :(1//4*x^4*fresnelc(a+b*x)+-1//4*a^4*b^-4*fresnelc(a+b*x)+3//4*pi^-2*b^-4*fresnelc(a+b*x)+pi^-1*a^3*b^-4*sin((1/2)*pi*(a+b*x)^2)+2*a*pi^-2*b^-4*cos((1/2)*pi*(a+b*x)^2)+-1//4*pi^-1*b^-4*(a+b*x)^3*sin((1/2)*pi*(a+b*x)^2)+-1//4*pi^-2*b^-4*(3a+3*b*x)*cos((1/2)*pi*(a+b*x)^2)+3//2*pi^-1*a^2*b^-4*fresnels(a+b*x)+a*pi^-1*b^-4*(a+b*x)^2*sin((1/2)*pi*(a+b*x)^2)+-3//2*pi^-1*a^2*b^-4*(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate(x^2*fresnelc(a+b*x), x) == :(1//3*x^3*fresnelc(a+b*x)+-2//3*pi^-2*b^-3*cos((1/2)*pi*(a+b*x)^2)+1//3*a^3*b^-3*fresnelc(a+b*x)+-1*a*pi^-1*b^-3*fresnels(a+b*x)+-1*pi^-1*a^2*b^-3*sin((1/2)*pi*(a+b*x)^2)+-1//3*pi^-1*b^-3*(a+b*x)^2*sin((1/2)*pi*(a+b*x)^2)+a*pi^-1*b^-3*(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate(x*fresnelc(a+b*x), x) == :((1/2)*x^2*fresnelc(a+b*x)+(1/2)*pi^-1*b^-2*fresnels(a+b*x)+-1//2*a^2*b^-2*fresnelc(a+b*x)+a*pi^-1*b^-2*sin((1/2)*pi*(a+b*x)^2)+-1//2*pi^-1*b^-2*(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate(fresnelc(a+b*x), x) == :(b^-1*(a+b*x)*fresnelc(a+b*x)+-1*pi^-1*b^-1*sin((1/2)*pi*(a+b*x)^2))
@test integrate(x^7*fresnelc(b*x)^2, x) == :(1//8*x^8*fresnelc(b*x)^2+-10*pi^-5*b^-8*sin(pi*b^2*x^2)+-105//8*pi^-4*b^-8*fresnelc(b*x)^2+-105//16*pi^-4*b^-6*x^2+7//48*pi^-2*b^-2*x^6+-1//16*pi^-2*b^-2*x^6*cos(pi*b^2*x^2)+5//8*pi^-3*b^-4*x^4*sin(pi*b^2*x^2)+55//16*pi^-4*b^-6*x^2*cos(pi*b^2*x^2)+-7//4*pi^-2*b^-3*x^5*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//4*pi^-1*b^-1*x^7*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+35//4*pi^-3*b^-5*x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+105//4*x*pi^-4*b^-7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^6*fresnelc(b*x)^2, x) == :(1//7*x^7*fresnelc(b*x)^2+-48//7*x*pi^-4*b^-6+6//35*pi^-2*b^-2*x^5+-531//112*2^(1/2)*pi^-4*b^-7*fresnelc(b*x*2^(1/2))+-1//14*pi^-2*b^-2*x^5*cos(pi*b^2*x^2)+17//28*pi^-3*b^-4*x^3*sin(pi*b^2*x^2)+21//8*x*pi^-4*b^-6*cos(pi*b^2*x^2)+96//7*pi^-4*b^-7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-12//7*pi^-2*b^-3*x^4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-2//7*pi^-1*b^-1*x^6*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+48//7*pi^-3*b^-5*x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^4*fresnelc(b*x)^2, x) == :(1//5*x^5*fresnelc(b*x)^2+4//15*pi^-2*b^-2*x^3+-43//40*2^(1/2)*pi^-3*b^-5*fresnels(b*x*2^(1/2))+-1//10*pi^-2*b^-2*x^3*cos(pi*b^2*x^2)+11//20*x*pi^-3*b^-4*sin(pi*b^2*x^2)+16//5*pi^-3*b^-5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-8//5*pi^-2*b^-3*x^2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-2//5*pi^-1*b^-1*x^4*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^3*fresnelc(b*x)^2, x) == :(1//4*x^4*fresnelc(b*x)^2+(1/2)*pi^-3*b^-4*sin(pi*b^2*x^2)+3//4*pi^-2*b^-4*fresnelc(b*x)^2+3//8*pi^-2*b^-2*x^2+-1//8*pi^-2*b^-2*x^2*cos(pi*b^2*x^2)+-3//2*x*pi^-2*b^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//2*pi^-1*b^-1*x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^2*fresnelc(b*x)^2, x) == :(1//3*x^3*fresnelc(b*x)^2+2//3*x*pi^-2*b^-2+-4//3*pi^-2*b^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//6*x*pi^-2*b^-2*cos(pi*b^2*x^2)+5//12*2^(1/2)*pi^-2*b^-3*fresnelc(b*x*2^(1/2))+-2//3*pi^-1*b^-1*x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(fresnelc(b*x)^2, x) == :(x*fresnelc(b*x)^2+(1/2)*2^(1/2)*pi^-1*b^-1*fresnels(b*x*2^(1/2))+-2*pi^-1*b^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-5*fresnelc(b*x)^2, x) == :(-1//4*x^-4*fresnelc(b*x)^2+-1//24*b^2*x^-2+-1//12*pi*b^4*sinintegral(pi*b^2*x^2)+-1//12*pi^2*b^4*fresnelc(b*x)^2+-1//24*b^2*x^-2*cos(pi*b^2*x^2)+-1//6*b*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+1//6*pi*b^3*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-9*fresnelc(b*x)^2, x) == :(-1//8*x^-8*fresnelc(b*x)^2+-1//336*b^2*x^-6+-1//336*b^2*x^-6*cos(pi*b^2*x^2)+1//280*pi^3*b^8*sinintegral(pi*b^2*x^2)+1//840*pi^4*b^8*fresnelc(b*x)^2+1//1680*pi^2*b^6*x^-2+-1//28*b*x^-7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+1//336*pi^2*b^6*x^-2*cos(pi*b^2*x^2)+1//420*pi*b^4*x^-4*sin(pi*b^2*x^2)+-1//420*pi^3*b^7*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//140*pi*b^3*x^-5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//420*pi^2*b^5*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(fresnelc(a+b*x)^2, x) == :(b^-1*fresnelc(a+b*x)^2*(a+b*x)+(1/2)*2^(1/2)*pi^-1*b^-1*fresnels(2^(1/2)*(a+b*x))+-2*pi^-1*b^-1*fresnelc(a+b*x)*sin((1/2)*pi*(a+b*x)^2))
@test integrate(x^2*fresnelc(d*(a+b*log(c*x^n))), x) == :(1//3*x^3*fresnelc(d*(a+b*log(c*x^n)))+x^3*(c*x^n)^(-3*n^-1)*(1//12+1//12*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(3*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-3*a*b^-1*n^-1+9//2*im*pi^-1*b^-2*d^-2*n^-2)+-1*x^3*(c*x^n)^(-3*n^-1)*(1//12+1//12*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(3*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-3*a*b^-1*n^-1+-9//2*im*pi^-1*b^-2*d^-2*n^-2))
@test integrate(x*fresnelc(d*(a+b*log(c*x^n))), x) == :((1/2)*x^2*fresnelc(d*(a+b*log(c*x^n)))+x^2*(c*x^n)^(-2*n^-1)*(1//8+1//8*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(pi^-1*b^-2*d^-2*n^-2*(2im+-2*pi*a*b*n*d^2))+-1*x^2*(c*x^n)^(-2*n^-1)*(1//8+1//8*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-1*pi^-1*b^-2*d^-2*n^-2*(2im+2*pi*a*b*n*d^2)))
@test integrate(fresnelc(d*(a+b*log(c*x^n))), x) == :(x*fresnelc(d*(a+b*log(c*x^n)))+x*(c*x^n)^(-1*n^-1)*(1//4+1//4*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-1//2*b^-2*n^-2*(-1*im*pi^-1*d^-2+2*a*b*n))+-1*x*(c*x^n)^(-1*n^-1)*(1//4+1//4*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(-1//2*b^-2*n^-2*(im*pi^-1*d^-2+2*a*b*n)))
@test integrate(x^-1*fresnelc(d*(a+b*log(c*x^n))), x) == :(b^-1*n^-1*(a+b*log(c*x^n))*fresnelc(d*(a+b*log(c*x^n)))+-1*pi^-1*b^-1*d^-1*n^-1*sin((1/2)*pi*d^2*(a+b*log(c*x^n))^2))
@test integrate(x^-2*fresnelc(d*(a+b*log(c*x^n))), x) == :(-1*x^-1*fresnelc(d*(a+b*log(c*x^n)))+x^-1*(c*x^n)^(n^-1)*(1//4+1//4*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp((1/2)*b^-2*n^-2*(im*pi^-1*d^-2+2*a*b*n))+-1*x^-1*(c*x^n)^(n^-1)*(1//4+1//4*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp((1/2)*b^-2*n^-2*(-1*im*pi^-1*d^-2+2*a*b*n)))
@test integrate(x^-3*fresnelc(d*(a+b*log(c*x^n))), x) == :(-1//2*x^-2*fresnelc(d*(a+b*log(c*x^n)))+x^-2*(c*x^n)^(2*n^-1)*(1//8+1//8*im)*erf(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+-1*pi*im*a*b*d^2+-1*pi*im*b^2*d^2*log(c*x^n)))*exp(pi^-1*b^-2*d^-2*n^-2*(2im+2*pi*a*b*n*d^2))+-1*x^-2*(c*x^n)^(2*n^-1)*(1//8+1//8*im)*erfi(pi^-1//2*b^-1*d^-1*(1/2+(1/2)*im)*(2*n^-1+pi*im*a*b*d^2+pi*im*b^2*d^2*log(c*x^n)))*exp(-1*pi^-1*b^-2*d^-2*n^-2*(2im+-2*pi*a*b*n*d^2)))
@test integrate((e*x)^m*fresnelc(d*(a+b*log(c*x^n))), x) == :(e^-1*(e*x)^(1+m)*(1+m)^-1*fresnelc(d*(a+b*log(c*x^n)))+x*(c*x^n)^(-1*n^-1*(1+m))*(e*x)^m*(1+m)^-1*(1//4+1//4*im)*erf(pi^-1//2*b^-1*d^-1*n^-1*(1/2+(1/2)*im)*(1+m+pi*im*a*b*n*d^2+pi*im*n*b^2*d^2*log(c*x^n)))*exp((1/2)*im*pi^-1*b^-2*d^-2*n^-2*(1+m)*(1+m+2*pi*im*a*b*n*d^2))+-1*x*(c*x^n)^(-1*n^-1*(1+m))*(e*x)^m*(1+m)^-1*(1//4+1//4*im)*erfi(pi^-1//2*b^-1*d^-1*n^-1*(1/2+(1/2)*im)*(1+m+-1*pi*im*a*b*n*d^2+-1*pi*im*n*b^2*d^2*log(c*x^n)))*exp(-1//2*im*pi^-1*b^-2*d^-2*n^-2*(1+m)*(1+m+-2*pi*im*a*b*n*d^2)))
@test integrate(fresnelc(b*x)^2*cos((1/2)*pi*b^2*x^2), x) == :(1//3*b^-1*fresnelc(b*x)^3)
@test integrate(cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :((1/2)*b^-1*fresnelc(b*x)^2)
@test integrate(fresnelc(b*x)^-1*cos((1/2)*pi*b^2*x^2), x) == :(b^-1*log(fresnelc(b*x)))
@test integrate(fresnelc(b*x)^-2*cos((1/2)*pi*b^2*x^2), x) == :(-1*b^-1*fresnelc(b*x)^-1)
@test integrate(fresnelc(b*x)^-3*cos((1/2)*pi*b^2*x^2), x) == :(-1//2*b^-1*fresnelc(b*x)^-2)
@test integrate(fresnelc(b*x)^n*cos((1/2)*pi*b^2*x^2), x) == :(b^-1*(1+n)^-1*fresnelc(b*x)^(1+n))
@test integrate(x^8*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(40*pi^-5*b^-9*sin(pi*b^2*x^2)+-7//12*pi^-2*b^-3*x^6+105//2*pi^-4*b^-9*fresnelc(b*x)^2+105//4*pi^-4*b^-7*x^2+-55//4*pi^-4*b^-7*x^2*cos(pi*b^2*x^2)+-5//2*pi^-3*b^-5*x^4*sin(pi*b^2*x^2)+1//4*pi^-2*b^-3*x^6*cos(pi*b^2*x^2)+pi^-1*b^-2*x^7*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-105*x*pi^-4*b^-8*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-35*pi^-3*b^-6*x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+7*pi^-2*b^-4*x^5*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(24*x*pi^-4*b^-7+-3//5*pi^-2*b^-3*x^5+-48*pi^-4*b^-8*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-147//16*x*pi^-4*b^-7*cos(pi*b^2*x^2)+-17//8*pi^-3*b^-5*x^3*sin(pi*b^2*x^2)+1//4*pi^-2*b^-3*x^5*cos(pi*b^2*x^2)+531//32*2^(1/2)*pi^-4*b^-8*fresnelc(b*x*2^(1/2))+pi^-1*b^-2*x^6*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-24*pi^-3*b^-6*x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+6*pi^-2*b^-4*x^4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^5*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(-2//3*pi^-2*b^-3*x^3+-8*pi^-3*b^-6*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-11//8*x*pi^-3*b^-5*sin(pi*b^2*x^2)+1//4*pi^-2*b^-3*x^3*cos(pi*b^2*x^2)+43//16*2^(1/2)*pi^-3*b^-6*fresnels(b*x*2^(1/2))+pi^-1*b^-2*x^4*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+4*pi^-2*b^-4*x^2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(-1*pi^-3*b^-5*sin(pi*b^2*x^2)+-3//2*pi^-2*b^-5*fresnelc(b*x)^2+-3//4*pi^-2*b^-3*x^2+1//4*pi^-2*b^-3*x^2*cos(pi*b^2*x^2)+pi^-1*b^-2*x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+3*x*pi^-2*b^-4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(-1*x*pi^-2*b^-3+2*pi^-2*b^-4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-5//8*2^(1/2)*pi^-2*b^-4*fresnelc(b*x*2^(1/2))+1//4*x*pi^-2*b^-3*cos(pi*b^2*x^2)+pi^-1*b^-2*x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(pi^-1*b^-2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-1//4*2^(1/2)*pi^-1*b^-2*fresnels(b*x*2^(1/2)))
@test integrate(cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :((1/2)*b^-1*fresnelc(b*x)^2)
@test integrate(x^-4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(-1//12*b*x^-2+-1//3*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//6*pi*b^3*sinintegral(pi*b^2*x^2)+-1//6*pi^2*b^3*fresnelc(b*x)^2+-1//12*b*x^-2*cos(pi*b^2*x^2)+1//3*pi*b^2*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-8*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x), x) == :(-1//84*b*x^-6+-1//7*x^-7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//84*b*x^-6*cos(pi*b^2*x^2)+1//70*pi^3*b^7*sinintegral(pi*b^2*x^2)+1//210*pi^4*b^7*fresnelc(b*x)^2+1//420*pi^2*b^5*x^-2+1//84*pi^2*b^5*x^-2*cos(pi*b^2*x^2)+1//105*pi*b^3*x^-4*sin(pi*b^2*x^2)+-1//105*pi^3*b^6*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//35*pi*b^2*x^-5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//105*pi^2*b^4*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^7*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-4*pi^-3*b^-5*x^3+1//14*pi^-1*b^-1*x^7+-48*pi^-4*b^-8*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-147//16*x*pi^-4*b^-7*sin(pi*b^2*x^2)+1//4*pi^-2*b^-3*x^5*sin(pi*b^2*x^2)+17//8*pi^-3*b^-5*x^3*cos(pi*b^2*x^2)+531//32*2^(1/2)*pi^-4*b^-8*fresnels(b*x*2^(1/2))+-1*pi^-1*b^-2*x^6*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+6*pi^-2*b^-4*x^4*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+24*pi^-3*b^-6*x^2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^6*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-15//2*pi^-3*b^-7*fresnelc(b*x)^2+-15//4*pi^-3*b^-5*x^2+-11//2*pi^-4*b^-7*sin(pi*b^2*x^2)+1//12*pi^-1*b^-1*x^6+1//4*pi^-2*b^-3*x^4*sin(pi*b^2*x^2)+7//4*pi^-3*b^-5*x^2*cos(pi*b^2*x^2)+-1*pi^-1*b^-2*x^5*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+5*pi^-2*b^-4*x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+15*x*pi^-3*b^-6*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-4*x*pi^-3*b^-5+1//10*pi^-1*b^-1*x^5+8*pi^-3*b^-6*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-43//16*2^(1/2)*pi^-3*b^-6*fresnelc(b*x*2^(1/2))+1//4*pi^-2*b^-3*x^3*sin(pi*b^2*x^2)+11//8*x*pi^-3*b^-5*cos(pi*b^2*x^2)+-1*pi^-1*b^-2*x^4*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+4*pi^-2*b^-4*x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^3*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(1//6*pi^-1*b^-1*x^3+2*pi^-2*b^-4*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-5//8*2^(1/2)*pi^-2*b^-4*fresnels(b*x*2^(1/2))+1//4*x*pi^-2*b^-3*sin(pi*b^2*x^2)+-1*pi^-1*b^-2*x^2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x^2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :((1/2)*pi^-1*b^-3*fresnelc(b*x)^2+1//4*pi^-1*b^-1*x^2+1//4*pi^-2*b^-3*sin(pi*b^2*x^2)+-1*x*pi^-1*b^-2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))
@test integrate(x*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :((1/2)*x*pi^-1*b^-1+-1*pi^-1*b^-2*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+1//4*2^(1/2)*pi^-1*b^-2*fresnelc(b*x*2^(1/2)))
@test integrate(x^-2*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(1//4*b*sinintegral(pi*b^2*x^2)+(1/2)*pi*b*fresnelc(b*x)^2+-1*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-6*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-7//120*pi^2*b^5*sinintegral(pi*b^2*x^2)+-1//5*x^-5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-1//30*pi^3*b^5*fresnelc(b*x)^2+-1//40*b*x^-4*sin(pi*b^2*x^2)+-1//60*pi*b^3*x^-2+-1//24*pi*b^3*x^-2*cos(pi*b^2*x^2)+-1//15*pi*b^2*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+1//15*pi^2*b^4*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2))
@test integrate(x^-10*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2), x) == :(-1//9*x^-9*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+-1//144*b*x^-8*sin(pi*b^2*x^2)+-1//756*pi*b^3*x^-6+1//1890*pi^5*b^9*fresnelc(b*x)^2+1//3780*pi^3*b^7*x^-2+83//30240*pi^4*b^9*sinintegral(pi*b^2*x^2)+-11//3024*pi*b^3*x^-6*cos(pi*b^2*x^2)+5//2016*pi^3*b^7*x^-2*cos(pi*b^2*x^2)+67//30240*pi^2*b^5*x^-4*sin(pi*b^2*x^2)+-1//63*pi*b^2*x^-7*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x)+-1//945*pi^4*b^8*x^-1*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//315*pi^2*b^4*x^-5*fresnelc(b*x)*sin((1/2)*pi*b^2*x^2)+1//945*pi^3*b^6*x^-3*cos((1/2)*pi*b^2*x^2)*fresnelc(b*x))