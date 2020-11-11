
// Check if a user specifies value of linear equality contraints in accordance with starting point dimensions and coefficient matrix of linear equality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [2,6];
options=struct("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fot_fmincon: As Linear Equality Constraint coefficient Matrix Aeq (5th parameter) is empty, beq (6th Parameter) should also be empty
//at line     392 of function fot_fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b, Aeq, beq);
//at line      22 of exec file called by :    
//exec fot_fmincon_beq2.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b, Aeq, beq);
