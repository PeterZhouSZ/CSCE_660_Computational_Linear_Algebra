disp('-----------------------------------');
clear;
disp('P1.1.1');
A = rand(5);
x = rand(6,1);
y1 = firstcol(A,x);
y2 = firstcol2(A,x);

disp('case1');
disp('Bruteforce solution:');
disp(y2);
disp('firstcol:');
disp(y1);

clear;
A = rand(3);
x = rand(2,1);
y1 = firstcol(A,x);
y2 = firstcol2(A,x);

disp('case2');
disp('Bruteforce solution:');
disp(y2);
disp('firstcol:');
disp(y1);

disp('-----------------------------------');
clear;
disp('P1.1.3');
x = rand(3,1);
y = rand(3,1);
k = 5;

disp('case1');
A2 = outerk2(x,y,k);
disp('Bruteforce solution:');
disp(A2);
A = outerk(x,y,k);
disp('outerk:');
disp(A);

clear;
x = rand(5,1);
y = rand(5,1);
k = 3;

disp('case2');
A2 = outerk2(x,y,k);
disp('Bruteforce solution:');
disp(A2);
A = outerk(x,y,k);
disp('outerk:');
disp(A);

disp('-----------------------------------');
clear;
disp('P1.2.3');

R = rand(3);
A = triu(R);
B = tril(R);
C = rand(3);

E = C + A*B;

disp('case1');
disp('The correct result should be:');
disp(E);

D = colsaxpy(C, A, B);
disp('colsaxpy:');
disp(D);

clear;
R = rand(5);
A = triu(R);
B = tril(R);
C = rand(5);

E = C + A*B;

disp('case2');
disp('The correct result should be:');
disp(E);

D = colsaxpy(C, A, B);
disp('colsaxpy:');
disp(D);

disp('-----------------------------------');
clear;
disp('Block matrix multiplication');
A = rand(3,2);
B = rand(2,3);
C = rand(3);

% First, compute matrix multiplication directly
E = C + A*B;
disp('The correct result should be:');
disp(E);

% one set of mm, nn, kk
mm = [1;1;1];
nn = [2;1];
kk = [1;1];
D = blockmxm(C,A,B,mm,nn,kk);
disp('case1');
disp(D);

% use another set of mm, nn, kk
mm = [2;1];
nn = [1;2];
kk = [2];
D = blockmxm(C,A,B,mm,nn,kk);
disp('case2');
disp(D);
disp('-----------------------------------');






