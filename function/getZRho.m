function [Z,Rho] = getZRho(X,p_cell,k,d,n,F_cell)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
Z = zeros(k*d,n);
Rho = zeros(k*d,k*k);
index = 1;
Rho_index = 1;
   for j = 1:n
       Z(:,index) = getPhi(X(:,j),X(:,j),p_cell(j),F_cell(j),k,d);%取z矩阵的第index列
       index = index+1;     
   end
 for i = 1:k 
   for j = 1:k
       if i == j
           continue 
       end
       Rho(:,Rho_index) = getPhi(sum(X,2),sum(X,2),i,j,k,d);%对每行求和
       Rho_index = Rho_index+1;
   end
end
Z = Z(:,1:(index-1));
Rho = Rho(:,1:(Rho_index-1));
end

