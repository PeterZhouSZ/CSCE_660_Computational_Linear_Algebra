clear;
n = 10;
A = rand(n);
[L,U,P]= lu(A);

L_s = single(L);
U_s = single(U);

X_true = rand(n,1);         % this is the exact solution
B = A * X_true;

X_t = U\(L\(P * B));        % this is the solution solved by double precision L, U
X_s = U_s\(L_s\(P * B));    % this is the solution solved by single precision L, U

x = X_s;
x = double(x);              % change x to higher precision

for i= 1:10                 % do iterative refinement
    r = B - A * x;
    
    z = U_s\(L_s\(P * r));
    z = double(z);
    x = x + z;
end

err = norm(X_s - X_true);   %  the error between the single precision solution and the exact one
err_t = norm(X_true - X_t); %  the error between the double precision solution and the exact one
err_ref = norm(x - X_true); %  the error between the refined solution and the exact one
disp("single precision error: ")
disp(err)
disp("double precision error: ")
disp(err_t)
disp("iterative refined error: ")
disp(err_ref)



