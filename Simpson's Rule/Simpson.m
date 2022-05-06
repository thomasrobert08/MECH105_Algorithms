function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

    if length(x) ~= length(y) 
        error('x and y vectors are not the same length')
    end % checks that vectors are the same length

space = diff(x); % spacings of the x vector
    for i = 2:length(space)
        if space(:,(i-1)) ~= space(:,i)
            error ('values of x vector need to be evenly spaced')
        end % checks that the x vector is evenly spaced
    end

    if mod(length(diff(x)),2) == 0 % even # spaces
        yodd = y(3:2:length(y)-1);
        yeven = y(2:2:length(y));
        h = x(end) - x(1);
        I = (h/(3*length(diff(y)-1)))*(y(1) + 4*sum(yeven) + 2*sum(yodd) + y(end)); % need to find a way to address middle of a vector in matlab
    elseif mod(length(diff(x)),2) ~= 0 && length(diff(x))>1 % odd # spaces
        yodd = y(3:2:length(y)-2);
        yeven = y(2:2:length(y)-2);
        h = x(end) - x(1);
        warnMsgSent = warning('Trapezoidal Rule is being used w/ Simpsons Rule'); % odd # spaces
        I_simp = (h/(3*length(diff(y))))*(y(1) + 4*sum(yeven) + 2*sum(yodd) + y(end-1));
        I_trap = (x(end)-x(end-1))*((y(end-1)+y(end))/2);  
        I = I_simp + I_trap
    else 
        warnMsgSent = warning('Trapezoidal Rule is used') % 1 space
        I = (x(end)-x(end-1))*((y(end-1)+y(end))/2); % just trapezoidal rule
    end
end
    

% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

