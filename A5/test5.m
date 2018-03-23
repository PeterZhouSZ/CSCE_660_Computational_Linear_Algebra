clear;
n = 2;
x = randn(n,1); x = x/norm(x);
y = randn(n,1); y = y/norm(y);
G = giv2(x, y);

err = norm(G' * x - y);
if err > 1e-12 
    error('!')
end

%%
clear;
n = 10;
x = randn(n,1); x = x/norm(x);
y = randn(n,1); y = y/norm(y);
G = givn(x, y);

err = norm(G' * x - y);
if err > 1e-12 
    error('!')
end

%%
clear;
n = 10;
A = rand(n);
R = mygivensqr(A);
err = norm(A' * A - R' * R);
if err > 1e-12 
    error('!')
end


