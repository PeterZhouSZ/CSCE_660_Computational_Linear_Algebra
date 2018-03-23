clear
rng default
L = tril (rand (12,5)) ;
[H, Rho, L1] = hl (L) ;
L1

err = norm (L'*L - L1'*L1)
if (err > 1e-12)
    error ('L1 wrong') ;
end

A = rand (12,5) ;
b = rand (12,1) ;
x1 = A\b ;
x2 = cline (A,b) ;
err = norm (x1-x2)
if (err > 1e-12)
   error ('x wrong') ;
end