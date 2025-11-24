function [n_air,n_res,e_mat] = remove_pixels_from_component_anydim(...
  i_material,j_group,e_mat,component_id,num_of_pixels_per_comp,Perc,coord,Coord_a)
% REMOVE_PIXELS_FROM_COMPONENT_ANADIM - Remove pixels while maintaing a
% connected device
%
% [n_air,n_res,e_mat] = remove_pixels_from_component_anydim(i_material,j_group,e_mat,ii,ic,Perc,yy,xx)
%
% Inputs:
%   i_material:  ...
%   j_group: ...
%   e_mat:
%   component_id:
%   num_of_pixels_per_comp:
%   Perc:
%   coord

arguments
  i_material
  j_group
  e_mat
  component_id
  num_of_pixels_per_comp
  Perc
  coord
  Coord_a
end


%% Material and percentages

er = Perc(i_material,1);

group = Perc(i_material,3);

drop = Perc(i_material,4);

%% Number of pixels of group j

n_group = num_of_pixels_per_comp(j_group);

%% Pixels of group j not to be removed

% Coordinates of pixels in group j of material i

idx_connected_group = find(component_id' == j_group);

%% Pixels of group j to be removed

ndrop = floor(n_group*(Perc(i_material,4)/Perc(i_material,3)));

nrem = 0;

pos_material = find(e_mat > 1);

coord_material = coord(pos_material,:);
  
idx_articulation = find_articulation_points(coord_material);
idx_articulation = pos_material(idx_articulation);

[Lia,Locb] = ismember( Coord_a , coord ,"rows");

idx_art_additional = Locb;


[ii_test,ic_test] = components_ii_ic(coord_material);

if length (ic_test)>1
 error('Not connected 1');
end

if ndrop == 0
  for v = 1 : length(idx_connected_group)
    e_mat( idx_connected_group(v) ) = 2.7;
  end
  n_air = 0;
  n_res = length( idx_connected_group );
end



%%
iter_in4 = 0;

while nrem<ndrop && iter_in4<5000

  iter_in4 = iter_in4 + 1;

  v = floor((length(idx_connected_group)-1).*rand(1,1))+1;

  % if mod(v,10) == 0
  %    visualize_structure(e_mat, [jj_a, ii_a], [], [y_(v) x_(v)], er);
  %    drawnow
  % end

  if  e_mat( idx_connected_group(v) ) ~= 1

    if ~any( ([idx_articulation;idx_art_additional] == idx_connected_group(v)) )  % try to remove
      
      % make the pixel v of this group into an air pixel (remove material)
      e_mat(idx_connected_group(v)) = 1;

      % find which points are articulation points after removal
      pos_material = find(e_mat > 1);

      coord_material = coord(pos_material,:);
  

       [ii_test,ic_test] = components_ii_ic(coord_material);
        if length (ic_test)>1   
           error('Not connected 2')
        end
     
      idx_articulation = find_articulation_points(coord_material);
      idx_articulation = pos_material(idx_articulation);


      nrem = nrem + 1;

      if mod(nrem, 10) == 0
        fprintf( '...removed %d/%d for er = %.3f\n', ...
          nrem, ndrop, er );
      end

    end

  end


end


%%


if (nrem >= ndrop || iter_in4==5000) && ndrop~=0

  clear e_group1 n_air n_res y_a y_m x_m x_a
  
  % extract this island
  e_group1 = e_mat( idx_connected_group );

  % find which are air
  [idx_air] = find(e_group1 == 1);

  [idx_material] = find(e_group1  == Perc(i_material,1));

  e_mat( idx_connected_group( idx_material ) ) = 2.7;

  n_air = length(idx_air);
  n_res = length(idx_material);
end






end