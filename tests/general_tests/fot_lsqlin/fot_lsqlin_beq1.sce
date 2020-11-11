// Check for elements in beq
C = [2 0;
	-1 1;
	 0 2]
d = [1
 	 0
    -1];
Aeq = [10 -2;
	  -2 10];
beq = [-%inf -%inf];

//Error
//fot_lsqlin: Value of beq can not be negative infinity
//at line     293 of function fot_lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,[],[],Aeq,beq)

[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,[],[],Aeq,beq)

