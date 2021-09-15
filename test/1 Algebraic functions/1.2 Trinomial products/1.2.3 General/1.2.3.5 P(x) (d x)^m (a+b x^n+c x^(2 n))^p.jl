using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*x^3+c*x^6)^-1*(d+e*x+f*x^2+g*x^3+h*x^4+j*x^5+k*x^6+l*x^7+m*x^8), x) == :(k*x*c^-1+(1/2)*l*c^-1*x^2+1//3*m*c^-1*x^3+1//6*c^-2*(c*j+-1*b*m)*log(a+b*x^3+c*x^6)+-1//3*c^-2*(b^2+-4*a*c)^-1//2*(m*b^2+2*f*c^2+-1*b*c*j+-2*a*c*m)*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*x^3))+-1//6*2^1//3*c^-2//3*(b+(b^2+-4*a*c)^(1/2))^-1//3*(h+-1*b*l*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+2*e*c^2+-1*b*c*h+-2*a*c*l))*log((b+(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+-1//6*2^1//3*c^-2//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3*(h+c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+-1*c*(b*h+2*a*l)+2*e*c^2)+-1*b*l*c^-1)*log((b+-1*(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+-1//12*2^2//3*c^-1//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(g+-1*b*k*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+2*d*c^2+-1*b*c*g+-2*a*c*k))*log((b+(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^1//3)+-1//12*2^2//3*c^-1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(g+c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+-1*c*(b*g+2*a*k)+2*d*c^2)+-1*b*k*c^-1)*log((b+-1*(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^1//3)+1//6*2^2//3*c^-1//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(g+-1*b*k*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+2*d*c^2+-1*b*c*g+-2*a*c*k))*log((b+(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+1//6*2^2//3*c^-1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(g+c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+-1*c*(b*g+2*a*k)+2*d*c^2)+-1*b*k*c^-1)*log((b+-1*(b^2+-4*a*c)^(1/2))^1//3+x*2^1//3*c^1//3)+1//12*2^1//3*c^-2//3*(b+(b^2+-4*a*c)^(1/2))^-1//3*(h+-1*b*l*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+2*e*c^2+-1*b*c*h+-2*a*c*l))*log((b+(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^1//3)+1//12*2^1//3*c^-2//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3*(h+c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+-1*c*(b*h+2*a*l)+2*e*c^2)+-1*b*l*c^-1)*log((b+-1*(b^2+-4*a*c)^(1/2))^2//3+2^2//3*c^2//3*x^2+-1*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^1//3)+-1//6*2^1//3*3^(1/2)*c^-2//3*(b+(b^2+-4*a*c)^(1/2))^-1//3*(h+-1*b*l*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+2*e*c^2+-1*b*c*h+-2*a*c*l))*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^-1//3))+-1//6*2^1//3*3^(1/2)*c^-2//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3*(h+c^-1*(b^2+-4*a*c)^-1//2*(l*b^2+-1*c*(b*h+2*a*l)+2*e*c^2)+-1*b*l*c^-1)*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3))+-1//6*2^2//3*3^(1/2)*c^-1//3*(b+(b^2+-4*a*c)^(1/2))^-2//3*(g+-1*b*k*c^-1+-1*c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+2*d*c^2+-1*b*c*g+-2*a*c*k))*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+(b^2+-4*a*c)^(1/2))^-1//3))+-1//6*2^2//3*3^(1/2)*c^-1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-2//3*(g+c^-1*(b^2+-4*a*c)^-1//2*(k*b^2+-1*c*(b*g+2*a*k)+2*d*c^2)+-1*b*k*c^-1)*arctan(1//3*3^(1/2)*(1+-2*x*2^1//3*c^1//3*(b+-1*(b^2+-4*a*c)^(1/2))^-1//3)))
@test integrate((a+b*x^n+c*x^(2n))^-3//2*(c*f*x^(-1+n)+c*g*x^(-1+2n)+c*h*x^(-1+5//2*n)+-1*a*h*x^(-1+(1/2)*n)), x) == :(-1*n^-1*(b^2+-4*a*c)^-1*(a+b*x^n+c*x^(2n))^-1//2*(2*c*(b*f+-2*a*g)+2*c*x^n*(-1*b*g+2*c*f)+2*h*x^((1/2)*n)*(b^2+-4*a*c)))
@test integrate((a+b*x^n+c*x^(2n))^p*(a+b*x^n*(1+n+n*p)+c*x^(2n)*(1+2*n*(1+p))), x) == :(x*(a+b*x^n+c*x^(2n))^(1+p))
@test integrate(x^(-1+1//4*n)*(a+c*x^n)^-3//2*(-1*a*h+c*f*x^(1//4*n)+c*g*x^(3//4*n)+c*h*x^n), x) == :(-1*a^-1*n^-1*(a+c*x^n)^-1//2*(2*a*g+-2*c*f*x^((1/2)*n)+4*a*h*x^(1//4*n)))
@test integrate((d*x)^(-1+1//4*n)*(a+c*x^n)^-3//2*(-1*a*h+c*f*x^(1//4*n)+c*g*x^(3//4*n)+c*h*x^n), x) == :(-2*a^-1*n^-1*x^(1+-1//4*n)*(d*x)^(-1+1//4*n)*(a+c*x^n)^-1//2*(a*g+-1*c*f*x^((1/2)*n)+2*a*h*x^(1//4*n)))
@test integrate(x^(-1+(1/2)*n)*(a+b*x^n+c*x^(2n))^-3//2*(-1*a*h+c*f*x^((1/2)*n)+c*g*x^(3//2*n)+c*h*x^(2n)), x) == :(-1*n^-1*(b^2+-4*a*c)^-1*(a+b*x^n+c*x^(2n))^-1//2*(2*c*(b*f+-2*a*g)+2*c*x^n*(-1*b*g+2*c*f)+2*h*x^((1/2)*n)*(b^2+-4*a*c)))
@test integrate((d*x)^(-1+(1/2)*n)*(a+b*x^n+c*x^(2n))^-3//2*(-1*a*h+c*f*x^((1/2)*n)+c*g*x^(3//2*n)+c*h*x^(2n)), x) == :(-2*n^-1*x^(1+-1//2*n)*(d*x)^(-1+(1/2)*n)*(b^2+-4*a*c)^-1*(a+b*x^n+c*x^(2n))^-1//2*(c*(b*f+-2*a*g)+c*x^n*(-1*b*g+2*c*f)+h*x^((1/2)*n)*(b^2+-4*a*c)))
@test integrate((g*x)^m*(a+b*x^n+c*x^(2n))^p*(a*(1+m)+b*x^n*(1+m+n+n*p)+c*x^(2n)*(1+m+2*n*(1+p))), x) == :(g^-1*(g*x)^(1+m)*(a+b*x^n+c*x^(2n))^(1+p))