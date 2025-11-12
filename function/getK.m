function [k] = getK(Y)
%输入标签集，返回类别数
k_m = [];
for i = 1:length(Y)
    if ismember(Y(i),k_m)
       continue; 
    end
    k_m = [k_m,Y(i)];
end

k = length(k_m);

end

