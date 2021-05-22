funcprot(0);

oldmode = mode();      mode(-1);
/*
oldlines = lines()(2); lines(0);
*/
problem_list = ["broydn3d.sce", "cosine.sce", "curly10.sce", "dtoc1l.sce", "hadamard.sce", "hager1.sce", "hager4.sce", "liswet10.sce", "mancino.sce", "msqrtb.sce", "penalty1.sce", "power.sce", "reading2.sce", "rosenbrock.sce", "sipow3.sce", "tfi2.sce", "ubh1.sce"];

try
    for i=5:5
       try
        exec(get_absolute_file_path("run_all.sce")+"\"+ problem_list(i), -1);
        printf("\n\nProblem  =  ");
        disp(problem_list(i));
        printf("fval  =  ");
        disp(fval);
        printf("exitflag  =  ");
        disp(exitflag);
        printf("output  =  ");
        disp(output);
        
        catch
            [errmsg, tmp, nline, func] = lasterror()
            msg = "%s: error on line #%d: ""%s""\n"
            msg = msprintf(msg, func, nline, errmsg)
            //lines(oldlines)
            mode(oldmode);
            //clear oldlines oldmode tmp nline func
            error(msg);
        end 
    end


catch
    [errmsg, tmp, nline, func] = lasterror()
    msg = "%s: error on line #%d: ""%s""\n"
    msg = msprintf(msg, func, nline, errmsg)
    //lines(oldlines)
    mode(oldmode);
    clear oldlines oldmode tmp nline func
    error(msg);
end
/*
lines(oldlines);

mode(oldmode);
clear oldlines oldmode;
*/
