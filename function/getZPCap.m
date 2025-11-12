function [ZCap,PCap] = getZPCap(Z,P,c,g,d,k)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
h = length(c);
ZCap = zeros(d*k,h);
PCap = zeros(1,h);
for i = 1:h
    ZCap(:,i) = Z*c{i}'/g;
    PCap(1,i) = P*c{i}'/g;
end
end

