function [p_cell] = getP_m(X,wt,k)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
d = size(X,1);
w = reshape(wt,d,k)';
A = (w*X);
[~,p_cell] = max(A);

end

