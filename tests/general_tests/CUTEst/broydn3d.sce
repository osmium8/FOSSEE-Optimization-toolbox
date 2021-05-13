/*
# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.                     

#   Source:  problem 30 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Toint#17 and Buckley#78.
#   SIF input: Ph. Toint, Dec 1989.

#   classification NOR2-AN-V-V
*/

/*
----------test case outputs-----------
Bestknown Objective = 0.00000000(same for all N)

*/
N = 100;
kappa1 = 2.0;
kappa2 = 1.0;

x0(1:N) = -1.0;

function y=f(x)
    y=0;
endfunction

function [c,ceq]=nlc(x)
    c=[];
    ceq = [(-2*x(2)+kappa2+(3-kappa1*x(1))*x(1))];
    for i=2:N-1
        ceq = [ceq, (-x(i-1)-2*x(i+1)+kappa2+(3-kappa1*x(i))*x(i))];
    end
    ceq = [ceq, (-x(N-1)+kappa2+(3-kappa1*x(N))*x(N))];
endfunction

function y=fGrad(x)
    y(1,1:N)=0;
endfunction

function [cg,ceqg]=cGrad(x)
    cg=[];
    ceqg(1,1) = 3-2*kappa1*x(1);
    ceqg(1,2) = -2;
    for i=2:N-1
        ceqg(i,i-1) = -1;
        ceqg(i,i) = 3-2*kappa1*x(i);
        ceqg(i,i+1) = -2;
    end
    ceqg(N,N-1) = -1;
    ceqg(N,N) = 3-2*kappa1*x(N);
endfunction

options = struct("MaxIter", [3000], "CpuTime", [600],"HessianApproximation", [1], "GradObj", fGrad, "Hessian","off","GradCon", cGrad);
[x,fval,exitflag,output] = fot_fmincon(f,x0,[],[],[],[],[],[],nlc,options)
