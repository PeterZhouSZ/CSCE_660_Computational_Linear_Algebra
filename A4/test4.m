n = 500;
A = rand(n) ; 
A = A' * A ;
R = mychol(A);
err = norm(R * R' - A);
if err > 1e-12 
    error('!')
end
    