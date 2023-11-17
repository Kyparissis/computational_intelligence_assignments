close all;   % Closes all windows
clear;       % Clears workspace
clc;         % Clears command window

warning off  % Suppress all warnings

%%      ARISTOTLE UNIVERSITY OF THESSALONIKI
%              School of Engineering
%  Department of Electrical and Computer Engineering
%% =-=-=-=- COMPUTATIONAL INTELLIGENCE -=-=-=-=
%%            FLC (1st) Assignment 
%              (12_Satellite.pdf)
%             PI Controller Design
%% Author: Kyparissis Kyparissis 
%         ( University ID: 10346 )

Gp = zpk([], [-1, -9], 10) % == 10/((s+1)(s+9))

%% PI Controller tuning
% Firstly, put the controller's zero between the poles -1 and -9 of the system and
% in a position near the dominant pole which is the -1 one.
Gc = zpk(-1.5, 0, 2); 

% Then we use trial and error and the requirements tool of
% controlSystemDesigner() to get our requirements
% After that we save the models found for later use

% controlSystemDesigner(Gp, Gc);
% save controlSystemDesignerVariables.mat

% Load the controller model found earlier
Gc = load("controlSystemDesignerVariables.mat").Gc

openLoopSystem = Gp * Gc
closedLoopSystem = feedback(openLoopSystem, 1, -1)

%% Root locus plot
figure;
rlocus(openLoopSystem);

%% Step response plot
figure;
step(closedLoopSystem);

%% Calculate the Ki and Kp values of the controller
Kp = Gc.K;
Gc_zero = Gc.Z{1};
Ki = -Kp*Gc_zero;

fprintf("\nKp = %g \t Ki = %g\n", Kp, Ki);
