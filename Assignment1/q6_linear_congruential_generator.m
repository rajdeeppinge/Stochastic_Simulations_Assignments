% The only difference compared to q6.m is that
% here we use linear congruential method to generate
% a pseudo uniform random number.
%
% We need to properly set parameters like
% the seed value, period of repetition and divisor.

% We have chosen standard accepted values for the same.

% Rest of the procedure as in q6.m

clear
close all

% seed values
seed1=3;
seed2=7;

% multiplier a  and divisor M
a=22695477;
M=2^32;

% iterations
ite= 1e5;

% pseudo random sequences
rseq1=zeros(ite,1);
rseq2=zeros(ite,1);

rseq1(1)=seed1;
rseq2(1)=seed2;

% linear cpmgruential generator
for i=1:(ite-1)

rseq1(i+1)= (mod(a*rseq1(i),M));
rseq2(i+1)= (mod(a*rseq2(i),M));

end


rseq1= rseq1/M;
rseq2= rseq2/M;

% same procedure as in q6.m
% only change used the pseudo random sequences generated above
for i=1:ite

u1= rseq1(i);
u2= rseq2(i);

X(i)= sqrt(-2*log(u1))*cos(2*3.14*u2); % will rand be independent in same statement?

Y(i)= sqrt(-2*log(u1))*sin(2*3.14*u2);

end

meanX=mean(X)
stdX= std(X)


meanY=mean(X)
stdY= std(X)


hist(X,100);
title('Histogram Random Variable X','FontSize',16);
xlabel('Values taken by X','FontSize',16);
ylabel('Frequency Count','FontSize',16);


figure

hist(Y,100);
title('Histogram Random Variable Y','FontSize',16);
xlabel('Values taken by Y','FontSize',16);
ylabel('Frequency count','FontSize',16);



