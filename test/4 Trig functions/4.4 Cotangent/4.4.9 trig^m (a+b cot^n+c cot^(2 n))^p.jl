using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x)^5, x) == :(c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)+-1//2*b*c^-3//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+-1//3*c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x)^2+-1//24*c^-3*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(15*b^2+-16*a*c+-10*b*c*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c+b*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+b*cot(d+e*x)))+1//16*b*c^-7//2*e^-1*(5*b^2+-12*a*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x)^3, x) == :(-1*c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)+(1/2)*b*c^-3//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+b*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c+b*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x), x) == :((1/2)*2^(1/2)*e^-1*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c+b*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+b*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*tan(d+e*x), x) == :(a^-1//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+b*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c+b*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*tan(d+e*x)^3, x) == :(-1*a^-1//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+(1/2)*a^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x)^2+1//8*a^-5//2*e^-1*(3*b^2+-4*a*c)*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c+b*cot(d+e*x)))+-3//4*b*a^-2*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x)+-1//2*2^(1/2)*e^-1*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^(1/2)*(a^2+b^2+c^2+-2*a*c)^-1//2*arctanh((1/2)*2^(1/2)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+b*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x)^5, x) == :(-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)+1//3*c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^3//2+-1//2*b*c^-1//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+-1//5*c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^3//2*cot(d+e*x)^2+-1//240*c^-3*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^3//2*(35*b^2+-32*a*c+-42*b*c*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctan((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//8*b*c^-2*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(b+2*c*cot(d+e*x))+1//16*b*c^-5//2*e^-1*(b^2+-4*a*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+-1//256*b*c^-9//2*e^-1*(b^2+-4*a*c)*(7*b^2+-12*a*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+1//128*b*c^-4*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(b+2*c*cot(d+e*x))*(7*b^2+-12*a*c))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x)^3, x) == :(e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)+-1//3*c^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^3//2+(1/2)*b*c^-1//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctan((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//16*b*c^-5//2*e^-1*(b^2+-4*a*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+1//8*b*c^-2*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(b+2*c*cot(d+e*x)))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x), x) == :(-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)+-1//2*b*c^-1//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctan((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x), x) == :(a^(1/2)*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctan((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x)^3, x) == :(-1*a^(1/2)*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+-1//8*a^-3//2*e^-1*(b^2+-4*a*c)*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^(1/2)*arctan((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(a^2+b^2+c^2+-2*a*c)^-1//4*(a^2+b^2+c*(c+(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*a*((a^2+b^2+c^2+-2*a*c)^(1/2)+2c))^-1//2*(b^2+(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*(a^2+b^2+c^2+-2*a*c)^(1/2)*cot(d+e*x)))+1//4*a^-1*e^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x)^2*(2a+b*cot(d+e*x)))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*cot(d+e*x)^7, x) == :(-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(4a+2*b*cot(d+e*x))+-3//2*b*c^-5//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+c^-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(3*b^2+-8*a*c+-2*b*c*cot(d+e*x))+e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x)^4*(2a+b*cot(d+e*x))+2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x)^2*(2a+b*cot(d+e*x))+-1//24*c^-4*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(105*b^4+256*a^2*c^2+-460*a*c*b^2+-2*b*c*(35*b^2+-116*a*c)*cot(d+e*x))+5//16*b*c^-9//2*e^-1*(7*b^2+-12*a*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+(1/2)*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+2*b*c^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x)^3+-1//2*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//3*c^-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*cot(d+e*x)^2*(7*b^2+-16*a*c))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*cot(d+e*x)^5, x) == :(e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(4a+2*b*cot(d+e*x))+3//2*b*c^-5//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(b+2*c*cot(d+e*x)))+-1*c^-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(3*b^2+-8*a*c+-2*b*c*cot(d+e*x))+-1*e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*cot(d+e*x)^2*(2a+b*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*cot(d+e*x)^3, x) == :(-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(4a+2*b*cot(d+e*x))+e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*cot(d+e*x), x) == :(-1*e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*tan(d+e*x), x) == :(a^-3//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+-1*a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*b^2+-4*a*c+2*b*c*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//2*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x))))
@test integrate((a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-3//2*tan(d+e*x)^3, x) == :(-1*a^-3//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+1//8*a^-7//2*e^-1*(15*b^2+-12*a*c)*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2a+b*cot(d+e*x)))+a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*b^2+-4*a*c+2*b*c*cot(d+e*x))+-1*e^-1*(b^2+(a+-1c)^2)^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(2*a*(b^2+-1*c*(-2c+2a))+2*b*c*(a+c)*cot(d+e*x))+(1/2)*2^(1/2)*e^-1*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+-1*(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+-1c+-1*(a^2+b^2+c^2+-2*a*c)^(1/2))+-1*b*((a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+(1/2)*a^-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*tan(d+e*x)^2*(5*b^2+-12*a*c)+-1*a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*tan(d+e*x)^2*(2*b^2+-4*a*c+2*b*c*cot(d+e*x))+-1//2*2^(1/2)*e^-1*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^(1/2)*(a^2+b^2+c^2+-2*a*c)^-3//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^(1/2)*arctanh((1/2)*2^(1/2)*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^-1//2*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)^-1//2*(a^2+c^2+-1*b^2+(a^2+b^2+c^2+-2*a*c)^(1/2)*(a+-1c)+-2*a*c)^-1//2*(b^2+-1*(a+-1c)*(a+(a^2+b^2+c^2+-2*a*c)^(1/2)+-1c)+-1*b*(-1*(a^2+b^2+c^2+-2*a*c)^(1/2)+-2c+2a)*cot(d+e*x)))+-1//4*b*a^-3*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)+c*cot(d+e*x)^2)^(1/2)*(15*b^2+-52*a*c)*tan(d+e*x))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*cot(d+e*x)^5, x) == :((1/2)*e^-1*(a+c+-1b)^-1//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//2*c^-1*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)+1//4*c^-3//2*e^-1*(b+2c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*cot(d+e*x)^3, x) == :(-1//2*c^-1//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+-1//2*e^-1*(a+c+-1b)^-1//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c))))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*cot(d+e*x), x) == :((1/2)*e^-1*(a+c+-1b)^-1//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c))))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*tan(d+e*x), x) == :((1/2)*a^-1//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+-1//2*e^-1*(a+c+-1b)^-1//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c))))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*tan(d+e*x)^3, x) == :((1/2)*e^-1*(a+c+-1b)^-1//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//2*a^-1//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+(1/2)*a^-1*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*tan(d+e*x)^2+-1//4*b*a^-3//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*cot(d+e*x)^5, x) == :((1/2)*e^-1*(a+c+-1b)^(1/2)*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//6*c^-1*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^3//2+-1//32*c^-5//2*e^-1*(b^3+-8*c^2*(a+2c)+2*c*b^2+-4*b*c*(a+-2c))*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+1//16*c^-2*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*((b+-2c)*(b+4c)+2*c*cot(d+e*x)^2*(b+2c)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*cot(d+e*x)^3, x) == :(-1//2*e^-1*(a+c+-1b)^(1/2)*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//8*c^-1*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*(b+-4c+2*c*cot(d+e*x)^2)+1//16*c^-3//2*e^-1*(b^2+-4*c*(a+2c)+4*b*c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*cot(d+e*x), x) == :(-1//2*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)+(1/2)*e^-1*(a+c+-1b)^(1/2)*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//4*c^-1//2*e^-1*(b+-2c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*tan(d+e*x), x) == :((1/2)*a^(1/2)*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+-1//2*c^(1/2)*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+-1//2*e^-1*(a+c+-1b)^(1/2)*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c))))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*tan(d+e*x)^3, x) == :((1/2)*e^-1*(a+c+-1b)^(1/2)*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+(1/2)*e^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*tan(d+e*x)^2+-1//2*a^(1/2)*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+-1//2*c^(1/2)*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+-1//4*c^-1//2*e^-1*(b+-2c)*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+1//4*b*a^-1//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+1//4*b*c^-1//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*cot(d+e*x)^7, x) == :(-1//2*c^-3//2*e^-1*arctanh((1/2)*c^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b+2*c*cot(d+e*x)^2))+-1//2*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1*c^-1*e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(a*(b^2+-1*a*(b+2c))+cot(d+e*x)^2*(b^3+2*c*a^2+-1*a*b*(b+3c))))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*cot(d+e*x)^5, x) == :((1/2)*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1*e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(a*(-1b+2a)+cot(d+e*x)^2*(b*(a+-1b)+2*a*c)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*cot(d+e*x)^3, x) == :(-1//2*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(a*(b+-2c)+c*cot(d+e*x)^2*(-1b+2a)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*cot(d+e*x), x) == :((1/2)*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1*e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b^2+-1*b*c+-2*a*c+c*cot(d+e*x)^2*(b+-2c)))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*tan(d+e*x), x) == :((1/2)*a^-3//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+-1//2*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b^2+-1*b*c+-2*a*c+c*cot(d+e*x)^2*(b+-2c))+-1*a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b^2+-2*a*c+b*c*cot(d+e*x)^2))
@test integrate((a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-3//2*tan(d+e*x)^3, x) == :((1/2)*e^-1*(a+c+-1b)^-3//2*arctanh((1/2)*(a+c+-1b)^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(-1b+2a+cot(d+e*x)^2*(b+-2c)))+-1//2*a^-3//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+-3//4*b*a^-5//2*e^-1*arctanh((1/2)*a^-1//2*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(2a+b*cot(d+e*x)^2))+a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b^2+-2*a*c+b*c*cot(d+e*x)^2)+-1*e^-1*(b^2+-4*a*c)^-1*(a+c+-1b)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*(b^2+-1*b*c+-2*a*c+c*cot(d+e*x)^2*(b+-2c))+(1/2)*a^-2*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^(1/2)*tan(d+e*x)^2*(3*b^2+-8*a*c)+-1*a^-1*e^-1*(b^2+-4*a*c)^-1*(a+b*cot(d+e*x)^2+c*cot(d+e*x)^4)^-1//2*tan(d+e*x)^2*(b^2+-2*a*c+b*c*cot(d+e*x)^2))