function [ C ] = colsaxpy( C, A, B )
% C is a nxn matrix, A is a nxn upper tri, B is a nxn lower tri

n = size(A,1);

for j= 1:n
    for k = j:n
        for i = 1:k
            C(i,j) = C(i,j)+A(i,k)*B(k,j);
        end
    end
end

end

