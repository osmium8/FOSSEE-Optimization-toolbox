//  ---Question----

//  Bestknown Objective = 0.00000000(same for all N)

//  param N:=10000;
//  param kappa1:=2.0;
//  param kappa2:=1.0;
//  var x{1..N} := -1.0;

//  minimize f: 0;
//  subject to cons1:
//  	(-2*x[2]+kappa2+(3-kappa1*x[1])*x[1]) = 0;
//  subject to cons2{i in 2..N-1}:
//  	(-x[i-1]-2*x[i+1]+kappa2+(3-kappa1*x[i])*x[i]) = 0;
//  subject to cons3:
//  	(-x[N-1]+kappa2+(3-kappa1*x[N])*x[N]) = 0;

//  solve; display f; display x;

N = 100;
kappa1 = 2.0;
kappa2 = 1.0;

x0(1:N) = -1.0;

function y=f(x)
    y=0;
endfunction

function [c,ceq]=nlc(x)
    c=[];
    ceq = [(-2*x(2)+kappa2+(3-kappa1*x(1))*x(1))];
    for i=2:N-1
        ceq = [ceq, (-x(i-1)-2*x(i+1)+kappa2+(3-kappa1*x(i))*x(i))];
    end
    ceq = [ceq, (-x(N-1)+kappa2+(3-kappa1*x(N))*x(N))];
endfunction

function y=fGrad(x)
    y(1,1:N)=0;
endfunction

function [cg,ceqg]=cGrad(x)
    cg=[];
    ceqg(1,1) = 3-2*kappa1*x(1);
    ceqg(1,2) = -2;
    for i=2:N-1
        ceqg(i,i-1) = -1;
        ceqg(i,i) = 3-2*kappa1*x(i);
        ceqg(i,i+1) = -2;
    end
    ceqg(N,N-1) = -1;
    ceqg(N,N) = 3-2*kappa1*x(N);
endfunction

options = struct("MaxIter", [3000], "CpuTime", [600],"HessianApproximation", [1], "GradObj", fGrad, "Hessian","off","GradCon", cGrad);
[x,fval,exitflag,output] = fot_fmincon(f,x0,[],[],[],[],[],[],nlc,options)