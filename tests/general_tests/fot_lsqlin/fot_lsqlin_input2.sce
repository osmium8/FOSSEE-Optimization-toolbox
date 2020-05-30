// Check for the input arguments
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

//Error
//fot_lsqlin: Unexpected number of input arguments : 14 provided while should be in the set of [4 6 8 9 10]
//at line      99 of function fot_lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],[],[],[],[],[])

[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,A,b,[],[],[],[],[],[],[],[],[],[])

