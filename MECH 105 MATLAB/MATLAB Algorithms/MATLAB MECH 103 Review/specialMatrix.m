function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);
    
% Now the real challenge is to fill in the correct values of A
if nargin ~= 2
error('Error, function requires 2 inputs.')
end
    A(1,:)= 1:m;
    A(:,1)= 1:n;
    for i= 2:n
        for j= 2:m
            A(i,j) = A((i-1),j)+A(i,(j-1));
        end
end
% Things beyond here are outside of your function
