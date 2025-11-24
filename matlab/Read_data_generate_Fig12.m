%% Read data and plot Fig.12
PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)

% Read absorbance of 2 material level MMA 
A_2materials = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_2materials.txt'),'NumHeaderLines',5);

% Plot absorbance of 2 material level MMA
figure();
hold on; plot(A_2materials(:,1), A_2materials(:,2), '--', 'Color',[0,0,0], 'LineWidth',2);

% Read absorbance of 4 material level MMA 
A_4materials = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_4materials.txt'),'NumHeaderLines',5);

% Plot absorbance of 4 material level MMA

hold on; plot(A_4materials(:,1), A_4materials(:,2), '-.', 'Color',[0,0,0], 'LineWidth',2);

% Read absorbance of 7 material level MMA 
A_7materials = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_7materials.txt'),'NumHeaderLines',5);

% Plot absorbance of 7 material level MMA

hold on; plot(A_7materials(:,1), A_7materials(:,2), '.', 'Color',[0,0,0], 'LineWidth',2);

% Read absorbance of continuous optimized MMA 
A_continuous = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_continuous.txt'),'NumHeaderLines',5);

% Plot absorbance of continuous optimized MMA 
hold on; plot(A_continuous(:,1), A_continuous(:,2), '-', 'Color',[0,0,0], 'LineWidth',2);