//	---Question----

//	Bestknown Objective = 1.31145470; =0.880797(for N=1000)

//	param N:=5000;
//	var x{0..N} := 0.0;
//	var u{1..N} := 0.0;

//	minimize f:
//		0.5*x[N]^2 + sum {i in 1..N} (u[i]^2)/(2*N);
//	subject to cons1{i in 1..N}:
//		(N-0.5)*x[i] + (-N-0.5)*x[i-1] - u[i] = 0;
//	subject to cons2:
//		x[0] = 1.0;

//	solve; display f; display x;


//N=5000;
//N=500; //fval=   0.8807972
//N=700; //fval=   0.8807971 //N = 1000; //fval=   0.8807971
N = 1000;
x0 = zeros(2*N+1, 1);

function y=f(x)
	sum = 0 ;
	for i=1:N 
		sum = sum + ((x(N+1+i)^2)/(2*N));
	end
	y = 0.5*x(N+1)^2 + sum;
endfunction

beq = zeros(N+1, 1);
beq(1) = 1;
Aeq = [1];
Aeq(1, 2:2*N+1) = 0;

for i=2:N+1
	if i>=3 then
		Aeq(i, 1:i-2) = 0;
		Aeq(i, N+2:N+i-1) = 0;
	end
	if i>=2 then
		Aeq(i, i-1) = -N-0.5;
	end
	Aeq(i, i) = N-0.5;
	Aeq(i, i+1:N+1) = 0;
	Aeq(i, N+i) = -1;
	Aeq(i, N+i+1:2*N+1) = 0;
end

function y=fGrad(x)
	y(1,1:N) = 0;
	y(1,N+1) = x(N+1);
	for i=1:N
		y(1,N+1+i) = x(N+1+i)/N;
	end
endfunction

options = struct("MaxIter", [3000], "CpuTime", [600], "HessianApproximation", [1], "GradObj", fGrad, "Hessian","off","GradCon","off" );
[x,fval, exitflag, output] = fot_fmincon(f, x0, [], [], Aeq, beq, options)