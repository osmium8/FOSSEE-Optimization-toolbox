# FOSSEE Optimization Toolbox for Scilab 6.0.x and above

A toolbox that provides mixed-integer programming, quadratic programming and nonlinear programming tools in Scilab through various open-source libraries available from Coin-OR.

NOTE: On linux systems with gfortran8 as the default version, the user will need to install libgfortran4 for the toolbox to load. This can be done, for example in Ubuntu, by executing: sudo apt-get install libgfortran4


## To Download
1. [Visit the link
   `http://atoms.scilab.org/toolboxes/FOT/`]
2. Select the linux or windows version as per your platform.
3. Extract the files.

## To use
1. In Scilab, change the working directory to the root directory of the repository
2. Run `exec loader.sce` in the scilab console.
3. The Toolbox is now ready, to see help type `help` in console.
4. The demos are available in `Demos folder`.
5. To run a demo type `exec <name of function>.dem.sce`
6. Test cases are available in `tests folder`.

## To build from source
1. The source code has the `thirdparty` folder missing. This folder contains the pre-built optimization libraries for windows and linux
2. Download the `thirdparty` folder for your OS from https://scilab.in/fossee-scilab-toolbox/optimization-toolbox/download-pre-built-optimization-library and paste it in the toolbox directory
3. Then type `exec builder.sce` in the scilab console to run the builder. {Prerequisites: In windows you need MinGW installed along with its toolbox. See https://atoms.scilab.org/toolboxes/mingw/8.3.0 and Step 0,1,2 of https://github.com/FOSSEE/FOSSEE-Optimization-toolbox/blob/Scilab-6/doc/INSTALL.mingw}
4. If you are using Windows, after you build the toolbox successfully, follow instructions given in https://github.com/FOSSEE/FOSSEE-Optimization-toolbox/blob/Scilab-6/doc/windows.edits
5. Now run `exec loader.sce` in the scilab console. The toolbox will be ready
   to use.

   This toolbox consists of open-source solvers for a variety of optimization
problems: CLP for linear and quadratic optimization, CBC for integer linear
optimization, IPOPT (with MUMPS) for nonlinear optimization, and BONMIN for
integer nonlinear optimization.

Features
---------
* fot_linprog: Solves a linear optimization problem.
 	
* fot_intlinprog: Solves a mixed-integer linear optimization problem in intlinprog
format with CBC.
  
* fot_quadprog: Solves a quadratic optimization problem.
  
* fot_quadprogmat: Solves a quadratic optimization problem (with input in Matlab
  format).
  
* fot_quadprogCLP: Solves a quadratic optimization problem.

* fot_intquadprog: Solves an integer quadratic optimization problem.

* fot_lsqnonneg: Solves a nonnegative linear least squares optimization problem.
  
* fot_lsqlin: Solves a linear least squares optimization problem.
  
* fot_lsqnonlin: Solves a nonlinear least squares optimization problem.
  
* fot_fminunc: Solves an unconstrained optimization problem.
  
* fot_fminbnd: Solves a nonlinear optimization problem on bounded variables.
 
* fot_fmincon: Solves a general nonlinear optimization problem.
  
* fot_fgoalattain: Solves a multiobjective goal attainment problem.
  
* fot_fminimax: Solves a minimax optimization problem.
  
* fot_intfminunc: Solves an unconstrained mixed-integer nonlinear optimization
  problem.
  
* fot_intfminbnd: Solves a mixed-integer nonlinear optimization
  problem on bounded variables.
  
* fot_intfmincon: Solves a constrained mixed-integer nonlinear optimization
problem.
  
* fot_intfminimax: Solves a mixed-integer minimax optimization problem.
  
