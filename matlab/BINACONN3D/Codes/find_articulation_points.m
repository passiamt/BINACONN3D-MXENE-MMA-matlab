function [ap] = find_articulation_points(cc)

  [I,~] = rangesearch( cc, cc, 1 ); %I(k) who are the neighbors of k

  n = size(I,1);

  J = arrayfun( @(x) x * ones(1,length(I{x})), (1:length(I))', 'Uni',false );

  Adj = sparse( cat(2,I{:}), cat(2,J{:}), true, n, n );
  %Adj = Adj - diag(diag(Adj));


  [~,ap] = biconncomp( graph(Adj) );

end