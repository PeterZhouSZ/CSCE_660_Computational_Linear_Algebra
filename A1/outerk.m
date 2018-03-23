function [ C ] = outerk( x, y, k )
%  an 0(n^2) algorithm for computing C=(x*y')^k

s = y'*x;
C = x*y'*s^(k-1);

end

