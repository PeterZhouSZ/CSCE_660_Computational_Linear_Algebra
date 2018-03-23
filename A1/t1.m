% HW1 test code

clear
rng default

%-------------------------------------------------------------------------------
% test firstcol:

A = rand (10) ;
x = rand (4,1) ;
y = firstcol (A,x) ;

% brute force:
n = size (A) ;
r = length (x) ;
I = eye (n) ;
M = I ;
for k = r:-1:1
    M = (A - x(k)*I) * M ;
end
y2 = M (:,1) ;

err = norm (y - y2)
if (err > 1e-12)
    error ('!')
end

%-------------------------------------------------------------------------------
% test outerk:
x = rand (100,1) ;
y = rand (100,1) ;
k = 10 ;

A = outerk (x,y,k) ;

% brute force
A2 = (x*y')^k ;
err = norm (A-A2) / norm (A)
if (err > 1e-12)
    error ('!')
end

%-------------------------------------------------------------------------------
% test colsaxpy

C = rand (10) ;
A = triu (rand (10)) ;
B = tril (rand (10)) ;

C0 = colsaxpy (C, A, B) ;

% brute force
C1 = C + A*B ;

err = norm (C0-C1)
if (err > 1e-12)
    error ('!')
end

%-------------------------------------------------------------------------------
% test blockmxm

% one test is enough ...

maxerr = 0 ;

for trials = 1:1

    m = randi (50) ;
    n = randi (50) ;
    k = randi (50) ;

    C = rand (m,n) ;
    A = rand (m,k) ;
    B = rand (k,n) ;

    % create a random set of blocks
    m_nblocks = randi (m) ;
    n_nblocks = randi (n) ;
    k_nblocks = randi (k) ;

    mstart = sort (randperm (m, m_nblocks)) ;
    nstart = sort (randperm (n, n_nblocks)) ;
    kstart = sort (randperm (k, k_nblocks)) ;

    if (mstart (1) ~= 1)
        mstart = [1 mstart] ;
    end

    if (kstart (1) ~= 1)
        kstart = [1 kstart] ;
    end

    if (nstart (1) ~= 1)
        nstart = [1 nstart] ;
    end

    mm = diff ([mstart m+1]) ;
    nn = diff ([nstart n+1]) ;
    kk = diff ([kstart k+1]) ;

    assert (sum (mm) == m)
    assert (sum (nn) == n)
    assert (sum (kk) == k)

    C1 = blockmxm (C,A,B,mm,nn,kk) ;
    C2 = C + A*B ;

    err = norm (C1-C2) ;
    maxerr = max (maxerr, err) ;
    if (err > 1e-12)
        error ('!')
    end
end

% try with a single block
C1 = blockmxm (C,A,B,m,n,k) ;

C2 = C + A*B ;
err = norm (C1-C2) ;
if (err > 1e-12)
    error ('!')
end
maxerr = max (maxerr, err)
