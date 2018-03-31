% test code for bpldl
clear
rng default
errmax = 0 ;
for n = 1:100
    for trial = 1:10
        A = rand (n) ;
        A = A + A' ;
        [L,D,P] = bpldl(A);
        err = norm (L*D*L' - P*A*P', 1) / norm (A,1) ;
        if (err > 1e-12)
            error ('!') ;
        end
        errmax = max (err, errmax) ;
    end
end
errmax
