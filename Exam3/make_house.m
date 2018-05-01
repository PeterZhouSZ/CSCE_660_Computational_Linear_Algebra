function [rho,u] = make_house (x)
% [rho,u] = make_house (x)
%
% construct a Householder transformation
% H = I - rho*u*u' so that H*x is all zero
% except for the 1st entry.  x is a vector.

if (x (1) < 0)
    s = -1 ;
else
    s = 1 ;
end

sigma = s * norm (x) ;
u = x ;
if (sigma == 0)
    rho = 1 ;
else
    u (1) = u (1) + sigma ;
    rho =  1 / (sigma * u (1)) ;
end
