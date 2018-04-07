function hx = apply_house_right (rho, u, x)
%
% hx = apply_house_right (rho, u, x)
%
% Apply a Householder transformation
% x*H, where H = I - rho*u*u'
%
% u is a column vector of size n,
% x may be a row vector or matrix, with n columns.
% H is n-by-n, but is not explicitly formed.

hx = x - (x * (rho * u)) * u' ;

