% to generate a symbolic variable a and perform the addition just defined,
% first, a symbolic variable will be created by passing the string 'a' to
% the sym function
a = sym('a');
a+a
%%
x = sym('x'); 
myexpr = cos(x)^2 + sin(x)^2
simplify(myexpr)
%%
expand((x+2) *(x-1))
factor(ans)
%%
myexp = x^3 +3*x^2 -2  
x = 3;
subs (myexp, x);
%%
1/3 + 1/2
%%
sym(1/3 + 1/2)
%%
sym(1/3+1/2)
%%
[n, d] = numden(ans)
%%
[n, d] = numden((x^3^ +x^2)/x)
%%
