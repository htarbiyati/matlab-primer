% Speeding up your code!
% How to speed up the code?
% 1. Identify the problem
% 2. Fix it

% Random Matrix Processing
%clc
%clear

numElements = 500;

A = zeros(numElements);
B = zeros(numElements);

for i=1:numElements
    for j=1:numElements
        
        % Create a random grid of size numElements x numElements - A
        A(i,j) = rand;
        
        % Get B; B=A if A>0.5, otherwise B = -A
        if(A(i,j) > 0.5)
           B(i,j) = A(i,j); 
        else
           B(i,j)=-A(i,j);
        end
    end
end