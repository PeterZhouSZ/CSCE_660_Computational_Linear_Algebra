clear;
n = 10;
d1 = rand(n, 1);
d2 = rand(n-1, 1);

B = diag(d1);
B = B + diag(d2, 1);
B(n, n) = 0.0;

[U, Bnew, V] = chase(B);
err = norm(B) - norm(Bnew);

if (err > 1e-12)
    error ('wrong') ;
end