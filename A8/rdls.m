function [ x ] = rdls( A, b )
%RDLS Summary of this function goes here
%   Detailed explanation goes here
r = size(A, 1);
[Q,R] = myqr (A');
z = R(1:r, 1:r)'\b;
x = Q(:,1:r)*z;
end

