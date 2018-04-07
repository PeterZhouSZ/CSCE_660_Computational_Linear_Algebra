function [ U,Bnew,V ] = chase( B )
%CHASE Summary of this function goes here
%   Detailed explanation goes here

n = size(B, 1);
V = eye(n);
U = eye(n);

for i = n-1:-1:1
x = [B(i, i) B(i, n)]';
G = givens(x);
B(:,[i, n]) = B(:,[i, n])*G;
V(:,[i, n]) = V(:,[i, n])*G;
end

Bnew = B;

end

