% Author - Rajdeep Pinge
% Date - 28th March, 2017

% Programme to simulate a discrete time queue modelled as Markov chain with
% states being possible lengths of the queue {0, 1, ..., 50}

clear;
close all;

n = 50;     % capacity of queue
p = 0.4;    % probability of new person coming
r = 0.5;    % probability that the current person has been serviced.

iter = 1000;      % number of iterations for which the experiment is performed
max_steps = 10000;   % in each iteration, a new markov chain is simulated for a maximum of these many steps

queue_state = zeros(n+1, 1);   % to store the number of times that the queue is in each state

for i = 1:iter
    x = 0;      % initially queue is empty

    for j = 1:max_steps
       U1 = rand;        % generate uniformly distributed random variable
       U2 = rand;
       
       if U1 <= p && x < n       % a new person comes in queue
           x = x + 1;
       end
           
       if U2 <= r && x > 0      % a person has been serviced and leaves the queue
           x = x - 1;
       end
       
       queue_state(x+1) = queue_state(x+1) + 1;     % increment count of state in which the person is currently present
               
    end

end

% find out stationary vector
% Stationary vector can essentially be considered as the fraction of times
% that the person is in particular state
stationary_vector = queue_state' ./ (iter * max_steps);

% to find average queue length we make use of queue_state

queue_length = zeros(n+1, 1);   % array to store queue_length for each possible state

for i = 1:n+1
   queue_length(i) = queue_state(i) * i-1;  % multiplied by queue length to get total queue length when it is in each state
end

disp( [ 'Average queue length = ' num2str( sum(queue_length)/(iter * max_steps) ) ] );



%% generate transition matrix to verify stationary vector
P = zeros(n+1, n+1);

P(1, 1) = (1-p)*r + p*r + (1-p)*(1-r);
P(1, 2) = p*(1-r);        % prob of state change from 1 to 2 i.e. 1 person added

P(n+1, n+1) = p*(1-r) + p*r + (1-p)*(1-r);
P(n+1, n) = (1-p)*r;      % prob of state change from 50 to 49 i,e 1 person serviced

for i = 2:n
   P(i, i-1) = (1-p)*r;
   P(i, i) = p*r + (1-p)*(1-r);
   P(i, i+1) = p*(1-r);
end

% check if stationary vector matches i.e. verify if w*P = w
stationary_vect_check = stationary_vector * P;

% The above resultant vector is very close to the stationary vector found
% out earlier. Hence it is indeed a stationary vector.