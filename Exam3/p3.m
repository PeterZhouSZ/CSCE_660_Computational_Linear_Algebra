Prob = ssget (2301) ;
A = Prob.A ;
disp (Prob.notes)

n = 5;
m = size(A,2);

row = 600;
col = 188;

tic
r = A(1,:);
t1 = toc

tic
r = A(m,:);
t2 = toc

tic
r = A(col,:);
t3 = toc

disp('nonzero in the current column')
nnz(A(:, col))

tic
r = A(1, col);
t4 = toc

tic
r = A(m, col);
t5 = toc

tic
r = A(row, col);
t6 = toc

add = rand(m,1);
A(:,col) = add;
nnz(A(:,col))

tic
r = A(1, col);
t7 = toc

tic
r = A(m, col);
t8 = toc

tic
r = A(row, col);
t9 = toc



