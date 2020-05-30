//Find x in R^2 such that:
// Check if a user specifies correct options for hessian

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("MaxIter", [1000], "CpuTime", [100], "GradObj", "OFf", "Hessian", "");

//Error
//fot_fminunc: Unrecognized String [] entered for the option- Hessian.
//at line     290 of function fot_fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fot_fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fot_fminunc (fun, x0, options);
