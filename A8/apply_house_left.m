function hx = apply_house_left (rho, u, x)
%
% hx = apply_house_left (rho, u, x)
%
% Apply a Householder transformation
% H*x, where H = I - rho*u*u'
%
% u is a column vector of size n,
% x may be a vector or matrix, with n rows.
% Note the equation on page 6 of Chapter 5
% only works if x is a vector.
% H is n-by-n, but is not explicitly formed.

hx = x - u * (rho * (u' * x)) ;

