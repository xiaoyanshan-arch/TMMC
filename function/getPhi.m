function [Phi] = getPhi(x1,x2,p,r,k,d)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
Phi = zeros(k*d,1);
Phi(((p-1)*d+1):((p-1)*d+d),1) = x1;
Phi(((r-1)*d+1):(r*d),1) = Phi(((r-1)*d+1):(r*d),1) - x2;

end

