/*
---------penalty1.mod--------

param N:=1000;
param M:=N+1;

var x{i in 1..N} := i;

param a := 10^-5;

minimize f:
	sum {i in 1..N} a*(x[i]-1)^2 + ( sum {j in 1..N} x[j]^2 - 1/4 )^2;

solve;
display f;
display x;

/*
Cpu_Time: 0.1560000
*/

funcprot(0);
N=10;
M = N+1;

x = zeros(1,N);
i = 1 : N;
x(i) = i;
x0 = x;
a = 10^-5;


function y=f(x)
    N=100;
    M = N+1;
    a = 10^-5;
    j = 1:N;
    termN =( sum( (x(j)).^2) - 0.25 ).^2; 
    termsUptoN =sum(a .*( (x(j)-1).^2) );
  
    y = termsUptoN+ termN;
endfunction

function [f,g]=fwithgrad(x)
    N=10;
    M = N+1;
    a = 10^-5;
    j = 1:N;
    
    termN =( sum( (x(j)).^2) - 0.25 ).^2; 
    termsUptoN =sum(a .*( (x(j)-1).^2) );
  
    f = termsUptoN+ termN;
    /*
    if nargout > 1
        j = 1:N;
        sqsum = sum( (x(j)).^2);
        g = zeros(N,1);
        g(j, 1) = (4.*x(j)).*(sqsum - 0.25) + 2.*a.*(x(j)-1) ;
        
        
    end
    */
endfunction

function g=fGrad(x)
    N=10;
    M = N+1;
    a = 10^-5;
    j = 1:N;
    sqsum = sum( (x(j)).^2);
    
    g = zeros(N,1);
    g(j, 1) = (4.*x(j)).*(sqsum - 0.25) + 2.*a.*(x(j)-1) ;  
endfunction



options = struct("MaxIter", [100000], "CpuTime", [60000], "GradObj", fGrad, "Hessian","off","GradCon","off","HessianApproximation", 1 );
[x,fval,exitflag,output] =fot_fmincon(f, x0,[],[],[],[],[],[],[],options)
