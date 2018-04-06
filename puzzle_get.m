function [pzout, f, g, cost] =  puzzle_get(pzinl,n_iter);
% Initializing the ouput matrix to null
pzout=[];

% filling the elements of the output matrix from the intermediate matrix
% at nth iteration.
pzout(1,1:3) = pzinl(n_iter,1:3);
pzout(2,1:3) = pzinl(n_iter,4:6);
pzout(3,1:3) = pzinl(n_iter,7:9);
f = pzinl(n_iter,10);
g = pzinl(n_iter,11);
cost = pzinl(n_iter,12);
end