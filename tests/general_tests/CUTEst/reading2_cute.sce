//  ---Question----

//  Bestknown Objective = -0.00996705 (= -0.0125523; N=300)

//  param N:=5000;
//  param A:=0.07716;
//  param H:=1/N;
//  param pi := 3.1415;

//  var x1{0..N};
//  var x2{0..N} <= 0.125, >= -0.125;
//  var u{0..N} >= -1.0, <= 1.0;

//  minimize f:
//  	sum {i in 1..N} (-0.5*H*cos(2*pi*i*H)*x1[i] - 0.5*H*cos(2*pi*(i-1)*H)*x1[i] + H*(u[i]+u[i-1])/(8*pi^2));
//  subject to cons1{i in 1..N}:
//  	(x1[i]-x1[i-1])/H - 0.5*(x2[i]+x2[i-1]) = 0;
//  subject to cons2{i in 1..N}:
//  	(x2[i]-x2[i-1])/H - 0.5*(u[i]+u[i-1]) = 0;
//  subject to cons3:
//  	x1[0] = 0.0;
//  subject to cons4:
//  	x2[0] = 0.0;

//  solve; display f; display x1, x2, u;

//N = 100; //fval =  -0.0124710
N = 300; //fval =   -0.0124547
A = 0.07716;
H = 1/N;
pi = 3.1415;

x0 = zeros(3*N+3, 1);

lb = [];
ub = [];

for i=1:N+1
    lb(i) = -%inf;
end
for i=N+2:2*N+2
    lb(i) = -0.125;
end
for i=2*N+3:3*N+3
    lb(i) = -1.0;
end

for i=1:N+1
    ub(i) = %inf;
end
for i=N+2:2*N+2
    ub(i) = 0.125;
end
for i=2*N+3:3*N+3
    ub(i) = 1.0;
end

function y=f(x)
    N=300;
    H = 1/N;
    pi = 3.1415;
    sum = 0;
    for i=1:N
        sum = sum + (-0.5*H*cos(2*pi*i*H)*x(i+1) - ..
        0.5*H*cos(2*pi*(i-1)*H)*x(i+1) + H*(x(2*N+2+i+1)+x(2*N+2+i))/(8*pi^2));
    end
    y = sum;
endfunction

Aeq = [];
beq = zeros(2*N+2,1);

//constraint 1
for i=1:N
    Aeq(i,i) = -1/H;
    Aeq(i,i+1) = 1/H;
    Aeq(i,N+1+i) = -0.5;
    Aeq(i,N+1+i+1) = -0.5;
end

//constraint 2
for i=N+1:2*N
    Aeq(i,i+1) = -1/H;
    Aeq(i,i+2) = 1/H;
    Aeq(i,N+1+i+1) = -0.5;
    Aeq(i,N+1+i+2) = -0.5;
end

//constraint 3
Aeq(2*N+1, 1) = 1;

//constraint 4
Aeq(2*N+2, N+2) = 1;

function y=fGrad(x)
    y(1,1) = 0;
    for i=1:N
        y(1,i+1) = -0.5*H*cos(2*pi*i*H) - 0.5*H*cos(2*pi*(i-1)*H);
    end
    y(1,2*N+3) = H/(8*pi^2);
    y(1,3*N+3) = H/(8*pi^2);
    for i=2*N+4:3*N+2
        y(1,i) = H/(4*pi^2);
    end
endfunction

options = struct("MaxIter", [3000], "CpuTime", [600], "HessianApproximation", [1], "GradObj", fGrad, "Hessian","off","GradCon","off" );
[x,fval] = fot_fmincon(f, x0, [], [], Aeq, beq, lb, ub, options)
