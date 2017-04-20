% here we simulate the steppings stone cellular automaton.
% we update each cell depending on a certain rule.

% it is important to note that this is an aborbing Markov chain
% with 2 absorbing states being all cells black and all white.
% thus given enough time these states will always be reached.
% thus after a long time we see one colour dominating the other.

% depending on the porportion of white and black cells in the beginning
% and since the transition to both states is equally likely, the cells 
% with majority eventually win. 
% the MC goes to one of the two absorbing states.

clear;
close all;

%% initialize grid

% get dim x dim square grid
dim = 10;

% populate grid with random 0's and 1's
mat = rand(dim,dim);
mat(mat>0.5) = 1;   % 
mat(mat<=0.5) = 0;

% dimensions of matrix
[c,r]= size(mat);

%% plot initial conditions
im=imagesc((1:c)+0.5,(1:r)+0.5,mat);            %# Plot the image, each grid centres around points like (2.5, 1.5)
colormap(gray);                              %# Use a gray colormap
title('Initial State')

axis equal                                   %# Make axes grid sizes equal

set(gca,'XTick',1:(c+1),'YTick',1:(r+1),...  %# Change some axes properties
        'XLim',[1 c+1],'YLim',[1 r+1],...
       'GridLineStyle','-','XGrid','on','YGrid','on');

figure

%% start simulation

% number of iterations
ite=1e3;

for i=1:ite

    % apply peridic boudary conditions
    latNS = [mat(end, :); mat; mat(1, :)]; % top row at bottom and bottom row at top to make them appear neighbours
    extMat = [latNS(:, end) latNS latNS(:,1) ]; % periodic mat    

    % get random x and y in the range [2 to n+1] which is the random point
    % whose state will be updated according to the given rule
    xrand= randi([2 dim+1]); % random x cordi 
    yrand= randi([2 dim+1]); % random y cordi

    % assign value of one of the neighbours randomly such that
    % any assignment is equally likely.
    if rand<=0.125
        extMat(xrand,yrand)= extMat(xrand-1,yrand-1);   % make it equal to neighbour diagonally at left and above
    elseif rand<=2*0.125
        extMat(xrand,yrand)= extMat(xrand-1,yrand);
    elseif rand<=3*0.125
        extMat(xrand,yrand)= extMat(xrand-1,yrand+1);
    elseif rand<=4*0.125
        extMat(xrand,yrand)= extMat(xrand,yrand-1);
    elseif rand<=5*0.125
        extMat(xrand,yrand)= extMat(xrand,yrand+1);
    elseif rand<=6*0.125
        extMat(xrand,yrand)= extMat(xrand+1,yrand-1);
    elseif rand<=7*0.125
        extMat(xrand,yrand)= extMat(xrand+1,yrand);
    else
        extMat(xrand,yrand)= extMat(xrand+1,yrand+1);
    end

    % strip the matrix of the boundary conditions before plotting
    mat= extMat(2:(dim+1),2:(dim+1));           % strip off the boundaries for the picture
    [c,r] = size(mat);                          % Get the matrix size
    im=imagesc((1:c)+0.5,(1:r)+0.5,mat);        % Plot the image, each grid centres around points like (2.5, 1.5)
    colormap(gray);                             % Use a gray colormap
    title(['State at time = ' num2str(i)])
    axis equal                                  % Make axes grid sizes equal

    set(gca,'XTick',1:(c+1),'YTick',1:(r+1),...  % Change some axes properties
            'XLim',[1 c+1],'YLim',[1 r+1],...
           'GridLineStyle','-','XGrid','on','YGrid','on');

    getframe; % plot new state 

end