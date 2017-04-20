%Author : Omkar Damle and Aditya Joglekar
%Date: 31st March 2017

% The code first experimentally finds an estimate for the
% first passage time to be less than or equal to 4. It then
% computes the actual answer analytically. Both are displayed
% in the console. Notice that for a large number of iterations
% empirical answer will tend to the theoretical answer.


clear;
close all;

niter = 1000000;           %Number of random walks
count=0;
%For each walk, simulate the first 10 steps
for i=1:niter
    flag = 0;
    x=0;
    for j=1:10
        u=rand;
        if u<0.5
            x=x-1;
        else
            x=x+1;
        end
        
        if x==4
            flag=1;
            break;
        end
    end
    
    if flag==1
        count=count+1;              %count increased if hitting time is less than 10
    end
    
end

experimental_prob = count/niter             %Probability of hitting time of 4 is less than 10
    

%% computation of the same using the analytical formula

m = 4;
sum_tau_i=0;

% only even makes sense and that too greater than or equal to 4
for i=4:2:10
    
    sum_tau_i = sum_tau_i + ( nchoosek(i, (i+m)/2 )/(2^i) )/i ;
end

theoretical_prob = m*sum_tau_i