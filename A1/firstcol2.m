function [ m ] = firstcol2( A, x )
%  bruteforce

r = size(x,1);
[n,]= size(A);
I = eye(n);
M = I;

for i = 1:r
    M = M * (A - x(i) * I);
end

m = M(:,1);

end

