% Author - Rajdeep Pinge
% Date - 2nd April, 2017

% Code to simulate an experiment where a ball is uniformly sampled from 
% the urn and the selected ball is put back along with one more ball of 
% the same color. This is repeated.
% We have to find M_100 where M_n is proportion of white balls at time n

clear;
close all;

w = 5;      % no. of white balls initially
b = 7;      % no. of black balls initially

iter = 100000;   % iterations for taking ensemble

n_max = 100;    % maximum time

Mn = zeros(n_max+1, iter);   % array storing proportion of white balls

% loop for ensemble
for en = 1:iter

    Mn(1, en) = w / (w+b);      % proportion of white balls at time = 0      

    % loop over time
    for n = 1:n_max
       u = rand;    % select a uniformly distributed random number 

       if u <= Mn(n, en)     % then a white ball has been selected
           w = w + 1;   % add an extra white ball
       else             % otherwise a black ball has been selected
           b = b + 1;   % add an extra black ball
       end

       % store proportion of white balls at that instant
       Mn(n+1, en) = w / (w+b);

    end

end

% display result
disp([' M_' num2str(n_max) ' = ' num2str( mean(Mn(n+1, :)) ) ])

% Take mean of all iterations at each time step
Mn_mean = zeros(n_max+1, 1);

for i = 1:n_max+1
    Mn_mean(i) = mean(Mn(i, :));
end


% plot the graph
plot(0:n_max, Mn_mean, 'LineWidth', 2)
axis([0 n_max 0 1]);
str = sprintf('Taking ensemble average over %d iterations', iter);
title({'Proportion of white balls'; str})
xlabel('Time (n)')
ylabel('Proportion of white balls (M_n)')
set(gca,'FontSize',16)
set(findall(gcf,'type','text'),'FontSize',16)
print('q4_Mn', '-djpeg100')