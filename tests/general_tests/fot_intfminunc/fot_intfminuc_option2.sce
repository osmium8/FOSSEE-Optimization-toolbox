function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("maxiter", [1000], "cputime", , "gradobj", "OFF", "hessian", "OFF");
intcon = [1]
[xopt,fopt,exitflag] = fot_intfminunc (fun, x0,intcon, options)
//  !--error 10000 
// fot_intfminunc_options: Expected type ["constant"] for input argument cpuTime at input #4, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     196 of function fot_intfminunc called by :  
// [xopt,fopt,exitflag,output,lambda] = fot_intfminunc (fun, intcon, x1, x2, options);
// at line       8 of exec file called by :    
// exec fot_intfminunc_options2.sce