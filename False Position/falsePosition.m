function [root,fx,ea,iter] = falsePosition(func, xl, xu, es, maxit, varargin)

% finds the root of a function using the false position method
% func - the function being evaluated
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error (should default to 0.0001%)
% maxit - the maximum number of iterations to use (should default to 200)
% varargin - any additional parameters used by the function
% ea - approximate error






iter = 1; 
maxit = 200; 
es = 0.0001;
ea = 1;
xrnew = 1; 

    while ea >= es & iter < maxit
        xrnew = xu;
        xrnew = xu - (func(xu)*(xl - xu)) / (func(xl) - func(xu)); % first iteration 
        xrold = xl;
        ea = abs((xrnew - xrold) / xrnew) * 100 ;
        iter = iter + 1;
    end
    
root = xrnew    
fx = func(root)

    if fx == 0 
        ea = 0 
    end
    
end
% copy all that stuff into the command window
% if xl or xu is the root, break the code

