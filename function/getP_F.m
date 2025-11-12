function [F_cell] = getP_F(X,wt,k,F)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
d = size(X,1);
w = reshape(wt,d,k)';
A = (w*X);
% 找到每列的第 k 大值和索引
[sorted_values, sorted_indices] = sort(A, 'descend');
% 获取每列的第 k 大值
%Fth_largest_values = sorted_values(F, :);
% 获取每列第 k 大值所在的索引
Fth_largest_indices = sorted_indices(F, :);

% 输出每列的第 k 大值
%disp(kth_largest_values);

% 输出每列第 k 大值所在的索引
%F_cell = disp(Fth_largest_indices);
F_cell =Fth_largest_indices;

end
