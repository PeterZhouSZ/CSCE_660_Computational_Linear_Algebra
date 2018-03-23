function [ H, Rho, L1 ] = hl( L )
%HL Summary of this function goes here
%   Detailed explanation goes here

m = size(L, 1);
n = size(L, 2);
H = [];
Rho = [];
L1 = zeros(m,n);

for i = n:-1:1
    x = [L(i, i); L(n+1:m, i)];
    [rho,u] = make_house(x);
    Lnew = apply_house(rho, u, [L(i,:);L(n+1:m, :)]);
    Rho = [Rho; rho];
    H = [H, u];
    L(i, :) = Lnew(1,:);
    L(n+1:m, :) = Lnew(2:m-n+1, :);
end

L(n+1:m, :) = zeros(m-n,n);
L1 = L;
end

