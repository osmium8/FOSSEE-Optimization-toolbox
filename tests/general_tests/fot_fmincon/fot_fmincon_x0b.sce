
// Check if a user specifies a starting point of the correct dimensions with respect to the objective function

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1];
A = [3,4];
b = [7,9];
options=struct("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fot_fmincon: Objective function and x0 did not match
//at line     318 of function fot_fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b);
//at line      20 of exec file called by :    
//exec fot_fmincon_x0b.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b);
