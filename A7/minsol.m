%P5.6.2 Find the minimal norm solution to the system Ax = b where A = [1 2
%3] and b = 1.

A = [1 2 3];
m = size(A, 1);
b = 1;
[Q,R] = myqr (A');
z = R(1:m, 1:m)'\b;
x = Q(:,1:m)*z;
x0 = A\b;
diff = norm(x)-norm(x0);

