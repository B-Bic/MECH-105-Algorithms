function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

% Set n and m
n = size(A,1);
m = size(A,2);
h = n-1;

% Error for n not = m
if m ~= n
    error('n must equal m')
end

% Set up P inital matrix
Pi = zeros(n,m);
PS = zeros(n,m);
for i = 1:n
    Pi(i,i) = 1;
end

% sorts the first column of matrix
A1=zeros(n,n)
L = eye(n,m);
A1 = A;
j=1;
k=1;
        for i=1:n
            for g=1:n
                if abs(A(j,k)) < abs(A(g,k))
                    A1(j,:) = A1(g,:);
                    A1(g,:) = A1(j,:);

                    PS(j,:) = Pi(g,:);
                    PS(g,:) = Pi(j,:);
                else
                    PS(g,:) = Pi(g,:);
                end
                
            end

            for o = (i+1):n
                 MF  = A1(o,i) ./ A1(i,i)
                 L(o,i) = MF
                 EQ = A1(i,:).*MF - A1(o,:)                
                 A1(o,:) = EQ
                 
            end            
        end
U = A1
U(2,:)=-U(2,:)
P = PS;

end