% Code for simulating rat's maze example for comparing the number of times rat is in
% state j with stationary distribution of this Markov Chain and verifying it with the 
% theoretical stationary distribution

clear;
close all;
clc;

transition = [0,1/2,0,0,0,1/2,0,0,0;         % Transition Matrix
              1/3,0,1/3,0,1/3,0,0,0,0;
              0,1/2,0,1/2,0,0,0,0,0;
              0,0,1/3,0,1/3,0,0,0,1/3;
              0,1/4,0,1/4,0,1/4,0,1/4,0;
              1/3,0,0,0,1/3,0,1/3,0,0;
              0,0,0,0,0,1/2,0,1/2,0;
              0,0,0,0,1/3,0,1/3,0,1/3;
              0,0,0,1/2,0,0,0,1/2,0];

%% Experimental
n = 100000; % no of iterations
state = 1; % initial state 
count = zeros(1,9); % to store the total count of rat being in each state

for i=1:n
    u = rand();

    for k = 1:9
        if u < sum(transition(state,1:k))   % condition to check in which state does it go
            count(k) = count(k) + 1;  % increment count of that state
            state = k;                % update current state
            break;
        end
    end
end

stationary_distribution = count/n; % probability of being in a particular state

%% Theoretical using left null space calculation

m=9;
I = eye(m);
A = transpose(transition) - I;
A(m,:) = ones(1,m);

b =zeros(m,1);
b(m)=1;

% solving m equations and m unknowns to calculate stationary vector
theoretical_stationary = A\b;

check_distribution = stationary_distribution*transition; %just for checking