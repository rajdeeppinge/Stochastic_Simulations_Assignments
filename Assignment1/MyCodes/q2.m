clc;
clear all;
close all;

niter = 10000;
iter = 1:niter;

totaln = zeros(1,niter);
sum=0;
expn =  zeros(1,niter);

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

disp(['E(N) For 100 values of N = ' num2str(expn(100)) ]);
disp(['E(N) For 1000 values of N = ' num2str(expn(1000)) ]);
disp(['E(N) For 10000 values of N = ' num2str(expn(10000)) ]);