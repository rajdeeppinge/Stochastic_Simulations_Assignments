% q6 implements the polar method for generating
% a random variable with standard normal distribution.
% X and Y are the variables being generated.
% Here we have used the rand(1) function
% to obtain an instance of a uniformly distributed
% random variable. 
% We check the mean and standard distribution of 
% the generated variables and verify the shape
% of the histogram.

clear;
close all;

ite=1e5; % iterations

% normal radnom variables to simulate
X= zeros(ite,1);
Y= zeros(ite,1);

for i=1:ite

% generate two uniform random variable instances    
u1= rand(1);
u2= rand(1);


% formulae to obtain two independent uniform random variables
X(i)= sqrt(-2*log(u1))*cos(2*3.14*u2); % will rand be independent in same statement?

Y(i)= sqrt(-2*log(u1))*sin(2*3.14*u2);

end

% checking mu and sigma
meanX=mean(X)
stdX= std(X)


meanY=mean(X)
stdY= std(X)

% histogram to check the nature of pdf
hist(X,100);
title('Histogram Random Variable X','FontSize',16);
xlabel('Values taken by X','FontSize',16);
ylabel('Frequency Count','FontSize',16);


figure

hist(Y,100);
title('Histogram Random Variable Y','FontSize',16);
xlabel('Values taken by Y','FontSize',16);
ylabel('Frequency count','FontSize',16);
