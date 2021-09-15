using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((1+x^8)^(1/2)*(x+x^17+2*x^9)^-1*(1+2*x^8), x) == :(-1//4*(1+x^8)^-1//2+-1//4*arctanh((1+x^8)^(1/2)))
@test integrate((1+x^2)^-1, x) == :(arctan(x))
@test integrate(x^-1*(1+x^8)^-1//2, x) == :(-1//4*arctanh((1+x^8)^(1/2)))
@test integrate(x*(1+-1*x^3)^-1//2, x) == :(2*(1+-1*x^3)^(1/2)*(1+3^(1/2)+-1x)^-1+-1*3^1//4*((1+3^(1/2)+-1x)^-2*(1+-1x))^-1//2*((1+3^(1/2)+-1x)^-2*(1+x+x^2))^(1/2)*(1+-1*x^3)^-1//2*(2+-1*3^(1/2))^(1/2)*(1+-1x)*Elliptic.E(arcsin((1+3^(1/2)+-1x)^-1*(1+-1x+-1*3^(1/2))),-7+-4*3^(1/2))+2//3*2^(1/2)*3^3//4*((1+3^(1/2)+-1x)^-2*(1+-1x))^-1//2*((1+3^(1/2)+-1x)^-2*(1+x+x^2))^(1/2)*(1+-1*x^3)^-1//2*(1+-1x)*Elliptic.F(arcsin((1+3^(1/2)+-1x)^-1*(1+-1x+-1*3^(1/2))),-7+-4*3^(1/2)))
@test integrate(x^-1*(1+-1*x^3)^-1//2, x) == :(-2//3*arctanh((1+-1*x^3)^(1/2)))
@test integrate(x*(-71+x^4+-96x+10*x^2)^-1//2, x) == :(1//8*log(10001+x^8+-1408*x^3+-128*x^5+20*x^6+54*x^4+3124*x^2+(-71+x^4+-96x+10*x^2)^(1/2)*(781+x^6+-528x+-80*x^3+15*x^4+27*x^2)))
@test integrate(tan(x)^-2*(x+-1*tan(x)), x) == :(-1//2*x^2+-1*x*cot(x))
@test integrate(1+tan(x)^2+x*tan(x), x) == :((1/2)*im*x^2+(1/2)*im*Polylogarithms.polylog(2,-1*exp(2*im*x))+-1*x*log(1+exp(2*im*x))+tan(x))
@test integrate(x^-1*sin(x), x) == :(sinintegral(x))
@test integrate(x^-1*(x+exp(x))^-1//3*(3*(x+exp(x))^1//3+5*x^2+(2*x^2+3x)*exp(x)), x) == :(3*log(x)+3*x*(x+exp(x))^2//3)
@test integrate(x^-1+(x+log(x))^-3//2*(1+x^-1), x) == :(-2*(x+log(x))^-1//2+log(x))
@test integrate((x^3+x*log(x)^2+2*x^2*log(x))^-1*(x^2+log(x)^2+(x+log(x))^(1/2)*(1+x)+2*x*log(x)), x) == :(-2*(x+log(x))^-1//2+log(x))
@test integrate((log(x)^3+-1*x^2*log(x))^-1*(-1*x^2+-1*log(x)+2*log(x)^2), x) == :((1/2)*log(x+log(x))+-1//2*log(x+-1*log(x))+logintegral(x))
@test integrate((4+x^6+-5*x^4+5*x^2)^-1*(6+x^4+-3*x^2), x) == :(-1*arctan(3^(1/2)+-2x)+arctan((1/2)*x*(1+x^4+-3*x^2))+arctan(3^(1/2)+2x))
