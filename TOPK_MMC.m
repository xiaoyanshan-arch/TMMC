clc
clear

load('demo.mat');
savepath = 'Res/';
addpath(genpath('ClusteringMeasure'));
addpath(genpath('function')); 
feature_A=data';
feature_A = normalize(feature_A, 'zscore');
X=feature_A';
Y=truelabel;


k = getK(Y);
n = size(X,2);
d = size(X,1);

%Top-kµÄk=F
for F = 3:2:9
    disp(F);
    %C: regularization parameter
    C = 2^-3;
    %L: cluster balancing parameter
    L =0;
    disp(C);
    %alphaºÍepsilon: CCCP and cutting plane precision
    alpha= 0.01;
    epsilon = 0.01;

    times =5;
    NMI = zeros(1,times);
    AR = zeros(1,times);
    RI = zeros(1,times);
    MI = zeros(1,times);
    HI = zeros(1,times);
    Cputime = zeros(1,times);
    acc1 = zeros(1,times);
    acc2 = zeros(1,times);
    acc3 = zeros(1,times);
    acc4 = zeros(1,times);
    acc5 = zeros(1,times);
    acc6 = zeros(1,times);
    acc7 = zeros(1,times);
    acc8 = zeros(1,times);
    acc9 = zeros(1,times);
    acc10 = zeros(1,times);
    Fm = zeros(1,times);
    wm = zeros(times,d*k);

    for i = 1:times
        w = rand(1,d*k);
        wm(i,:) = w;
        tic;
        wt = MMCTrain(X,Y,w,C,L,alpha,epsilon,F);
        Cputime(i) = toc;
        p_test = getP_m(X,wt,k);
        NMI(i) = nmi(Y, p_test);
        [AR(i),~,~,~]=RandIndex(Y, p_test);

        for j=1:10
            d = size(X,1);
            w = reshape(wt,d,k)';
            A = (w*X);
            column_sum = sum(A);
            [sorted_values, sorted_indices] = sort(A, 'descend');
            acc(j) = kAcc(Y,sorted_indices,j);
        end

        Fm(i) = compute_f(Y,p_test);
        fprintf('\n acc=%.4f \t nmi=%.4f \t ar=%.4f \t FMeasure=%.4f \t cputime=%4f \n',acc(1),NMI(i),AR(i),Fm(i),Cputime(i));
        % fprintf(' %.4f \t', acc(1));
    end
    %save([savepath 'demo.mat'
    %'Res_best.mat'],'C','L','alpha','epsilon','NMI','AR','RI','MI','HI','Fm','acc','Cputime','wm');



end
