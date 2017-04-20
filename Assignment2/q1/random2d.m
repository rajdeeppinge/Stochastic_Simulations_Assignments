% Random Walk in 2-D

clc;
clear all;
close all;

iterations = 1000;                     % No of times experiment simulated
max_steps = 50000;                       % No of steps in one random walk

prob = zeros(1,iterations);             % stores probability of return after each iterations of experiment
c1=0;                                   % Count of random walker come back on origin

for a=1:iterations
    x=0;                                % X co-ordinate
    y=0;                                % Y co-ordinate
    
    for i=1:max_steps
        u = rand();
        
        if(u<1/4)
            x=x+1;              % take one step rightward
        elseif(u>=1/4 && u<1/2)
            y=y+1;              % take one step upward
        elseif(u>=1/2 && u<3/4)
            x=x-1;
        elseif(u>=3/4 && u<=1)
            y=y-1;
        end
        
        if x==0 && y==0                  % if (x,y) = (0,0) then random walker is back on origin
            c1=c1+1;
            break
        end;
    end
    
    prob(a) = c1/a;         % probability of return = number of returns to origin in these many iterations / number of iterations
end

plot(1:iterations,prob)
xlabel('no of iterations');
ylabel('probability');
title({'Random Walk in 2D';'Probability of returning to origin'});
set(findall(gcf,'-property','FontSize'),'FontSize',13);
