% program to generate random variables from given pdf ie  30*(x^2-2*x^3+x^4) fuction using
% acceptance rejection method

clc;
close all;
clear all;

niter = 1000000;            % no of random variables to generate
randm = zeros(1,niter);     % array storing the value of random variable in each iteration

% maximum value of P/Q  where Q=1
% and P=30*(x^2-2*x^3+x^4) 
q=1;
c=1.875;                    

i=1;
for i=1:niter
    while 1
        y = rand();         % first random number
        u=rand();           % second random number
        
        % If condition satisfy then accept 1st random number
        % otherwise reject it and continue same process
        if(u<30*(y*y)*(1-2*y+y*y)/c*q)    
            randm(i) = y;
            break;
        end
    end
end

% histogram of generated random variables 
histogram(randm,40);
xlim([0 1]);
title({['Simulated frequency plot of random variable x '];['for ' num2str(niter) ' iterations']});
xlabel('value of random variable', 'FontSize', 16)
ylabel('Frequency of occurance', 'FontSize', 16)

% pdf's plot
figure();
dx=0.001;
x1 = 0:dx:1;
values = 30*(x1.*x1).*(1-2*x1+x1.*x1);
plot(x1,values,'g','Linewidth',2)
title('PDF');
xlabel('value of random variable', 'FontSize', 16)
ylabel('value of pdf', 'FontSize', 16)
