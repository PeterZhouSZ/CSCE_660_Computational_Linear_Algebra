
%%3.1.7
clear;
n = 200;
[L,U,P]=lu(rand(n));
U(n,n)=0;
z = unull(U); 
zv = U * z;  % check if U*z = 0
zt = zeros(n,1); %zero vector

err = norm(zv-zt);
if (err > 1e-12)
    error ('!')
end

%%recursive LU with partial pivoting
clear;
n = 150;
A = rand(n);
[Lt, Ut, Pt] = lu(A);  % matlab solution
[L, U, P] = reclu(A);

err1 = norm(Lt-L);
err2 = norm(Ut-U);
err3 = norm(Pt-P);

if(err1 > 1e-12 || err2 > 1e-12 || err3 > 1e-12)
    error('!')
end

%%