function [ A ] = qpower( Q, v )

n = size(Q,1);
A = zeros(n);
i = 1;
for j= 1:n
    s = v'*Q^(j-i)*v;
    a = zeros(n-j+i,1);
    a(:,1) = s; % each diag has the same value
    if(j==1)
        A = A + diag(a,j-i); % 0-diag only adds once
    end
    if(j>1)
        A = A + diag(a,j-i) + diag(a,i-j); % symmetric
    end
end
end
