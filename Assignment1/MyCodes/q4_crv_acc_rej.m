% Code to generate a discrete random variable using inverse transform
% method

% Author: Rajdeep Pinge
% Date: 18-02-2017

clear;
close all;

pts = 1000000;
X = zeros(1, pts+1);

for i = 1:pts+1
    while 1
        U1 = rand;
        U2 = rand;

        if U2 <= 16*U1*U1*(U1-1)*(U1-1)
           X(i) = U1;
           break
        end
    end
end

histogram(X)

x = 0:1/pts:1;
fx = 30.*x.*x.*(x-1).*(x-1);

figure
plot(fx)