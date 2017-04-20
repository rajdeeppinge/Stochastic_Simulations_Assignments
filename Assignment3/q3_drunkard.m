% Author - Rajdeep Pinge
% Date - 28th March, 2017

% Code to simulate drunkard’s walk with lattice points {0,1,2,3,4} with 0
% and 4 being the absorbing states in the Absorbing Markov Chain

clear;
close all;

states = [0 1 2 3 4];

%% Experimetal solution / simulation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iter = 100000;
max_steps = 100;

inState3 = zeros(iter, 1);
timeToAbsorb = zeros(iter, 1);
stateAbsorb = zeros(iter, 1);

for i = 1:iter
    currState = 1;
    count3 = 0;
    for j = 1:max_steps
       U = rand;        % generate uniformly distributed random variable
       
       if U >= 0.5      % go to next higher state with probability 0.5
           currState = currState + 1;
       else
           currState = currState - 1;
       end
           
       % to keep count of how many times it is in state 3
       if currState == 3
           count3 = count3 + 1;
       end
       
       % if it is absorbed then it will remain in that state hence no need
       % to simulate further
       if currState == 0 || currState == 4
           break;
       end
               
    end
    
    % store how many times it was in state 3 in this iteration
    inState3(i) = count3;
    
    % store the time taken by it to get absorbed
    % Here we assume that it will eventually get absorbed for a large
    % number of steps.
    timeToAbsorb(i) = j;
    
    if currState == 4       % if chain is absorbed in state 4 then store 1 in array
        stateAbsorb(i) = 1;
    end
end

disp('-----------------------------------------------------------------')
disp('Experimental Results:')

disp( [ 'Expected number of times that the drunkard is in state 3 = ' num2str( sum(inState3) / iter ) ] );

disp( [ 'Expected time to absorbtion = ' num2str( sum(timeToAbsorb) / iter ) ] );

% Here we know that the chain will eventually be absorbed. Hence total
% experiments where chain will be absorbed = no. of iterations

% Total no of experiments in which it is absorbed in state 4 = total
% 1 values in the array stateAbsorb

disp( [ 'Probability that the chain will be absorbed in state 4 = ' num2str( sum(stateAbsorb) / iter ) ] );



%% Analytical Solution %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 3;      % number of transient states {1, 2, 3}
r = 2;      % number of absorbing states {0, 4}

P = [1  0  0  0  0;
    .5  0 .5  0  0;
     0 .5  0 .5  0;
     0  0 .5  0 .5;
     0  0  0  0  1];
 
Q = P(2:4, 2:4);

%% i) Estimate the expected number of times that the drunkard is in state 3 
I = eye(size(Q, 1));

N = inv(I-Q);

disp('-----------------------------------------------------------------')
disp('Analytical Results:')

disp(['Expected number of times that the drunkard is in state 3 = ' num2str(N(1, 3))]);      % N(i, j) gives estimate of expected no of times the drunkard will be in state j given it starts in state i

%% ii) Estimate the expected time to absorbtion
c = ones(t, 1);

t = N*c;

disp(['Expected time to absorbtion = ' num2str(t(1))]);     % t(i) give estimated time of absorption given that it starts in state i

%% iii) Estimate probability that the chain will be absorbed in state 4

R = [P(2:4, 1) P(2:4, end)];

B = N*R;

disp(['Probability that the chain will be absorbed in state 4 = ' num2str(B(1,2))]);       % B(i, j) gives the probability that the Markov chain is absorbed in jth absorbing state given it starts in state i
% Note here that there are only 2 absorbing states {0, 4}. Therefore 0 is
% termed as 1st absorbing state and 4 as 2nd. Hence we have written 2
% instead of j in the above equation.


%%%%%%%%%%%%%%%%%%% Analytical Solution Complete %%%%%%%%%%%%%%%%%%%%%%%%%