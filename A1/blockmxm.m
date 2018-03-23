function [ D ] = blockmxm( C,A,B,mm,nn,kk )
% Compute C = C + A*B, where A is a m x k matrix, B is a k x n matrix, C is
% a m x n matrix.
%  m = sum(mm) n = sum(nn) k = sum(kk)

D = C;
ii = 1;

for i=1:size(mm,1)
    % current row block size
    mi = mm(i);
    I = ii : ii+mi-1;
    jj = 1;
    
    for j=1:size(nn,1)
        % current column block size
        nj = nn(j); 
        J = jj : jj+nj-1;   
        ss = 1;
        
        for s=1:size(kk,1)
            
            ks = kk(s); 
            K = ss : ss+ks-1;
            
            D(I,J) = D(I,J) + A(I,K) * B(K,J);
            ss = ss + ks;
        end 
         jj = jj + nj;   
    end
    ii = ii + mi;
end

end

