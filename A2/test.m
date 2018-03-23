[Q,R]=qr(rand(100));
v = rand(100,1);
A=qpower(Q,v);
%disp(A);
B=qpower2(Q,v);%bruteforce
err = norm (B-A);
if (err > 1e-12)
    error ('!')
end

%disp(B);

clear;
[Q,R]=qr(rand(3));
v = rand(3,1);
A=qpower(Q,v);
disp(A);
B=qpower2(Q,v);%bruteforce
disp(B);
err = norm (B-A);
if (err > 1e-12)
    error ('!')
end