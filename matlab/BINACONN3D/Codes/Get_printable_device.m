function [e_mat_print,seed] = Get_printable_device(e_mat, Coord, Perc,Coord_a)

  nrem = zeros(7,1);

  ndrp = zeros(7,1);

  %% Compute the number of pixels to remove for each material

  ic_tot = cell(7,1);

  for i = 1:1:(size(Perc,1)-1)

    pos = find(e_mat == Perc(i,1));

    cc = Coord(pos,:);  % coordinates of regions having a material Perc(i,1)

    %% Compute the number of components of the material and find which pixels belong to each component

    [ii,ic] = components_ii_ic(cc);  % ii(k) shows in which component k belongs; ic(k) shows how many pixels each component has
    
    ii_global = zeros(length(e_mat), 1);
    ii_global(pos) = ii;
    ic_tot{i,1} = {ic};

    %%  Coordinates of pixels that have er = Perc(i,1);

    for j = 1:1:size(ic,2)

      %% idx  X,Y,Z of printable structure, xx,yy,zz of a specific material
      % fprintf( 'working on %d and %d\n', i, j )

      [n_air,n_res,e_mat]  =  remove_pixels_from_component_anydim(i,j,e_mat,ii_global,ic,Perc,Coord,Coord_a);

    end

    e_mat_print = e_mat;

  end

