/*
# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.                     

#   Source:
#   W. Li and J. Swetits,
#   "A Newton method for convex regression, data smoothing and
#   quadratic programming with bounded constraints",
#   SIAM J. Optimization 3 (3) pp 466-488, 1993.

#   SIF input: Nick Gould, August 1994.

#   classification QLR2-AN-V-V
*/

/*
-------test case outputs-------
For N=1000, it took almost 1.5 minutes to compute in scilab
CPU time: 79.354000
fval = 4.9316211
For same N, on NEOS server:
fval = 4.93113
*/

funcprot(0);
//N = 10000;
N=100; 
    
K = 2;

B = zeros(1,K+1);
B(1) = 1;
for i = 2:K+1
    B(i) = (i-1) * B(i-1);
end

C = zeros(1,K+1);
C(1) = 1;
i = 2:(K+1);
C(i) = (-1).^(i-1).*B(K+1)./(B(i).*B(K+1-i+1));

x0 = zeros(1,N+K);

j =1:N;
i = 0:K;
A = zeros(N,(N+K)); 
b=zeros(N,1);
for j=1:N
    A(j,j+K-i) = -C(i+1);
end

function y=f(x)
//N = 10000;
    N=100;
    
    K = 2;
    T = zeros(1,N+K);
    i = 1:(N+K);
    T(i) = (i-1)/(N+K-1);
    pi = 3.1415;
    term1 = sum(-(cos(pi.*T(i)) + 0.1*sin(i)).*x(i));
    term2 = sum(0.5.*( cos(pi.*T(i)) + 0.1.*sin(i) ).^2);
    term3 = sum(0.5.*x(i).^2);

    y = term1 + term2 + term3;
endfunction

function g = fGrad(x)
    //N = 10000;
    N=100;
    K = 2;
    T = zeros(1,N+K);
    i = 1:(N+K);
    T(i) = (i-1)/(N+K-1);
    pi = 3.1415;
    
    g = zeros(N+K, 1);
    g(i,1) = -(cos(pi.*T(i)) + 0.1*sin(i)) + x(i);

endfunction

options = struct("MaxIter", [1000000], "CpuTime", [60000], "GradObj", fGrad, "Hessian","off","GradCon","off","HessianApproximation", 1 );
[x,fval,exitflag,output] =fot_fmincon(f, x0,A,b,[],[],[],[],[],options)
