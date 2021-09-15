using Rubin
using Tests
using Elliptic
using HypergeometricFunctions
using Polylogarithms
using SpecialFunctions

@test integrate((a+a*cos(e+f*x))^2*(-1c+c*cos(e+f*x))^-1*sec(e+f*x)^2, x) == :(-1*a^2*c^-1*f^-1*tan(e+f*x)+-3*a^2*c^-1*f^-1*arctanh(sin(e+f*x))+4*a^2*c^-1*f^-1*(1+-1*cos(e+f*x))^-1*sin(e+f*x))
