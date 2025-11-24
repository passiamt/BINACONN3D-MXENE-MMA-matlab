%Multilayer MMA - Inverse Design by Topology Optimization
%Read Dielectric Constant 
clear;

Seed = [ ones(1,10);
         2*ones(1,10);
         3*ones(1,10);
         4*ones(1,10);
         5*ones(1,10);
         6*ones(1,10);
         7*ones(1,10);
         8*ones(1,10);
        ]; 


 seedk = 8 ;          

 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(1),'Seed_conn',num2str(Seed(seedk,1)),'.mat']);
 
 e_mat_M{1,1} = printable_device;

 idx_M{1,1} =  exp_coord;


 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(2),'Seed_conn',num2str(Seed(seedk,2)),'.mat']);
 
 e_mat_M{2,1} = printable_device;

 idx_M{2,1} =  exp_coord;

 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(3),'Seed_conn',num2str(Seed(seedk,3)),'.mat']);

 e_mat_M{3,1} =  printable_device;
 
 idx_M{3,1} =  exp_coord;


 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(4),'Seed_conn',num2str(Seed(seedk,4)),'.mat']);
 e_mat_M{4,1} = printable_device;

 idx_M{4,1} =  exp_coord;

 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(5),'Seed_conn',num2str(Seed(seedk,5)),'.mat']);
 e_mat_M{5,1} = printable_device;
 
 idx_M{5,1} =  exp_coord;

 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(6),'Seed_conn',num2str(Seed(seedk,6)),'.mat']);
 e_mat_M{6,1} = printable_device;

 idx_M{6,1} =  exp_coord;


 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(7),'Seed_conn',num2str(Seed(seedk,6)),'.mat']);
 e_mat_M{7,1} = printable_device;

 idx_M{7,1} =  exp_coord;


 load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(8),'Seed_conn',num2str(Seed(seedk,6)),'.mat']);
 e_mat_M{8,1} = printable_device;

 idx_M{8,1} =  exp_coord;

  load(['BINACONN3D/Output_data_used_in_the_paper/e_mat_Layer',num2str(9),'Seed_conn',num2str(Seed(seedk,6)),'.mat']);
 e_mat_M{9,1} = printable_device;

 idx_M{9,1} =  exp_coord;

%%  Insert the 7 layer device into Comsol


PROJECT_PATH = fullfile(fileparts(mfilename('fullpath')), '../');
addpath(PROJECT_PATH)

model = mphload(fullfile(PROJECT_PATH,'comsol-files/MMA_MXene_manufacturable8.mph')); 


e_air = [8];

clear e_1 e_2_7

k1 = 0;

k7 = 0;

%%

Nx = 22;

Ny = 48;

Nz = 7;

for  l =  1:length(e_mat_M) 

    e_mat = e_mat_M{l,1};

    idx =  idx_M{l,1};

    for m = 1:1:length(e_mat)

        if e_mat(m)-1 < 10^(-8)

                 k1 = k1+1;

                 e_1(k1) =     (idx(m,2)-1)*Ny*Nz + (idx(m,1)-1)*Nz + idx(m,3);
                 
        elseif e_mat(m)-2.7 < 10^(-8)

                 k7 = k7+1;

                 e_2_7(k7)  =   (idx(m,2)-1)*Ny*Nz + (idx(m,1)-1)*Nz + idx(m,3);
                 
        end

    end

end




for i = 1:1:size(e_1,2)

    if e_1(i)>= 8
        e_1(i) = e_1(i)+1;

    end

end    

for i = 1:1:size(e_2_7,2)

    if e_2_7(i)>= 8
        e_2_7(i) = e_2_7(i)+1;

    end

end 

%%   Sel1  --- Material 1 -- 1

sel1 = model.selection('sel8');

sel1.set([e_1,8]);

model.material('mat2').selection.named('sel8');


%%   Sel7  --- Material 2 -- 2.7

sel7 = model.selection('sel7');

sel7.set([e_2_7]);

model.material('mat10').selection.named('sel7');

mphsave(model,[fullfile(PROJECT_PATH,'comsol-files/MMA_MXene_manufacturable8_done.mph')]);  

 


