% Comparing runtime of scripts, randGrid_start, randGrid_step1 & 2 & 3
clear;
tic;
randGrid_start;
startRuntime = toc;
tic;
randGrid_step1;
step1Runtime = toc;
tic;
randGrid_step2;
step2Runtime = toc;
tic;
randGrid_step3;
step3Runtime = toc;
plot([startRuntime step1Runtime step2Runtime step3Runtime]);