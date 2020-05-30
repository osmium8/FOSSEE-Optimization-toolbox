//Find x in R^2 such that:
// Check if Upper bound and lower bound is entered correctly

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [0.5,2.1];
x2 = [1,2];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fot_fminbnd: Difference between Upper Bound and Lower bound should be atleast > 10^-6 for variable number=  2 
//at line     242 of function fot_fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fot_fminbnd (fun, x1, x2, options)



[xopt,fopt,exitflag,output,lambda] = fot_fminbnd (fun, x1, x2, options)

