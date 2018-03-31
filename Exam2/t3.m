% test script for qrprod.m
clear
rng default
err1max = 0;
err2max = 0;
for p = 1:50
    for n = 1:50
        for k = 1:p
            A {k} = rand (n) ;
        end
        % brute force
        Aprod = A {1} ;
        for k = 2:p
            Aprod = A {k} * Aprod ;
        end
        [Q,R] = qr (Aprod) ;
        err1 = norm (Q*R-Aprod, 1) / norm (Aprod, 1) ;
        % incremental
        [Q,R] = qrprod (A) ;
        err2 = norm (Q*R-Aprod, 1) / norm (Aprod, 1) ;
        if (err2 > 1e-12)
            error ('!') ;
        end
        err1max = max (err1max, err1) ;
        err2max = max (err2max, err2) ;
    end
end
err1max
err2max
