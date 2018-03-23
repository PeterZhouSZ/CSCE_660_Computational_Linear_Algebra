
% Problem p3.5.1: row and column scaling



list = [ 464 253 264 263 61 70 265 188 192 1326 69 2734 63 66 ...
         1139 268 267 76 1639 315 212 190 193 269 1627 73 328 270 ...
         1637 74 450 2750 451 1207 2751 2754 2752 2755 2753 1638 ...
         2673 271 2735 272 2722 208 2689 314 1640 1790 1327 1535 836 ...
         986 997 998 999 1000 258 259 2674 460 1613 2675 1378 1537 75 ...
         2666 2723 2676 545 1623 244 1539 2696 459 456 457 458 1536 ...
         837 1621 243 213 2677 466 189 191 2678 1625 917 454 1547 ...
         2679 2667 2724 2725 568 2350 2680 ] ;

index = ssget ;
results = inf(3, 10, 100);      % save the condition number, relative residual, relative error
findm = zeros(10, 3, 'int8' );  % count the final results
for k = 1:length (list)
    id = list (k) ;
    Prob = ssget (id) ;
    A = Prob.A ;
    q = colamd (A) ;
    A = A (:,q) ;               % assume A already permuted to reduce fillin
    n = size (A,1) ;
    xtrue = rand (n,1) ;
    b = A*xtrue ;
    I = speye (n) ;
    thresh = 0.1 ;

    % fprintf ('\nMatrix: %d:%4d %s\n', k, id, Prob.name) ;
    mink = inf(3,1);
    minm = zeros(3, 1, 'int8');

    for method = 1:10     
        if method == 1
            r = 1 ./ sum (abs (A'))' ; 
            R = spdiags (r, 0, n, n);
            D = R * A;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ (P * R * b ))) ;        
        end
        if method == 2
            r = 1 ./ max (abs (A'))' ; 
            R = spdiags (r, 0, n, n) ;
            D = R * A;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ (P * R * b ))) ;       
        end      
        if method == 3
            c = 1 ./ sum (abs (A))'  ; 
            C = spdiags (c, 0, n, n) ;
            D = A * C;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ (P * b ))) ;
            x = C * x ;
        end
        if method == 4
            c = 1 ./ max (abs (A))'  ; 
            C = spdiags (c, 0, n, n) ;
            D = A * C;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ (P * b ))) ;
            x = C * x ;
        end
        if method == 5
            r = 1 ./ sum (abs (A'))' ; 
            R = spdiags (r, 0, n, n);
            c = 1 ./ sum (abs (A))'  ; 
            C = spdiags (c, 0, n, n) ;

            D = R * A * C;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ ( P * R * b ))) ;
            x = C * x ;       
        end  
        if method == 6
            r = 1 ./ max (abs (A'))' ; 
            R = spdiags (r, 0, n, n);
            c = 1 ./ max (abs (A))'  ; 
            C = spdiags (c, 0, n, n) ;

            D = R * A * C;
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ ( P * R * b ))) ;
            x =  C * x ;
        end
        if method == 7
            r = 1 ./ sum (abs (A'))' ; 
            R1 = spdiags (r, 0, n, n);      
            c = 1 ./ sum (abs (R1 * A))'  ; 
            C1 = spdiags (c, 0, n, n) ;

            r = 1 ./ sum (abs ( (R1 * A) * C1 ) )' ; 
            R2 = spdiags (r, 0, n, n);
            D = R2 * ((R1 * A) * C1);
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ ( P * R2 * R1 * b ))) ;
            x = C1 * x ;
        end
        if method == 8
            r = 1 ./ max (abs (A'))' ; 
            R1 = spdiags (r, 0, n, n);
            c = 1 ./ max (abs (R1 * A))'  ; 
            C1 = spdiags (c, 0, n, n) ;

            r = 1 ./ max (abs ( (R1 * A) * C1 ) )' ; 
            R2 = spdiags (r, 0, n, n);
            D = R2 * ((R1 * A) * C1);
            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ ( P * R2 * R1 * b ))) ;
            x = C1 * x ;
        end
        if method == 9
            D = A;

            [L,U,P] = lu (D, thresh) ;
            x = (U \ (L\ ( P * b ))) ;
        end   

        if method == 10
            %spparms ('spumoni',3) ;
            x = A\b;
            %spparms ('spumoni',0) ;
        end     
        
        c = condest(D);

        rres = norm (b - A * x) / norm(b);      % compute the relative residual
        rerr = norm (x - xtrue) / norm(xtrue);  % compute the relative error

        results(1, method, k) = c;              % save the three results
        results(2, method, k) = rres;
        results(3, method, k) = rerr;
        
       if rres < mink(1) && method ~= 10
           mink(1) = rres;
           minm(1) = method;
       end

       if rerr < mink(2) && method ~= 10
           mink(2) = rerr;
           minm(2) = method;
       end

       if c < mink(3) && method ~= 10
            mink(3) = c;
            minm(3) = method;
       end
    end
    
    for t = 1:3
        findm(minm(t), t) = findm(minm(t), t) + 1; % count the number
    end 
    
end

disp(findm')
