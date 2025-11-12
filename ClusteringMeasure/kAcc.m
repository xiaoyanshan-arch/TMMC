function acc = Acc(Label1,Label2,k)
% Label1:真实标签 Label2:映射后的标签
T=0;
label_predict =[];
b =zeros(length(Label1), 1, 'logical');
label_true = BestMapping(Label1',Label1');
% [sorted_values, sorted_indices] = sort(A, 'descend');
for i=1:k
    ith_largest_indices = Label2(i, :);
    i_cell =ith_largest_indices;
%     label_predict =  i_cell';
   label_predict = BestMapping (Label1',i_cell');
    a= label_true==label_predict;
    q=sum(a);
    b=a|b;
    w=sum(b);
%     label_predict = [label_predict, mapping];
    
end
% correct_topk = sum(ismember(label_true, label_predict));
% b= label_true==label_predict;

    T=T+sum(b);
acc=T/length(label_predict);
fprintf('%.4f \t',acc);
