function [L, U, P] = luFactor(A)
% uses the pivoting method of LU Factorization 
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

[R,C] = size(A);
    if R ~= C 
        error('A matrix needs to be a square matrix')
    end
    
P = eye(R); % sets up original P matrix

U = A; % better to make U matrix and change it than to make it as you go 
L = eye(size(A)); % sets up L matrix without the coefficients

    for i = 1:R 
        for row = (i+1):R
            if abs(A(row,i)) > abs(A(i,i)) 
                U_fornow = U(row,:);
                U(i,:) = U(row,:);
                
                L_fornow = L(i,:);
                L(i,:) = L(i,:);
                
                P_fornow = P(i,:);
                P(i,:) = P(i,:);
            end
        end
        
        for row = (i+1):R
            L(row,i) = U(row,i) / U(i,i);
            neweq = L(row,i) * U(i,:);
            U(row,:) = U(row,:) - neweq; 
        end
    end