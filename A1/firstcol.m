function [ m ] = firstcol( A, x )

n = size(A,1);
e1 = zeros(n,1);
e1(1) = 1;

I = eye(n);
r = size(x, 1);

m = (A - x(r)*I)*e1;

for i=1:size(x,1)-1
    m = (A - x(r - i)*I)* m;
end

end

