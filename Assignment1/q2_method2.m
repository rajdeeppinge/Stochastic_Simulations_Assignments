% Method 2 for Q2. Use the definition of expectation, ie that it is the probability weighted average
% value of the random variable. Note that both methods lead to the exact same estimate. 
% Two perspectives of looking at the same thing.
%
%

clc;
clear all;
close all;


niter = 100; % number of iterations
iter = 1:niter; 
Narr = zeros(1,niter); % array to hold N for each iteration

% perform experiment
for i=1:niter
    
    n=0;
    total=0;
   
    while(total<1) % till condition is met...
        u = rand(); % generate a random variable
        total=total+u; 
        n=n+1;
    end
    
    Narr(i)=n; % current N
   
end

N_vals= unique(Narr); % all distinct values of N in the experiment
N_freq= zeros(length(N_vals),1); % count of all these values

for i= 1:length(N_freq)

N_freq(i)= sum(N_vals(i)==Narr); % count number of times a value appears in the experiment

end

total_count= sum(N_freq);

N_prob= N_freq/total_count; % estimated probabilies
expectation= N_vals*N_prob % dot product, definition of expectation

