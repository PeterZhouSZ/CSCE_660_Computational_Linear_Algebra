function [e] = eigchol(A)
%
%   computes the eigenvalues of A
n = size(A, 1);
x0 = diag(A);
x1 = zeros(n, 1);
iter = 0;

while norm(x1 - x0) > 1e-13
    R = mychol(A);
    x0 = diag(A);
    A = R' * R; 
    x1 = diag(A);
    iter = iter + 1;
end

e = diag(A);

end

