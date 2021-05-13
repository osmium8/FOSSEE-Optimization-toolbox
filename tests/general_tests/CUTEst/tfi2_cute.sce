//	---Question----

//	Bestknown Objective = 0.65395902; =0.649042(for M=500)

//	param M := 10000;
//	param h := 1/M;
//	var x{1..3};

//	minimize f:
//		x[1]+0.5*x[2]+x[3]/3;
//	subject to cons1{i in 0..M}:
//		-x[1]-i*h*x[2]-(i*h)^2*x[3]+tan(i*h) <= 0;

//	solve; display f; display x;


function y=f(x)
	y = x(1)+0.5*x(2)+x(3)/3;
endfunction

x0 = zeros(3, 1);
//M=500 //fval = 0.6490421
M = 350; //fval = 0.6490412
h = 1/M;
A = [];
b = [];

for i=1:M+1
	A(i, 1) = -1;
	A(i, 2) = -(i-1)*h;
	A(i, 3) = -((i-1)*h)^2;
	b(i) = -tan((i-1)*h);
end

function y=fGrad(x)
	y = [1, 0.5, 1/3];
endfunction

options = struct("MaxIter", [3000], "CpuTime", [600], "HessianApproximation", [1], "GradObj", fGrad,"Hessian","off","GradCon","off" );
[x,fval,exitflag,output,lambda,grad,hessian] = fot_fmincon(f, x0, A, b, options)