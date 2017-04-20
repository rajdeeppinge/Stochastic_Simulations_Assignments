% Code to generate normal random variables with mean 0 and variance 1 using
% polar method and box-muller transformation

% Author: Rajdeep Pinge
% Date: 18-02-2017

clear;
close all;

niter = 1e5;
X = zeros(1, niter+1);
Y = zeros(1, niter+1);

for i = 1:niter
    U1 = rand;
    U2 = rand;

    R2 = -2*log(U1);
    theta = 2*pi*U2;
    
    X(i) = sqrt(R2)*cos(theta);
    Y(i) = sqrt(R2)*sin(theta);
end

histogram(X, 'Normalization', 'pdf')
title('Generating random normal variable using polar method')
xlabel('X-values')
ylabel('Probability density')

figure

histogram(Y, 'Normalization', 'pdf')
title('Generating random normal variable using polar method')
xlabel('X-values')
ylabel('Probability density')