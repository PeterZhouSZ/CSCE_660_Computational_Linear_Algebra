A = [1 4 2 3; 0 5 1 7;];
b = [1; 2];
xls = rdls(A, b);
xbasic = A\b;
norm(xls)
norm(xbasic)