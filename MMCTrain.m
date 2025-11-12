 function [wt] = MMCTrain(X,Y,w,C,L,alpha,epsilon,F)   


wt = w;
d = size(X,1);
n = size(X,2);
k = getK(Y);

Jt = 10;
J = 10;

Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [];
options = optimset;    
options.LargeScale = 'off';
options.Display = 'off';


while true
    c = {};%c stores the most violated constraints£¬c{i} is a row vector;
    p_cell = getP_m(X,wt,k); 
    F_cell = getP_F(X,wt,k,F);   
    [Z,Rho] = getZRho(X,p_cell,k,d,n,F_cell);  
    g = size(Z,2);
    P = ones(1,g);
    s = size(Rho,2);
    F4 = Rho'*Rho;% 
    while true
        h = length(c);
        [ZCap,PCap] = getZPCap(Z,P,c,g,d,k);
        f = [-PCap';ones(s,1)*L];
        A = [[ones(1,h),zeros(1,s)];-eye(h+s)];
        F1 = ZCap'*ZCap;
        F2 = ZCap'*Rho;
        F3 = F2';
        H = [[F1,F2];[F3,F4]];
        b = [C;zeros((h+s),1)];

        
        [abeta,fval,~,~] = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options);


        a = abeta(1:h);
        beta = abeta((h+1):(h+s));
        
        %Compuate w in the current cutting plane iteration
        wts = (ZCap*a + Rho*beta)';
        
        %Compuate the slack variable \xi
        xi_m = PCap - wts*ZCap;
        xi = max(xi_m);
        if xi < 0
           xi = 0;
        end
        
        %Compute the most violated constraint under the current w
        c_i = wts*Z < P;
        c{h+1} = c_i;
        
        %Determine whether the iteration should be terminated
        m= (P*c_i'-wts*Z*c_i')/g;
        if xi+epsilon >= (P*c_i'-wts*Z*c_i')/g
            wt = wts;
            J = fval;
            break
        end
    end


    if abs((Jt-J)/J) < alpha
        break
    end
    
    Jt = J;
end

end



