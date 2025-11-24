%% Read data and produce Fig 17
clear;

PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)

% Read measurements raw file with S-parameters

S = sparameters(fullfile(PROJECT_PATH,'measurement-data/Fig17_raw_data_meas.s2p'));

% Calculate absorbance
A = 1-abs(S.Parameters(1,1,:)).^2;

% Fourier of the absorbance line graph to eliminate oscillations that are
% due to the cable length
F_shifted = fftshift(fft(A));

F_shifted = reshape(F_shifted, 2000, 1);

% Plot FFT and lower the peaks of the frequencies that correspond to the oscillations.
figure(); plot(20.*log10(abs(F_shifted)))

F_shifted(1018:1027,1) =  0;
F_shifted(975:984,1) =  0;

% Reconstruct the absorption line
A_reconstructed = ifft(ifftshift(F_shifted));


% Read simulations file
FEM = readmatrix('A_Manufacturable_8.txt','NumHeaderLines',5);

% Plot Simulations and measurements
figure();
hold on; plot(FEM(:,1), FEM(:,2), '--', 'Color',[0 0 0], 'LineWidth',2);
hold on; plot(S.Frequencies./10^9,A_reconstructed, '+', 'Color',[0 0 0], 'LineWidth',2,'MarkerSize',2)

xlim([8.2 12.4]); ylim([0,1]);
xlabel('Frequency (GHz)')
ylabel('Absorbance')
legend('Simulation', 'Measurement')
grid on;
box on;