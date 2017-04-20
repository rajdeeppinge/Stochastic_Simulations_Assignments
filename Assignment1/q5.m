%program to simulate a non-homogenous poison process

clear all;
close all;
clc;
T=10;                   %time for which simulation is to be carried out
%arrival_time = zeros(1,300);
t=0;
lambda = 26;            %maximum value of lambda function
i=0;

while true
    u=rand;
    t=t-(1/lambda)*log(u);
    
    if t>T
        break;
    end
    
    u1=rand;

    if t<5
        lambda_t = t/5;
    else
        lambda_t = 1+5*(t-5);
    end
    
    p=lambda_t/lambda;
    
    if u1<p
        i=i+1;
        arrival_time(i) = t;
    end
end
nbins=300;
hist(arrival_time,nbins)                    %for visualization
xlabel('time')
ylabel('frequency of arrivals')