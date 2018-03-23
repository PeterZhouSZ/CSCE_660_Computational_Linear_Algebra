function [ x ] = cline( A, b )
%CLINE Summary of this function goes here
% Based on *AN ELIMINATION METHOD FOR THE SOLUTION OF LINEAR LEAST SQUARES PROBLEMS*

m = size(A, 1);
n = size(A, 2);

[L,U,P] = lu(A);
[ H, Rho, L1 ] = hl( L );

% rearrange b 
c = P * b;

for i = n:-1:1
   
   u = H(:, n-i+1);
   rho = Rho(n-i+1);
   
   csub = [c(i);c(n+1:m)];
   csubn = apply_house(rho, u, csub);
   
   % update c vector 
   c(i)= csubn(1);
   c(n+1:m) = csubn(2:m-n+1);
  
end

% d is the first n components of Q*c

d = c(1:n);
z= L1(1:n,:) \d;
x = U \ z;

end

