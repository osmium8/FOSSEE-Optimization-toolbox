// Check for elements in Aeq
 C = [2 0;
	 -1 1;
	  0 2]
 d = [1
 	 0
    -1];
 Aeq = [10 -2 0;
	  -2 10 0];
 beq = [4
     -4];


//Error
//fot_lsqlin: The number of columns in Aeq must be the same as the number of columns in C
//at line     219 of function fot_lsqlin called by :  
//[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,[],[],Aeq,beq)

[xopt,resnorm,residual,exitflag,output,lambda] = fot_lsqlin(C,d,[],[],Aeq,beq)

