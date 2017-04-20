% Programme to calulate P(M100>=25) where Mn=max{Si:1<=i<=n}
clc;
clear all;
close all;

nooftimes = 100000;                                 % No of times random walk simulated                                   
niter = 100;                                     % No of steps in one random walk

c1=0;                                               % Counter for given condition happening
for a=1:nooftimes
    x1=zeros(1,niter);                                % position of random walker at any time instant
    x=0;                                            % x co-ordinate of random walker
    
    for i=1:niter
        u = rand();
        if(u>1/2)
            x=x+1;
        else
            x=x-1;
        end
        x1(i)=x;
    end 
    if(max(x1)>=25)                                 % if maximum of random walker's position is greater than or equal to 25
        c1=c1+1;                                    % increase counter by 1        
    end
end

prob=c1/nooftimes;
disp(['Asked Probability = ' num2str(prob)]);