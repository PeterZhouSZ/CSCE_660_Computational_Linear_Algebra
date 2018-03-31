function [ L, D, P ] = bpldl( A )
%BPLDL Summary of this function goes here

alpha = (1+sqrt(17))/8;
n = size(A, 1);
L = eye(n,n); 
P = eye(n,n);
D = zeros(n,n); 
k = 1;

while k<=n

B = abs(A(k:n, k:n));
% get the row and col index of mu1
mu1 = max(diag(B)); 
[r1, c1] = find(B == mu1); 
row1 = r1(1);

% get the row and col index of mu0
for t = 1:size(B,1)
    B(t,t) = -inf;  % find the maximum entry in the off-diag in subA
end
mu0 = max(max(B));
[r0, c0] = find(B == mu0);
row0 = r0(1);col0=c0(1);
if mu0 == -inf
    mu0 = 0.0;
end

%Bunch-Parlett pivot strategy
if mu1 >= alpha * mu0 || k==n 
    % s = 1, choose P1 so abs(e11) = mu1
    pivot = k+row1-1;
    
    A([k pivot],k:n) = A([pivot k],k:n);
    A(k:n,[k pivot]) = A(k:n,[pivot k]);
    L([k pivot],1:k-1) = L([pivot k],1:k-1);
    P([k pivot],:) = P([pivot k],:);
    
    L(k+1:n,k) = A(k+1:n,k)/A(k,k);  % compute CE^-1
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - L(k+1:n,k)*A(k+1:n,k)'; % compute B-CE^-1*C'
    D(k,k)=A(k,k);
    
    k = k + 1; 
else   
    % s = 2, choose P1 so abs(e21) = mu0
    
    pivot_row = k+row0-1;
    pivot_col = k+col0-1;
    
    % swap mu0 to e21; permute both row and col to keep symmetric
    A([k+1 pivot_row],k:n) = A([pivot_row k+1],k:n);
    A(k:n,[k+1 pivot_row]) = A(k:n,[pivot_row k+1]);
    P([k+1 pivot_row],:) = P([pivot_row k+1],:);
    L([k+1 pivot_row],1:k-1) = L([pivot_row k+1],1:k-1);

    A([k pivot_col], k:n)= A([pivot_col k], k:n);
    A(k:n, [k pivot_col])= A(k:n, [pivot_col k]); 
    P([k pivot_col], :)= P([pivot_col k], :); 
    L([k pivot_col], 1:k-1)= L([pivot_col k], 1:k-1);

    L(k+2:n,k:k+1)  = A(k+2:n,k:k+1)/A(k:k+1,k:k+1); % L = CE^-1 = C/E
    A(k+2:n,k+2:n) = A(k+2:n,k+2:n) - A(k+2:n,k:k+1)*L(k+2:n,k:k+1)'; 
    % Give err slightly > e-12 when I tried:  
    % A(k+2:n,k+2:n) = A(k+2:n,k+2:n) - L(k+2:n,k:k+1)*A(k+2:n,k:k+1)'; 
    D(k:k+1,k:k+1) = A(k:k+1,k:k+1);
    
    k = k + 2;
end
end
end

