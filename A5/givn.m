function [ Q ] = givn( x, y )

m = size(x, 1);

Gy = eye(m);
Gx = eye(m);

for i =2:m
    yy = [y(1),y(i)]';
    G2 = givens(yy);

    for j = 1:m
        e1 = Gy(1, j);
        e2 = Gy(i, j);
        c = G2(1,1);
        s = G2(1,2);
        Gy(1, j) = c*e1 - s*e2;
        Gy(i, j) = s*e1 + c*e2;
    end 
    y(1) = sqrt(y(1) * y(1)+y(i)*y(i));
end

for i = 2:m
    xx = [x(1),x(i)]';
    G1 = givens(xx);
    for j = 1:m
        e1 = Gx(1, j);
        e2 = Gx(i, j);
        c = G1(1,1);
        s = G1(1,2);
        Gx(1, j) = c*e1 - s*e2;
        Gx(i, j) = s*e1 + c*e2;
    end
  
    x(1) = sqrt(x(1) * x(1) + x(i)*x(i));
end

Q = Gx' * Gy;

end

