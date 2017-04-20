% Q2. The following code simulates N, the minimum number of random variables needed
% to take the sum of those above 1. We estimate the Expected value of N for different
% number of iterations. We expect (pun unintended!) E(N) to be approach the theoritical value
% for a large number of iterations
%

clc;
clear all;
close all;



niter = 10000; % number of iterations
iter = 1:niter;

totaln = zeros(1,niter); % Array holding the N value for every iteration
sum=0; 
expn =  zeros(1,niter); % running estimate of E(N) 



% perform the experiment
for i=1:niter
    
    n=0;
    total=0;
    
while(total<1) % continue till sum is less than 1
        u = rand();
        total=total+u;
        n=n+1;
    end
    totaln(i)=n;
    sum=sum+n;
    expn(i)=sum/i; % simple average to estimate expectation

end

% note that for large N, average tends to expectation

% plot of running expectation in log scale
figure();
plot(log10(iter),expn);
xlabel('10^x iteration');
ylabel('E(N)');
set(findall(gcf,'-property','FontSize'),'FontSize',13)

figure();
plot(iter,expn);
xlabel('x iteration');
ylabel('E(N)');
set(findall(gcf,'-property','FontSize'),'FontSize',13)

% display the final estimate of E(N)
disp(['E(N) For 100 values of N = ' num2str(expn(100)) ]);
disp(['E(N) For 1000 values of N = ' num2str(expn(1000)) ]);
disp(['E(N) For 10000 values of N = ' num2str(expn(10000)) ]);
