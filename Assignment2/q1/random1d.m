% Random Walk in 1-D
clc;
clear all;
close all;

iterations = 10000;                     % No of times experiment simulated
max_steps = 50000;                       % No of steps in one random walk

prob = zeros(1,iterations);             % stores probability of return after each iterations of experiment
c1=0;                                   % Count of random walker coming back to origin

for a=1:iterations
    x=0;                                % X co-ordinate
    
    for i=1:max_steps
        u = rand();     % generate a uniformly distributed random variable
        
        if(u>1/2)
            x=x+1;      % take one step to right
        else
            x=x-1;      % take one step to left
        end
        
        if x==0                         % if x = 0 then random walker is back on origin                         
            c1 = c1+1;
            break
        end;
    end
    
    prob(a) = c1/a;         % probability of return = number of returns to origin in these many iterations / number of iterations
end

plot(1:iterations,prob);
xlabel('no of iterations');
ylabel('probability');
title({'Random Walk in 1D';'Probability of returning to origin'});
set(findall(gcf,'-property','FontSize'),'FontSize',13);
