% Code to generate a discrete random variable using acceptance rejection
% method

% Author: Rajdeep Pinge
% Date: 18-02-2017

clear;
close all;

pj = [0.30 0.20 0.35 0.15];

% generating q_array with discrete uniform density
qj = [0.25 0.25 0.25 0.25];

% finding maximum value of c
c = max(pj)/min(qj);

niter = 1000000;      % number of iterations

X = zeros(niter, 1);    % array storing the value of random variable in each iteration

for i=1:niter
    while 1
        U1 = rand;      % generate 1st uniform random number 
        Y = floor(length(pj) * U1) + 1;

        U2 = rand;      % generate 2ndt uniform random number 

        if U2 < pj(Y) / (c * qj(Y))     % if condition matches then that is the value of X
            X(i) = Y;                   % assign value
           break;                       % stop here, and proceed to next iteration
        end
    end
end

% Graph of value of X vs its experimental probability
histogram(X,100)
ylabels = linspace(0,1,21);
set(gca,'YTickLabel',ylabels); 
title(['Graph of value of X vs its experimental probability for ' num2str(niter) ' iterations'])
xlabel('value of random variable', 'FontSize', 16)
ylabel('probability of occurance', 'FontSize', 16)