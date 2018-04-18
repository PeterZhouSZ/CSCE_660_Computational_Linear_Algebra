function [ x, count ] = google( H )
%GOOGLE Summary of this function goes here
%   Detailed explanation goes here
alpha = 0.85;

n = size(H, 1);
c = sum(H);
k = find(c~=0);

C = sparse(k, k, 1./c(k), n, n);

u = zeros(1,n);
for i = 1:n
    if c(i) == 0
        % If the column sum is zero, probability matrix P needs to have
        % P(:,j) = 1/n.
        u(i) = 1/n;
    else
        u(i) = (1-alpha)/n;
    end
end

% A is sparse 
A = alpha*H*C;

x = ones(n,1)/n;
xold = zeros(n,1);
count = 0;

while (max (abs (xold-x)) > 1e-8)
xold = x;
% Avoid making a huge dense matrix A + ones(n).
x = A * x + ones(n,1) *(u * x);
count = count + 1;
end

x = x/sum(x);

end

