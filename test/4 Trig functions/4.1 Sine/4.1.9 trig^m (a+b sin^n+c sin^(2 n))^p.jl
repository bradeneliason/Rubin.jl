using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sin(x)^4, x) == :((1/2)*x*c^-1+b*c^-2*cos(x)+x*c^-3*(b^2+-1*a*c)+-1//2*c^-1*cos(x)*sin(x)+-1*2^(1/2)*c^-3*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b^3+(b^2+-4*a*c)^-1//2*(b^4+2*a^2*c^2+-4*a*c*b^2)+-2*a*b*c)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*2^(1/2)*c^-3*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b^3+-1*(b^2+-4*a*c)^-1//2*(b^4+2*a^2*c^2+-4*a*c*b^2)+-2*a*b*c)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sin(x)^3, x) == :(-1*c^-1*cos(x)+-1*b*x*c^-2+b*2^(1/2)*c^-2*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b+b^2*(b^2+-4*a*c)^-1//2+-1*a*c*b^-1+-3*a*c*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+b*2^(1/2)*c^-2*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b+-1*b^2*(b^2+-4*a*c)^-1//2+-1*a*c*b^-1+3*a*c*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sin(x)^2, x) == :(x*c^-1+-1*2^(1/2)*c^-1*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b+(b^2+-4*a*c)^-1//2*(b^2+-2*a*c))*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*2^(1/2)*c^-1*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b+-1*(b^2+-4*a*c)^-1//2*(b^2+-2*a*c))*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sin(x), x) == :(2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+b*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+-1*b*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1, x) == :(-2*c*2^(1/2)*(b^2+-4*a*c)^-1//2*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+2*c*2^(1/2)*(b^2+-4*a*c)^-1//2*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*csc(x), x) == :(-1*a^-1*arctanh(cos(x))+-1*c*2^(1/2)*a^-1*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+-1*b*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*c*2^(1/2)*a^-1*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+b*(b^2+-4*a*c)^-1//2)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*csc(x)^2, x) == :(-1*a^-1*cot(x)+b*a^-2*arctanh(cos(x))+b*c*2^(1/2)*a^-2*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+-1*b^-1*(b^2+-4*a*c)^-1//2*(b^2+-2*a*c))*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+b*c*2^(1/2)*a^-2*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+b^-1*(b^2+-4*a*c)^-1//2*(b^2+-2*a*c))*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*csc(x)^3, x) == :(-1//2*a^-1*arctanh(cos(x))+b*a^-2*cot(x)+-1*a^-3*(b^2+-1*a*c)*arctanh(cos(x))+-1//2*a^-1*cot(x)*csc(x)+c*2^(1/2)*a^-3*(b^2+-4*a*c)^-1//2*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b^3+-1*(b^2+-4*a*c)^(1/2)*(b^2+-1*a*c)+-3*a*b*c)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*c*2^(1/2)*a^-3*(b^2+-4*a*c)^-1//2*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(b^3+(b^2+-4*a*c)^(1/2)*(b^2+-1*a*c)+-3*a*b*c)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*cos(x)^3, x) == :(-1*c^-1*sin(x)+(1/2)*b*c^-2*log(a+b*sin(x)+c*sin(x)^2)+c^-2*(b^2+-4*a*c)^-1//2*(b^2+-2*c*(a+c))*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*sin(x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*cos(x)^2, x) == :(-1*x*c^-1+2^(1/2)*c^-1*(b^2+-4*a*c)^-1//2*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^(1/2)*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*2^(1/2)*c^-1*(b^2+-4*a*c)^-1//2*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^(1/2)*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*cos(x), x) == :(-2*(b^2+-4*a*c)^-1//2*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*sin(x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sec(x), x) == :((-2b+2a+2c)^-1*log(1+sin(x))+-1*(2a+2b+2c)^-1*log(1+-1*sin(x))+-1*b*(a+b+c)^-1*(-2b+2a+2c)^-1*log(a+b*sin(x)+c*sin(x)^2)+(b^2+-4*a*c)^-1//2*(a+b+c)^-1*(a+c+-1b)^-1*(b^2+-2*c^2+-2*a*c)*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*sin(x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sec(x)^2, x) == :((1+-1*sin(x))^-1*(2a+2b+2c)^-1*cos(x)+-1*(1+sin(x))^-1*(-2b+2a+2c)^-1*cos(x)+-1*b*c*2^(1/2)*(a+b+c)^-1*(a+c+-1b)^-1*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+-1*b^-1*(b^2+-4*a*c)^-1//2*(b^2+-2*c*(a+c)))*arctan((1/2)*2^(1/2)*(b^2+b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+(b^2+-4*a*c)^(1/2))*tan((1/2)*x)))+-1*b*c*2^(1/2)*(a+b+c)^-1*(a+c+-1b)^-1*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(1+b^-1*(b^2+-4*a*c)^-1//2*(b^2+-2*c*(a+c)))*arctan((1/2)*2^(1/2)*(b^2+-1*b*(b^2+-4*a*c)^(1/2)+-2*c*(a+c))^-1//2*(2c+(b+-1*(b^2+-4*a*c)^(1/2))*tan((1/2)*x))))
@test integrate((a+b*sin(x)+c*sin(x)^2)^-1*sec(x)^3, x) == :(-1//4*(a+b+c)^-2*(a+2b+3c)*log(1+-1*sin(x))+1//4*(a+c+-1b)^-2*(a+-2b+3c)*log(1+sin(x))+(1/2)*b*(a^2+c^2+-1*b^2+2*a*c)^-2*(b^2+-2*c*(a+c))*log(a+b*sin(x)+c*sin(x)^2)+-1*(b^2+-4*a*c)^-1//2*(a^2+c^2+-1*b^2+2*a*c)^-2*(b^4+2*c^2*(a+c)^2+-2*c*b^2*(c+2a))*arctanh((b^2+-4*a*c)^-1//2*(b+2*c*sin(x)))+-1*(a+b+c)^-1*(-2b+2a+2c)^-1*sec(x)^2*(b+-1*(a+c)*sin(x)))
@test integrate((-6+sin(x)^2+sin(x))^-1*cos(x), x) == :(-1//5*log(3+sin(x))+1//5*log(2+-1*sin(x)))
@test integrate((2+sin(x)^2+-3*sin(x))^-1*cos(x), x) == :(-1*log(1+-1*sin(x))+log(2+-1*sin(x)))
@test integrate((-5+sin(x)^2+4*sin(x))^-1*cos(x), x) == :(-1//6*log(5+sin(x))+1//6*log(1+-1*sin(x)))
@test integrate((10+sin(x)^2+-6*sin(x))^-1*cos(x), x) == :(-1*arctan(3+-1*sin(x)))
@test integrate((2+sin(x)^2+2*sin(x))^-1*cos(x), x) == :(arctan(1+sin(x)))
