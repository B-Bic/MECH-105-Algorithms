# False Position Algorithm

falsePosition finds the root of a function using false position method.

falsePosition requires a minimum of three inputs, Func, xl, xu.

outputs the root, the number of iterations, the estimated error, and the Y value.

## example of call code: 
function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin).
