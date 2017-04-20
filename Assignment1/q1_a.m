%program to calculate integration using random numbers
clear all;
close all;
clc;

n=500000;
sum=0;

seed = 7;           %can take any value

%using standard values for a,m and c - Linear congruential generator
a = 1664525;
m = 2^32;
c = 1013904223;
myRandom = seed;

for i=1:n
    %u=rand; 
    myRandom = mod((a*myRandom + c),m);
    u = (myRandom/m);
    gu = power((1-u*u),1.5);
    sum = sum + gu;
end

%law of large numbers has been used
ans = sum/n    

%Exact answer is 0.58905. Using simulation, we get answers very close to
%the actual one.



