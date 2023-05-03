function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin < 3
    error('input at least func, xl, xu.')
end

%%
if nargin < 4
    es = .0001;
end

if nargin < 5
    es = .0001;
    maxit = 200;
end
%%
funcU = func(xu);
funcL = func(xl);
%%
new = xl;
ea=100;
i=0;
while ea > es
    old = new;
    new= xu-((funcU.*(xl-xu))/(funcL-funcU));
    x=new;
    fnew =  func(new);
    if fnew > 0
        xu = new;
    elseif fnew < 0
        xl = new;
    end
    i=i+1;
    ea =abs((new-old)/new)*100;
end
%%
fx = fnew;
% desplay the answers
iter=1;
root = x;
end