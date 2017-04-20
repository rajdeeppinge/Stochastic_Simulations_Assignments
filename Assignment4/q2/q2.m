% Author - Rushikesh Nalla
% Date - 13th April 2017

%Code for generating the stock price which is modeled as a geometric
%Brownian motion.
clear;
close all;
clc;

iter = 100;    % No of iterations to take ensemble

% simulation time variables
n = 240;        % total time
dt = 1;      % step time
x = n/dt;       % total steps

%parameters
mu = 0.18;      % average rate of return
sigma = 0.3;    % volatility

s = zeros(iter,x);     % stores stock price at each time instant
time = zeros(1,x);  % time array

%initialisation, stock price is 100 at time 0
s(:,1) = 100;     
time(1) = 0;

% perform experiment a large number of times to take ensemble
for j = 1:iter

    %Brownian Motion is randomly distributed with mean 0 and variance t
    %Used the closed form equation
    for i = 2:x
        s(j, i) = s(j, i-1)*exp(sigma*normrnd(0,sqrt(dt)) + (mu-(0.5*sigma*sigma))*dt); 
        time(i) = time(i-1) + dt;   
    end

end

s_mean = zeros(x, 1);

for i = 1:x
    s_mean(i) = mean(s(:, i));
end
    
plot(time,s_mean);
%plot(time, log(s/s(1)));
str = sprintf('Total Time = %d days, Ensemble Iterations = %d', n, iter);
title({'Simulating Stock Price - Geometric Brownian Motion'; str});
ylabel('Stock Price in rupees');
xlabel('Time in days');
set(gca,'fontsize',16);
set(findall(gcf,'type','text'),'FontSize',16);