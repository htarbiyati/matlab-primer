function d = ger_fft2(x)  %#codegen 
% German-Style Decimation-In-Time (DIT) radix-2 FFT.
% It comes from pseudocode presented in the following book:
% Robert Plato. Numerische Mathematik kompakt. Vieweg, 4th Ed., 2010, page 53.
% University of Siegen.
  
    N = length(x);
    d = x(bitrevorder(1:N));
    q = log2(N);
    
    for r = 0:q-1        
         M  = 2^r;   th = exp(-pi*1i/M);        
         for k = 1:M            
               for j = 0:2^(q-r-1)-1                                   
                    x = th^(k-1)*d(2*j*M+M+k);
                    d(2*j*M+M+k) = d(2*j*M+k) - x;
                    d(2*j*M+k)      = d(2*j*M+k) + x;                   
               end       
         end
    end
    
 % This specific script is used to generate the mex function: ger_fft_mex.mexw64.
 % The mex code was generated by the following commands:
 %
 % A) The next 2 commands enable Dynamic Memory Allocation for support
 % of variable-size input data:
 % 
 % >> mexcfg = coder.config('mex');
 % >> mexcfg.DynamicMemoryAllocation = 'AllVariableSizeArrays'; 
 %
 % B) Next Define an "example" input (i.e. a complex row-vector):
 % >> a = randn(1,2^12) + j*randn(1,2^12);
 %
 % C) Finally call the correct codegen version:
 % The expression: typeof(a,[1 Inf]) specifies as an input a row-vector
 % of variable-size to provide maximum functionality:
 %
 % >> codegen -config mexcfg ger_fft.m -args {coder.typeof(a,[1 Inf])}