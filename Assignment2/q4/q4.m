% The code checks if Sterling's approximation asymptotically tends to the
% factorial or not. The definition states that if the ratio of 
% factorial to sterlings approximation tends to 1 as n tends to infinity
% then it is a good estimate for the factorial. We verify this by plotting
% for first 100 factorials.

clear;
close all;


ite=100;

% used as a measure of how good the approximation is 
ratio= zeros(ite,1);

% check for first 100 numbers
for i=1:ite
  
    % ratio of actual answer to Sterling's approximation
  ratio(i)= factorial(i)/ ( (i^i/exp(i) )*sqrt(2*pi*i) ) ;
end


plot(1:ite,ratio)
xlabel('n');
ylabel('ratio of actual to approximation');
title('Sterling approximation asymtotically equals factorial');