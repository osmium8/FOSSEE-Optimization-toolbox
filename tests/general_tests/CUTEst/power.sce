// -------power.mod---------
/*
For N=10, in scilab
CPU time: 0.128
fval = 8.071D-14
For same N, on NEOS server:
fval = 0.0000000000000000e+00

For N=100, in scilab
CPU time: 1.982
fval = 1.989D-12
For same N, on NEOS server:
fval = 9.8043700864909901e-30 (scaled)
fval = 1.9608740172981979e-27 (unscaled)

For N=1000, in scilab
CPU time: 23.595
fval = 1.891D-10
For same N, on NEOS server:
fval = 1.4044554521210040e-28 (scaled)
fval = 2.8089109042420080e-24 (unscaled)
*/

N = 1000; 
x0 = zeros(1,N);
x0(1:N) = 1;

function y=f(x)
    N = 1000; 
    i=1:N; 
    y = sum((i .* x(i)).^2);
endfunction

function g=fGrad(x)
    N = 1000; 
    i=1:N;     
    g = zeros(N,1);
    g(i,1) = i.*2.*(x(i));

endfunction

options = struct("MaxIter", [1000000], "CpuTime", [60000], "GradObj", fGrad, "Hessian","off","GradCon","off","HessianApproximation", 1);
[x,fval,exitflag,output] =fot_fmincon(f, x0,[],[],[],[],[],[],[],options)

