function G = givens(x)
%GIVENS find a Givens rotation.
% Example:
%   G = givens ([a b]')
%
% Returns a 2-by-2 Givens rotation G such that y=G'*x where y(1)=norm(x) and
% y(2)=0.  Both x and y are vectors of length 2.  See also Golub and Van Loan,
% algo 5.1.3.

a = x (1) ;
b = x (2) ;

%   if (b == 0)
%       c = 1 ; s = 0 ;
%   elseif (abs (b) > abs (a))
%       tau = -a/b ; s = 1 / sqrt (1+tau^2) ; c = s*tau ;
%   else
%       tau = -b/a ; c = 1 / sqrt (1+tau^2) ; s = c*tau ;
%   end

if (b == 0)
    c = 1 ;
    s = 0 ;
else
    r = sqrt (a^2 + b^2) ;
    c = a/r ;
    s = -b/r ;
end

G = [c s ; -s c] ;