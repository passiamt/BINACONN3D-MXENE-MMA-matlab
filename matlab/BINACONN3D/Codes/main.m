clear;
clc

% BINACONN3D transforms each subcomponent of the MMA with seven materials into a binary
% and connected subcomponent. 

% Load the device with 7 materials
PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)
eps = load(fullfile(PROJECT_PATH,'Input_data/e_discr_7materials.mat'));

e_mat_discr = real(eps.e_mat_discr);

%% Dielectric constants of 7 dielectric materials
U = 1.2 : (2.7-1.2)/6 :2.7;

%% Masks

%% Patch size

W = [20; 18; 16; 14; 12; 10];
nx = size(e_mat_discr,1);
ny = size(e_mat_discr,2);

Mask_Patch = cell(length(W), 1);
Mask_Frame = cell(length(W), 1);
Mask_Art_Patch = cell(length(W), 1);
Mask_Art_Frame = cell(length(W), 1);

for i = 1 : length(W)
  M = zeros(nx, ny);
  M( nx/2 - W(i)/2 + 1 : nx/2 + W(i)/2, ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2  ) = 1;
  M( 1: W(i)/2                        , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2  ) = 1;
  M( nx - W(i)/2 + 1 : nx             , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2  ) = 1;

  P = 1 - M;

  M_ = zeros(nx, ny);

  M_(nx/2 - W(i)/2 + 1                , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2) = 1;

  M_(nx/2 + W(i)/2                    , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2) = 1;

  M_(nx/2 - W(i)/2 + 1 : nx/2 + W(i)/2, ny/2 - W(i)/2 + 1) = 1;

  M_(nx/2 - W(i)/2 + 1 : nx/2 + W(i)/2, ny/2 + W(i)/2) = 1;

  M_( W(i)/2                           , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2  ) = 1;

  M_( 1: W(i)/2                        , ny/2 - W(i)/2 + 1 ) = 1;

  M_( 1: W(i)/2                        , ny/2 + W(i)/2  ) = 1;

  M_( nx - W(i)/2 + 1           , ny/2 - W(i)/2 + 1 : ny/2 + W(i)/2  ) = 1;

  M_( nx - W(i)/2 + 1:nx        , ny/2 - W(i)/2 + 1) = 1;

  M_( nx - W(i)/2 + 1:nx        , ny/2 + W(i)/2  ) = 1;


  P_ = zeros(nx, ny);

  P_(nx/2 - W(i)/2               , :) = 1;

  P_(nx/2 + W(i)/2+1             , :) = 1;

  P_(W(i)/2+1                    , :) = 1;

  P_( nx - W(i)/2                , :) = 1;


  Mask_Patch{i} = M;
  Mask_Frame{i} = P;
  Mask_Art_Patch{i} = M_;
  Mask_Art_Frame{i} = P_;

end



%% Print IDs of each subcomponent

V = zeros(size(e_mat_discr,1), size(e_mat_discr,2), size(e_mat_discr,3));

V(:,:,1) = 1;
for i = 2 : length(W)
  V(:,:,i) = Mask_Patch{i-1} * i + Mask_Frame{i-1} * (i-1);
end

Mask_P6_center = zeros(nx,ny);

Mask_P6_center(nx/2 - W(6)/2 + 1 : nx/2 + W(6)/2, ny/2 - W(6)/2 + 1 : ny/2 + W(6)/2) = 1;

Mask_P6_left = zeros(nx,ny);

Mask_P6_left( 1: W(6)/2                        , ny/2 - W(6)/2 + 1 : ny/2 + W(6)/2  ) = 1;

Mask_P6_right = zeros(nx,ny);

Mask_P6_right( nx - W(6)/2 + 1 : nx             , ny/2 - W(6)/2 + 1 : ny/2 + W(6)/2  ) = 1;

V(:,:,7) = Mask_Frame{6}*length(W) + Mask_P6_center * (length(W)+1) + Mask_P6_left * (length(W)+2)+ Mask_P6_right*(length(W)+3);

%% Table that relates each dielectric constant U(1)-U(7) to a resin percentage (2nd column). The fourth column is the air percentage.

Perc = [U(1)         1.8/9   9  7.2;
        U(2)         3.42/9  9  5.58;
        U(3)         4.68/9  9  4.32;
        U(4)         5.85/9  9  3.15;
        U(5)         7.02/9  9  1.98
        U(6)         7.74/9  9  1.26;
        U(7)            1    0  0;
       ];

idxX = cell(max(V(:)), 1);
idxY = cell(max(V(:)), 1);
idxZ = cell(max(V(:)), 1);
e_mat = cell(max(V(:)), 1);

Coord = cell(max(V(:)), 1);
Coord_a = cell( max(V(:)), 1);

idxX_a = cell(max(V(:)), 1);
idxY_a = cell(max(V(:)), 1);
idxZ_a = cell(max(V(:)), 1);

%% Which cells should remain as resin - they cannot be removed

Additional_articulation_points = zeros(size(e_mat_discr,1), size(e_mat_discr,2), size(e_mat_discr,3));

for i = 2 : length(W)
  Additional_articulation_points(:,:,i) =  i * Mask_Art_Patch{i-1} + (i-1) * Mask_Art_Frame{i-1};
end



%% For each subcomponent 

for i = 1 : max(V(:))

 

  [idxX{i}, idxY{i}, idxZ{i}] = ind2sub(size(V), find(V==i));


  %% Additional articulation points

  [idxX_a{i}, idxY_a{i}, idxZ_a{i}] = ind2sub(size(V), find(Additional_articulation_points==i));

  
  %%
  e_mat{i} = e_mat_discr( V==i );
  
  Coord{i} = [idxX{i}, idxY{i}, idxZ{i}];

  Coord_a{i} = [idxX_a{i}, idxY_a{i}, idxZ_a{i}];

  [ii,ic,G] = components_ii_ic(Coord{i});

  assert( all( ii == 1 ) )
  
   for seed = 1:1:8 % Set the number of manufacturable subcomponents to be produced

      [printable_device] = Get_printable_device(e_mat{i},Coord{i}, Perc, Coord_a{i});

       Printable_device{i} = printable_device;

       Seed_str = int2str(seed);

       Name = [fullfile(PROJECT_PATH,'Output_data_live/'),'e_mat_','Layer',int2str(i),'Seed_conn',Seed_str];

       exp_coord = Coord{i};

       save([Name,'.mat'],'printable_device','exp_coord');

   end

end



