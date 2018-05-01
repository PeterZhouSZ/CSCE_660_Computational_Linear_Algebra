
%p1
m = 6; 
n = 3;
A = rand(m);
A = A(:, 1:n);
[Q, L] = ql(A);

% p2
n = 10;
A = rand(n);
A = A * A';
e = eigchol(A);
err = norm(e - eig(A));
if(err > 1e-10)
    error ('wrong')
end