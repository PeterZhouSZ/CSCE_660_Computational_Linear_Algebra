function [ z ] = unull( U )
%   U is upper triangular with U(n,n)=0

n = size(U,1);
z = zeros(n, 1);

z(n) = 1;
for i = n-1:-1:1
    z(i)=(z(i)-U(i,i+1:n)*z(i+1:n))/U(i,i);
end

end

