% Random Walk in 3-D
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
    z=0;                                % Z co-ordinate
    
    for i=1:max_steps
        u = rand();
        if(u<1/6)
            x=x+1;
        elseif(u>=1/6 && u<2/6)
            x=x-1;
        elseif(u>=2/6 && u<3/6)
            y=y+1;
        elseif(u>=3/6 && u<=4/6)
            y=y-1;
        elseif(u>=4/6 && u<5/6)
            z=z+1;
        elseif(u>=5/6 && u<=6/6)
            z=z-1;
        end
        
        if x==0 && y==0 && z==0                  % if (x,y,z) = (0,0,0) then random walker is back on origin
            c1=c1+1;
            break
        end;
    end
    
    prob(a) = c1/a;     % probability of return = number of returns to origin in these many iterations / number of iterations
end

plot(1:iterations,prob);
xlabel('no of iterations');
ylabel('probability');
title({'Random Walk in 3D';'Probability of returning to origin'});
set(findall(gcf,'-property','FontSize'),'FontSize',13);
