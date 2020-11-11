// Check for the param to be a list
c=[-1,-1/3]'
A=[1,1;1,1/4;1,-1;-1/4,-1;-1,-1;-1,1]
b=[2,1,2,1,-1,2]
Aeq=[1,1/4]
beq=[1/2]
lb=[-1,-0.5]
ub=[1.5,1.25]
params = 0

//Error
//fot_linprog: options should be a list 
//at line      85 of function matrix_fot_linprog called by :  
//at line     169 of function fot_linprog called by :  
//[xopt,fopt,exitflag,output,lambda]=fot_linprog(c, A, b, Aeq, beq, lb, ub,params)
//at line      33 of exec file called by :    
//exec lsqlin_param1.sce 

[xopt,fopt,exitflag,output,lambda]=fot_linprog(c, A, b, Aeq, beq, lb, ub,params)
