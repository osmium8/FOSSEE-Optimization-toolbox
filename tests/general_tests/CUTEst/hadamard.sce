/*

--------hadamard.mod----------

param n := 8;
set N := 1..n;

var Q{N,N} := 1;
var maxval >= 0, := 0;
var QQT{i in N, j in N} = sum{k in N} (Q[k,i]*Q[k,j]);

minimize abs_val:
	abs(maxval);

subject to ortho{i in N, j in N}:
	QQT[i,j] - n = 0;

subject to abs_min_val{i in N, j in N}:
	maxval >= Q[i,j];

subject to abs_max_val{i in N, j in N}:
	maxval >= -Q[i,j];

subject to ones{i in N,j in N}:
	abs(Q[i,j]) <= 1;
*/

n = 8;
N = 1:n;
Q = 1+zeros(n,n);
QQT = zeros(n,n);
k = 1:n;
for i=1:n
    for j=1:n
        QQT(i,j) = sum(Q(k,i).*Q(k,j));
    end
end

maxval = 0;
x = zeros(n^2+1,1);
x(1,1)= maxval;
x(2:(n^2+1),1) = 1;
x0=x;
lb = zeros(n^2+1);
lb(1) = 0;
lb(2:(n^2+1)) = -1;

ub = zeros(n^2+1);
ub(1) = %inf;
ub(2:(n^2+1)) = 1;

A1 = zeros(n^2, n^2+1); b1 = zeros(n^2,1);
A2 = zeros(n^2, n^2+1); b2 = zeros(n^2,1);
for j =2:(n^2+1)
        A1(j-1,j) = 1;
        A2(j-1,j) = -1;
end
for i = 1:(n^2)
    A1(i,1) = -1;
    A2(i,1) = -1;
end
A = [A1;A2]; b=[b1;b2];


function y=f(x)
     maxval = x(1);
     y = abs(maxval);
endfunction

function g=fGrad(x)
      g = zeros(n^2+1,1);
     if maxval>=0
          g(1,1) = 1;
     else
          g(1,1) = -1;
     end
endfunction

function [c,ceq]=nlc(x)
n=8;
ceq = zeros(n,n);
N=1:n;
k = 1:n;
QQT = zeros(n,n);
maxval = x(1);
Q = matrix(x(2:(n^2+1)),n,n);
for i=N
    for j=N
        QQT(i,j) = sum(Q(k,i).*Q(k,j));
    end
end

for i=1:n
    for j=1:n
        ceq(i, j) = QQT(i,j) - n;
    end 
end
ceq = matrix(ceq, 1, n^2);
c=[];
endfunction

function [gc, gceq]=cGrad(x)
n=8;
ceq = zeros(n,n);
QQT = zeros(n,n);
N=1:n;
k = 1:n;

maxval = x(1);
Q = matrix(x(2:(n^2+1)),n,n);

    gc = [];
    gceq = zeros(n^2, n^2+1);
    Qgrad = zeros(n,n);
    
    for i=1:n
        for j=1:n
                Qgrad = zeros(n,n);
                
                for k=1:n
                    Qgrad(k, i) = Qgrad(k, i)+ Q(k, j);
                end 
                for k=1:n
                    Qgrad(k, j) = Qgrad(k, j)+ Q(k, i);
                end
                
                k=1:(n^2);
                Qgradtemp = matrix(Qgrad,n^2,1);
                gceq( i+(j-1)*(n), 1) = 0;
                gceq(i+(j-1)*(n), k+1) = Qgradtemp(k, 1); 
                      
        end 
    end
endfunction

//Options
options=struct("MaxIter", [150000], "CpuTime", [50000], "GradObj", fGrad, "Hessian", "off","GradCon", cGrad,"HessianApproximation", [1]);
//Calling Ipopt
[x,fval,exitflag,output] =fot_fmincon(f, x0,A,b,[],[],lb,ub,nlc,options)
