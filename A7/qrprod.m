function [ Q, R ] = qrprod( A )
% To compute the QR factorization of the product A = A_p * ... * A_2 * A_1
% without explicitly multiplying the matrices together

p = size(A, 2);
n = size(A{1},1);
Q = eye(n);
R = eye(n);

for i = 1:p
   [Q, R1] = myqr(A{i}*Q);
   R = R1 * R;
end
end

