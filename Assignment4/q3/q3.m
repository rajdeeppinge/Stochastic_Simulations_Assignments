% Author - Omkar Damle
% Date - 14th April 2017

%We have calculated the European call option value using Black Scholes
%Merton equation and verified it by simulation
clear;
close all;
clc;

%% theoretical calculation using formula

t = 1/3;    %time to expiraton in years
x = 30;  %current stock price
k = 29;  %strike price
r = 0.05;    %interest rate
v = 0.25 ;   %stck volatility

d_plus = (log(x/k) + (r+(v*v*0.5))*t)/(v*sqrt(t));
d_minus = (log(x/k) + (r-(v*v*0.5))*t)/(v*sqrt(t));

theoretical_option_price = x*normcdf(d_plus) - k*exp(-r*t)*normcdf(d_minus)


%% calculation by simulation

n = 1000;    %number of paths
m = 1000;    %number of steps


sum=0;
dt = t/m;
for i=1:n
%    stock = zeros(1,m);
    stock = x;
    for j=1:m
        % Method 1 - simulating stock price as geometric brownian motion
        temp = (r-power(v,2)*0.5)*dt + v*sqrt(dt)*normrnd(0,1);
        stock = stock*(exp(temp));
        
        % Method 2 - discrete equation
        % stock = stock + r*stock*dt + v*stock*sqrt(dt)*normrnd(0,1); 
    end
    sum = sum + max(stock-k,0)*exp(-r*t);
end

empirical_option_val = sum/n


