function [ A ] = qpower2( Q, v )
%BRUTEFORCE
n = size(Q,1);
A = zeros(n);
for i = 1:n
   for j = 1:n
        
        A(i,j) = v'* (Q^i)'*(Q^j)*v;
   
   end 
end

end

