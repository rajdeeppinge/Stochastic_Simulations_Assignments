% Here we obtain the empirical distribution of the last return time to
% the origin(also known as last equalization time). 
%

% prob density empirical for last visit step to orig
clear;
close all;

% step size
L=1;

% initial position
x_curr=0;

% moves by random walk every iteration
n=100; 

% total number of iterations
ite=1e6;

% convention if no visit to origin during an iteration last visit is taken to be
%at t=0
last_visit_time_to_orig= zeros(ite,1);

% for every iteration, get last return time to origin
for j=1:ite

    x_curr=0; % set rw to orig
    
    for i = 1:n
        epsilon = rand;

        if epsilon >= 0.5
            x_curr = x_curr + L;
        else
            x_curr = x_curr - L;
        end

        % check if back at origin
        if x_curr == 0
            last_visit_time_to_orig(j)=i;
        end
    end
        
end

% historgram estimating the probability mass function of last return
% to origin
histogram(last_visit_time_to_orig, 'Normalization', 'pdf');
title('Histogram estimating pmf of last return to origin')
xlabel('last return to origin at step k')
ylabel('probability')