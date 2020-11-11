// Check for the param to be even in number
C = [2 0;
	-1 1;
	 0 2]
d = [1
	 0
    -1];
A = [10 -2;
	 -2 10];
b = [4
    -4];
param = list("MaxIter");

//Error
//fot_lsqlin: Size of parameters should be even
//at line     153 of function fot_lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],param)

[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],param)

