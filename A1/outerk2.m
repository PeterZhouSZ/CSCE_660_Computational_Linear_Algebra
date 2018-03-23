function [ C ] = outerk2( x, y, k )
%   bruteforce

A = x*y';
[n,]=size(A);
C = eye(n);

for i = 1:k
    C = C * A;
end

end
