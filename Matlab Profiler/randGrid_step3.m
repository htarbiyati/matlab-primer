% Speeding up your code!
% How to speed up the code?
% 1. Identify the problem
% 2. Fix it
%---------------------------
% Adopt Efficient (Serial) Programming Practices
% Leverage Existing Optimized Algorithms
% Use Parallel Computing including GPUs
% Use Parallel Computing
% Generate C Code from MATLAB Code
% All of the Above
%---------------------------
% Random Matrix Processing
%clc
%clear

numElements = 500;

A = rand(numElements); % Create a random grid of size numElements x numElements - A
%B = zeros(numElements);
% Instead of assigning B to zeros, let's assign A to it!
B = A;
idx = A < 0.5;
B(idx) = -A(idx); % Get B; B=A if A>0.5, otherwise B = -A