function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
Lx = length(x);
Ly = length(y);
if Lx ~= Ly
    error('X and Y do not have the same number of points.')
end
% number of data points
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
m=length(x);

% finding quartiles

firstQ = floor((m+1)/4);
thirdQ = floor((3*m + 3)/4);

Q1 = sortedY(firstQ);
Q3 = sortedY(thirdQ);
IQR = Q3-Q1;

lowThreshold = Q1 - (1.5*IQR);
highThreshold = Q3 + (1.5*IQR);
n = length(x);

x2 = x;
y2 = y;
x = [];
y = [];

for i = 1:n
    if y2(i) >= lowThreshold && y2(i) <= highThreshold
        x =[x x2(i)];
        y = [y y2(i)];
    end
  
end
n = length(x);

% sort the data
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

fX = sortedX
fY = sortedY

    a1 = (n * sum(x .* y) - sum(x) * sum(y))/(n * sum(x.^2) - sum(x)^2);
slope = a1
    Xbar = mean(x);
    Ybar = mean(y);
    a0 = Ybar - slope * Xbar
intercept = a0;
    sstot = sum((y-Ybar).^2);
    ssres = sum((y - (slope.*x + intercept)).^2);
Rsquared = 1 - (ssres / sstot)
end