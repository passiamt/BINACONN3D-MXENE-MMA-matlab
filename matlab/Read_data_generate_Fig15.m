%% Read data and indicatively plot the A of the Manufacturable device 8 (the one fabricated and measured) and the device of 7 materials 
PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)

% Read Manufacturable device 8
Manufacturable_8 = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_Manufacturable_8.txt'),'NumHeaderLines',5);

% Plot Manufacturable device 8
figure();
hold on; plot(Manufacturable_8(:,1), Manufacturable_8(:,2), '-', 'Color',[0.64,0.08,0.18], 'LineWidth',2);

% Device of 7 materials
Mat_7 = readmatrix(fullfile(PROJECT_PATH,'comsol-files/Output_data/A_7materials.txt'),'NumHeaderLines',5);

hold on; plot(Mat_7(:,1), Mat_7(:,2), '-', 'Color',[0 0 0], 'LineWidth',2);
