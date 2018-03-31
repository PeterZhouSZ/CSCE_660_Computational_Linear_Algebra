function [Q,R] = myqrsteps (A, steps)
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
%
% Same as myqr, except that extra stuff is printed as we go.

[m n] = size (A) ;
Q = eye (m) ;

for k = 1:n

    % construct a Householder transformation Hk
    % that zeros out A (k+1:m,k)
    [rho, u] = make_house (A (k:m,k)) ;

    fprintf ('===================================== k: %d\n', k) ;
    rho
    u
    Hk = eye (m) ;
    Hk (k:m,k:m) = eye (m-k+1) - rho * u * u' ;
    fprintf ('Hk (k:m,k:m) = I - rho*u*u = \n')
    disp (Hk)
    fprintf ('Hk*A = \n') ;
    disp (Hk*A) ;

    % apply it to A (k:n, k:n).  This does A = Hk*A
    A (k:m, k:n) = apply_house (rho, u, A (k:m, k:n)) ;

    A
    fprintf ('Hk*Q = \n') ;
    disp (Hk*Q)

    % apply it to Q.  This does Q = Hk*Q
    Q (k:m,  : ) = apply_house (rho, u, Q (k:m,  : )) ;

    Q
    pause

end

% We now have converted A into upper triangular form
R = A ;

% Q' = H{n} * H{n-1} * H{n-2} * ... * H{2} * H{1} has
% just been computed.  Transpose it to get Q.
Q = Q' ;

