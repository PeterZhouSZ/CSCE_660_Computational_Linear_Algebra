function [A] = mygivensqr(A)

n = size(A, 1);

for z= n+1:-1:3
   j = 1;
   for i = z-1:n
        G = givens([A(i-1, j) A(i, j)]');     
        A(i-1:i, j:n) = G' * A(i-1:i, j:n);  
        j= j+1;
   end
end

end

