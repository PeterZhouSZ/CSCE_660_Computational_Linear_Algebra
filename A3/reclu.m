function [ L, U, P ] = reclu( A )
%   A recursive LU factorization algorithm that handles partial pivoting. A
%   is square. 

n = size(A, 1);
U = zeros(n);
L = zeros(n);
P = eye(n);
if(n>=1)
    [pivot, k] = max(abs(A(:,1)));  % choose pivot entry with row index k.
    if(k>1)
        A([1,k],:) = A([k,1],:);  % swap two rows.
        P([1,k],:) = P([k,1],:);
    end

    L(1,1) = 1;
    U(1,1) = A(1,1);
    U(1,2:n) = A(1, 2:n);
    L(2:n, 1) = A(2:n,1)/U(1,1);

    [L2, U2, P2] = reclu(A(2:n,2:n)-L(2:n,1)*U(1,2:n)); % recursive call
    L(2:n, 2:n) = L2;
    U(2:n, 2:n) = U2;

    Pt = eye(n);  % compute permutation matrix
    Pt(2:n,2:n) = P2;
    P = Pt * P;

    L(2:n,1)= P2*L(2:n,1);  % remember to swap l_21 after recursive call
end

end

