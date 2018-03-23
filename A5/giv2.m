function [ G ] = giv2( x, y )

G1 = givens(x);
G2 = givens(y);

G = G1 * G2';

end

