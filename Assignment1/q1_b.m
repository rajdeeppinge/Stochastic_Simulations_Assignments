%program to calculate integration using random numbers
%in order to change the limits of the integral, the following substitution
%was made :
%u=1+(1/(x-1))
%After this substitution, we got an integral from 0 to 1 and then the
%expected value of the function was calculated using uniform random numbers
%and by the law of large numbers, the average equaled the integral.


clear all;
close all;
clc;

n=100000;
sum=0;
seed = 7;           %can take any value

%using standard values for a,m and c - Linear congruential generator
a = 1664525;
m = 2^32;
c = 1013904223;
myRandom = seed;

for i=1:n
    myRandom = mod((a*myRandom + c),m);
    u = (myRandom/m);
    %u=rand;
    gu = u*(1-u)/(power((u-1)*(u-1) + u*u,2));
    sum = sum + gu;
end

ans = sum/n

%exact answer is 0.5 and the simulation produces answers very close to the exact anser..