function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Thomas Robert
% linearRegression computes the linear regression of a data seet
% compute the linear regression based on inputs:
%   1. x: x-values for our data set
%   2. y: y-values for our data set
% 
% Outputs:
%   1. fX: x-values with outliers removed
%   2. fY: y-values with outliers removed
%   3. slope: slope from the linear regression y=mx+b
%   4. intercept: intercept from the linear regression y=mx+b
%   5. Rsquared: R^2, a.k.a. coefficient of determination

% x = [1 2 3 4 5 6];
% y = [1 2 1.3 3.75 2.5 100];
x = [1896 1900 1904 1908 1912 1916 1920 1924 1928 1932 1936 1940 1944 1948 1952 1956 1960 1964 1968 1972 1976 1980 1984 1988 1992 1996 2000 2004 2008 2012 2016];
y = [273.2 246 245.4 243.4 236.8 0 241.8 233.6 233.2 231.2 227.8 0 0 229.8 225.1 221.2 215.6 218.1 214.9 216.3 219.2 218.4 212.53 215.96 220.12 215.78 212.32 214.18 213.11 214.08 230];

if length(x) ~= length(y)
    error('needs same number of inputs as number of outputs')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

n = length(x);
Q1 = sortedY(floor((n+1)/4));
Q3 = sortedY(floor((3*n+3)/4));
IQR = Q3-Q1;

for i = 1:length(sortedY) %sorted Y is 31 long at first but goes down by 3 before the end 
    if sortedY(i) >= Q3+(1.5*IQR) || sortedY(i) <= Q1-(1.5*IQR)
       sortedY(i) = []; %need to store all the positions in which the value needs to be removed 
       sortedX(i) = [];
    end
end
fY = sortedY
fX = sortedX

reg = polyfit(fX,fY,1); % outputs slope and intercept of the line of best fit for the data
slope = reg(1)
intercept = reg(2) 

fofx = slope.*fX + intercept

ymean = mean(fY)
SST = sum((fY-ymean).^2)
SSR = sum((fY-fofx).^2) 
Rsquared = 1 - (SSR/SST)
end




