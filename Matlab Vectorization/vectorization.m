% MATLAB is optimized for operations involving matrices and vectors. 
% The process of revising loop-based, scalar-oriented code to use MATLAB matrix 
% and vector operations is called vectorization. Vectorizing your code is 
% worthwhile for several reasons
% Appearance: Vectorized mathematical code appears more like the
% mathematical expressions found in textbooks, making the code easier to
% understand. Less Error Prone: Without loops, vectorized code is often
% shorter. Fewer lines of code mean fewer opportunities to introduce
% programming errors. Performance: Vectorized code often runs much faster
% than the corresponding code containing loops.
% Vectorizing Code for General Computing
%% 
% This code computes the sine of 1,001 values ranging from 0 to 10:

i = 0;
for t = 0:.01:10
    i = i + 1;
    y(i) = sin(t);
end
%%
% This is a vectorized version of the same code:
t = 0:.01:10;
y = sin(t);
%%
% Vectorizing Code for Specific Tasks
% 
% This code computes the cumulative sum of a vector at every fifth element:

x = 1:10000;
ylength = (length(x) - mod(length(x),5))/5;
y(1:ylength) = 0;
for n= 5:5:length(x)
    y(n/5) = sum(x(1:n));
end 
%%
% Using vectorization, you can write a much more concise MATLAB process.
% This code shows one way to accomplish the task:
x = 1:10000;
xsums = cumsum(x);
y = xsums(5:5:length(x)); 
%%
% Anonymous functions
sqr = @(x) x.^2;
a = sqr(5)
%%
% find the integral of the sqr function from 0 to 1 by passing the function
% handle to the integral function
q = integral(sqr,0,1);
%%
% You do not need to create a variable in the workspace to store an
% anonymous function. Instead, you can create a temporary function handle
% within an expression, such as this call to the integral function
q = integral(@(x) x.^2,0,1);
%%
