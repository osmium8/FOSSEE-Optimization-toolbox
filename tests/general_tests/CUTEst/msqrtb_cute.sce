//  ---Question----

//  Bestknown Objective = 0.00000000

//  param P := 32;
//  param N := P^2;
//  param B{i in 1..P, j in 1..P} := if (i==3 && j==1) then 0 else sin (((i-1)*P + j)^2 );
//  param A{i in 1..P, j in 1..P} := sum {k in 1..P} B[i,k]*B[k,j];

//  var x{i in 1..P, j in 1..P} := 0.2*B[i,j];

//  minimize f: 0;
//  subject to cons{i in 1..P, j in 1..P}:
//  	(sum {t in 1..P} x[i,t]*x[t,j] -A[i,j]) = 0;

//  solve;
//  display f;
//  display x;

P = 3;
N = P^2;
B = zeros(P,P);
A = zeros(P,P);
x0 = zeros(P,P);

for i=1:P
    for j=1:P 
        if (i==3 && j==1) then
            B(i,j) = 0;
        else
            B(i,j) = sin(((i-1)*P + j)^2);
        end
    end
end

for i=1:P
    for j=1:P
        x0(i,j) = 0.2*B(i,j);
    end
end

x0 = matrix(x0',N,1);

function y=f(x)
    y=0;
endfunction

function [c, ceq]=nlc(x)
    c = [];
    ceq = [];
    x = (matrix(x,P,P))';

    for i=1:P
        for j=1:P 
            if (i==3 && j==1) then
                B(i,j) = 0;
            else
                B(i,j) = sin(((i-1)*P + j)^2);
            end
        end
    end

    for i=1:P 
        for j=1:P
            sum = 0;
            for k=1:P
                sum = sum + B(i,k)*B(k,j);
            end
            A(i,j) = sum;
        end
    end

    for i=1:P
        for j=1:P
            sum=0;
            for t=1:P
                sum = sum + x(i,t)*x(t,j);
            end
            sum = sum-A(i,j);
            ceq = [ceq, sum];
        end
    end
endfunction

function y=fGrad(x)
    y(1,1:N) = 0;
endfunction

function [cg, ceqg]=cGrad(x)
    cg=[];
    nc=1;

    for i=1:P
        for j=1:P
            for t=1:P
                if (i==t && t==j) then
                    ceqg(nc,(i-1)*P+j) = 2*x((i-1)*P+j);
                else
                    ceqg(nc,(i-1)*P+t) = x((t-1)*P+j);
                    ceqg(nc,(t-1)*P+j) = x((i-1)*P+t);
                end
            end
            nc = nc+1;
        end
    end
endfunction

options = struct("MaxIter", [300000], "CpuTime", [60000],"HessianApproximation", [1], "GradObj", fGrad, "Hessian","off","GradCon", cGrad);
[x, fval, exitflag, output] = fot_fmincon(f, x0,[],[],[],[],[],[],nlc,options)









