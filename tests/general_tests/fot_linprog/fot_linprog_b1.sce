// Check for elements in b
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Error
//fot_linprog: The number of rows in A must be the same as the number of elements of b
//at line     133 of function matrix_fot_linprog called by :  
//at line     169 of function fot_linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=fot_linprog(c, A, beq, Aeq, beq)
//at line      16 of exec file called by :    
//exec fot_linprog_b1.sce

[xopt,fopt,exitflag,output,lambda]=fot_linprog(c, A, beq, Aeq, beq)

