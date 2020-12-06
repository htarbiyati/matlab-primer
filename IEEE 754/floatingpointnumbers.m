% IEEE 754
% The IEEE Standard for Floating-Point Arithmetic (IEEE 754) is a technical standard for 
% floating-point arithmetic established in 1985 by the Institute of Electrical and Electronics Engineers 
% (IEEE). The standard addressed many problems found in the diverse floating-point implementations that 
% made them difficult to use reliably and portably. Many hardware floating-point units use the 
% IEEE 754 standard. 
%
x = 25.783;
whos x
%%
isfloat(x)
%%
y = int64(-589324077574);          % Create a 64-bit integer
x = double(y)                      % Convert to double
%%
x = single(25.783);                % Creates a single precision number
xAttrib = whos('x');
%%
y = int64(-589324077574);          % Create a 64-bit integer
x = single(y)                      % Convert to single
%%
xAttrib = whos('x');
xAttrib.bytes
%%
y = int64(-589324077574);          % Create a 64-bit integer
x = single(y)                      % Convert to single
%%
c = 'uppercase' - 32;              % performs arithmetic on data of types char and double. 
                                   % The result is of type double
class(c)
char(c)
%%
x = single([1.32 3.47 5.28]) .* 7.5;
class(x)
%%
% The MATLAB functions realmax and realmin return the maximum and minimum values that you can represent 
% with the double data type
realmin
realmax
str = 'The range for double is:\n\t%g to %g and\n\t %g to  %g';
sprintf(str, -realmax, -realmin, realmin, realmax)
%%
% The MATLAB functions realmax and realmin, when called with the argument 'single', 
% return the maximum and minimum values that you can represent with the single data type:
% The three dots '...' tell matlab that the code on a given line continues on the next line.
str = 'The range for single is:\n\t%g to %g and\n\t %g to  %g';
sprintf(str, -realmax('single'), -realmin('single'), ...
    realmin('single'), realmax('single'))
%%
% +- Infinity
% Numbers larger than realmax('single') or smaller than -realmax('single') are assigned the values of 
% positive and negative infinity, respectively
realmax('single') + .0001e+038
-realmax('single') - .0001e+038
%%
% Double-Precision Accuracy
% Because there are only a finite number of double-precision numbers, you cannot represent all numbers in 
% double-precision storage. On any computer, there is a small gap between each double-precision number and 
% the next larger double-precision number. You can determine the size of this gap, which limits the 
% precision of your results, using the eps function. For example, to find the distance between 5 and the 
% next larger double-precision number, enter
format long
eps(5)
% This tells you that there are no double-precision numbers between 5 and 5 + eps(5). If a double-precision
% computation returns the answer 5, the result is only accurate to within eps(5).
%%
% There are fewer single precision numbers than double precision numbers
% hence they're less precise!
x = single(5);
eps(x)
%%
% Round-Off or What You Get Is Not What You Expect!
e = 1 - 3*(4/3 - 1)
% Same result as
eps(1)
%%
% Similarly, 0.1 is not exactly representable as a binary number. Thus, you get the following 
% nonintuitive behavior:
a = 0.0;
for i = 1:10
  a = a + 0.1;
end
a == 1
a
%%
% Note that the order of operations can matter in the computation
b = 1e-16 + 1 - 1e-16;
c = 1e-16 - 1e-16 + 1;
b == c
%%
% There are gaps between floating-point numbers. As the numbers get larger, so do the gaps, 
% as evidenced by
(2^53 + 1) - 2^53
%%
% Since pi is not really ?, it is not surprising that sin(pi) is not exactly zero
sin(pi)
%%
% Catastrophic Cancellation
% When subtractions are performed with nearly equal operands, sometimes cancellation can occur 
% unexpectedly. The following is an example of a cancellation caused by swamping 
% (loss of precision that makes the addition insignificant)
sqrt(1e-16 + 1) - 1
% Some functions in MATLAB, such as expm1 and log1p, may be used to compensate for the effects of 
% catastrophic cancellation.
%%
% Floating-Point Operations and Linear Algebra
% Round-off, cancellation, and other traits of floating-point arithmetic combine to produce 
% startling computations when solving the problems of linear algebra. MATLAB warns that the 
% following matrix A is ill-conditioned, and therefore the system Ax = b may be sensitive to 
% small perturbations
A = diag([2 eps])
b = [2; eps]
y = A\b;
