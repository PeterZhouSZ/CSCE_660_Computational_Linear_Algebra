function [ R ] = mychol( A )
% R = mychol (A)
%
% Find an upper triangular R so that A=R*R'

n = size(A, 1);

if n > 1
    R(n,n) = sqrt(A(n, n));
    R(1:n-1, n) = A(1:n-1, n)/R(n, n);
    R(1:n-1, 1:n-1) = mychol( A(1:n-1, 1:n-1) - R(1:n-1, n) * R(1:n-1, n)' );
end

if n==1
    R(n,n) = sqrt(A(n, n));
end

end
