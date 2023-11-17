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
%           Fuzzy Controller Design
%% Author: Kyparissis Kyparissis 
%         ( University ID: 10346 )

% Session of Fuzzy Logic Designer
% Output is saved in the FuzzyController.fis file
% fuzzyLogicDesigner

%% TO VIEW SESSION OPEN fuzzyLogicDesigner and import FuzzyController.fis

FuzzyController = readfis('FuzzyController.fis');
save('FuzzyController','FuzzyController')

showrule(FuzzyController) % Display all rules