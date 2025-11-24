 function [ii,ic,G] = components_ii_ic(cc)

[I,~] = rangesearch( cc, cc, 1 ); %I(k) who are the neighbors of k

n = size(I,1);

J = arrayfun( @(x) x * ones(1,length(I{x})), (1:length(I))', 'Uni',false );

Adj = sparse( cat(2,I{:}), cat(2,J{:}), true, n, n );
Adj = Adj - diag(diag(Adj));

G = graph(Adj);
[ii,ic] = conncomp(G); %% ii(k) in whick component k belongs, ic(1) how large is component 1.

end