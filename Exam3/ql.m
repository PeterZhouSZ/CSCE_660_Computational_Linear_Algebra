function [Q,L]=ql(A)
%QL Summary of this function goes here
%   Detailed explanation goes here

m = size(A, 1);
n = size(A, 2);
Q = eye(m);

for i = n:-1:1
     x = [A(i, i); A(1:i-1, i); A(n+1:m, i)];
     [rho,u] = make_house(x);
     
     Anew = apply_house(rho, u, [A(i,:); A(1:i-1,:); A(n+1:m, :)]);
     Qnew = apply_house(rho, u, [Q(i,:); Q(1:i-1,:); Q(n+1:m, :)]);
     
     A(i, :) = Anew(1,:);
     A(1:i-1, :) = Anew(2:i, :);
     A(n+1:m, :) = Anew(i+1:end, :);
     
     Q(i, :) = Qnew(1,:);
     Q(1:i-1, :) = Qnew(2:i, :);
     Q(n+1:m, :) = Qnew(i+1:end, :);

end

L = A;
Q = Q';

end

