function [Q,R] = myqr (A)
%
% [Q,R] = myqr (A) computes the full QR factorization
% (not the "economy size").  Q*R=A, where Q is m-by-m,
% R is m-by-n, and A is m-by-n.
% R is upper triangular, and Q is orthogonal (Q'*Q=I).
%
% An alternative to forming Q is to store all the
% vectors u.  The first vector of u is of size m,
% the second is of size m-1, and so on.  There are only
% n such vectors, so "Q" can be represented in an
% m-by-n lower triangular matrix.

[m n] = size (A) ;
Q = eye (m) ;

for k = 1:min(m,n)

    % construct a Householder transformation Hk
    % that zeros out A (k+1:m,k)
    [rho, u] = make_house (A (k:m,k)) ;

    % apply it to A (k:n, k:n).  This does A = Hk*A
    A (k:m, k:n) = apply_house_left (rho, u, A (k:m, k:n)) ;

    % A (k+1:m, k) is now "zero", but roundoff error may make
    % it contain small nonzero values.  Force them to be zero.
    A (k+1:m, k) = 0 ;

    % apply it to Q.  This does Q = Q*Hk
    Q ( : , k:m) = apply_house_right (rho, u, Q ( : , k:m)) ;

end

% We now have converted A into upper triangular form.
R = A ;
