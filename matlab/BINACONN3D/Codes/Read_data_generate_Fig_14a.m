% Plot of Fig 14 (a)
% Plot manufacturable subcomponents with seed 8. 
% The manufacturable components are located in the subfolder
% 'Output_data_used_in_the_paper' with a name 'e_mat_LayeriSeed_connj.mat',
% where i is the subcomponent number 1-9 and j is the seed. In this script
% seed=8.

PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)

figure();hold on;
% 1
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer1Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0,0.47,0.74] , 'EdgeColor', [0,0.47,0.74] ) 

% 2
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer2Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0.64,0.08,0.18], 'EdgeColor', [0.64,0.08,0.18])

% 3
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer3Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0.93,0.69,0.13], 'EdgeColor', [0.93,0.69,0.13])

% 4
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer4Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0.59,0.80,0.60], 'EdgeColor', [0.59,0.80,0.60])

% 5
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer5Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0.49,0.18,0.56], 'EdgeColor', [0.49,0.18,0.56])

% 6
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer6Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0,0,0], 'EdgeColor', [0,0,0])

% 7
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer7Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0,0,1], 'EdgeColor', [0,0,1], 'NodeLabelColor',[0,0,1])


% 8
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer8Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor', [0.76,0.89,0.27], 'EdgeColor', [0.76,0.89,0.27], 'NodeLabelColor',[0.76,0.89,0.27])

% 9
load(fullfile(PROJECT_PATH,'Output_data_used_in_the_paper/e_mat_Layer9Seed_conn8.mat'));
V = printable_device;
X = exp_coord(:,1); Y = exp_coord(:,2); Z = exp_coord(:,3);
x = X(V>1); y = Y(V>1); z = Z(V>1);
[ii,ic,G] = components_ii_ic([x y z]);
plot(G, 'XData', x, 'YData', y, 'ZData', z, 'NodeColor',  [0.93,0.69,0.13], 'EdgeColor', [0.93,0.69,0.13], 'NodeLabelColor',[0.93,0.69,0.13])

view(3)
