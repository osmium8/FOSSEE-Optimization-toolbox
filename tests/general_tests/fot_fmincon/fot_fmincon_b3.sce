
// Check if a user specifies upper bounds of linear inequality contraints in accordance with starting point dimensions and coefficient matrix of linear inequality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [5,8];
b = [];
options=struct("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fot_fmincon: Expected Non empty Row/Column Vector for b (4th Parameter) for your Inputs 
//at line     360 of function fot_fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b);
//at line      20 of exec file called by :    
//exec fot_fmincon_b3.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fot_fmincon (fun, x0, A, b);
