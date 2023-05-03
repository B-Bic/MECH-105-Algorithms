function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%set a, b, & n
a = min(x);
A = 1;
b = max(x);
B = length(x);
n = length(x);
m =  n-1

% standard checks
if length(x) ~= length(y)
    error('bound do not match')
end

if isuniform(x)==0
    error('x vector is not spaced properly.')
end

% error statment
if n < 0
    error('n must be 2 or greater')
end

% trap rule
if n == 2
    warning('using the TRAP rule')
    I = (b-a)*(y(1,A)+y(1,B))/2;
end
% single aplication of simpsons
if n==3
    I = (b-a)*(y(1,A)+(4*y(1,(B+A)/2))+y(1,B))/6;
end
%%
% multiple aplication of simpsons
vader = linspace(1,n,n);
L = zeros(1,n);
for g = 1:n
    if rem(vader(1,g),2) == 0
        L(1,g) = 1;
    else
        L(1,g) = 0;
    end
end
even = zeros(1,n);
odd = zeros(1,n);
Yevens = zeros(1,n);
Yodds = zeros(1,n);
if n > 3
    for i = 1:n
        if rem(L(1,i),2) == 0
            even(1,i) = 1;
            odd(1,i) = 0;
        elseif rem(L(1,i),2) ~= 0
            even(1,i) = 0;
            odd(1,i) = 1;
        end
    end
    
    for j = 1:n;
        if odd(1,j) == 1;
            Yodds(1,j) = y(1,j);
            Yevens(1,j) = 0;
        elseif even(1,j) == 1;
            Yevens(1,j) = y(1,j);
            Yodds(1,j) = 0;
        end
    end 
    Yevens(1,1) = 0;
    Yodds(1,1) = 0;
    Yevens(1,n) = 0;
    Yodds(1,n) = 0;

    YE = sum(Yevens);
    YO = sum(Yodds);

    % addiing final trap
    FS=0;
    if rem(length(x),2) ~= 0 
        %warning('using trap rule')
        C = B-1;
        FS = (B-C)*(y(1,C)+y(1,B))/2;
    end
    if rem(m,2)~=0
        warning('Trap rule being used')
    I = (b-a)*(y(A)+(4*YO)+(2*YE)+y(B))/(3*(n-1))% + FS;
    else rem(m,2)==0
       I = (b-a)*(y(A)+(4*YO)+(2*YE)+y(B))/(3*(n-1))% + FS
    end
end

end