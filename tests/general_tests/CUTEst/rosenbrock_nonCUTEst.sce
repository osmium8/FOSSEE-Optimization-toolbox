//--------rosenbrock----------

x0=[-1,2];
A=[1,2];
b=1;
Aeq=[];
beq=[];
lb=[];
ub=[];

function y=f(x)
    y=100*(x(2) - x(1)^2)^2+(1-x(1))^2;
endfunction

function y = fGrad(x)
    y = [-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1));
        200*(x(2)-x(1)^2)];
endfunction

function [c,ceq]=nlc(x)
    c=[x(1)+2*x(2)-1];
    ceq=[];
endfunction

function y = lHess(x,obj,lambda)
    //Hessian of objective
    H = [1200*x(1)^2-400*x(2)+2, -400*x(1);
                -400*x(1), 200];
    H = obj*H;
    //Hessian of nonlinear inequality constraint
    Hg = 2*eye(2);
    y = H + lambda(1)*Hg;//+ lambda(2)*Hg;
    disp(obj);
endfunction

function [cg, ceqg] = cGrad(x)
    cg = [2*x(1),2*x(2)];
    ceqg = [];
end

options = struct("MaxIter", [1500], "CpuTime", [500], "GradObj", fGrad, "Hessian", lHess,"GradCon", cGrad);
[x,fval,exitflag,output] =fot_fmincon(f, x0,A,b,Aeq,beq,lb,ub,nlc,options)
