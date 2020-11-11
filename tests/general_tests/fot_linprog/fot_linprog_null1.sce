// Check for null elements
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]

//Error
//fot_linprog: Cannot determine the number of variables because input objective coefficients is empty
//at line      24 of function matrix_fot_linprog called by :  
//at line     169 of function fot_linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=fot_linprog([],[],[])
//at line      29 of exec file called by :    
//exec fot_linprog_null1.sce

[xopt,fopt,exitflag,output,lambda]=fot_linprog([],[],[])

