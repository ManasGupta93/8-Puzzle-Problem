function [pzinl] =  puzzle_join(pzinl,start,f,g,cost)
[i,j] = size(pzinl);
pzinl(i+1,1:3) = start(1,:);
pzinl(i+1,4:6) = start(2,:);
pzinl(i+1,7:9) = start(3,:);
pzinl(i+1,10) = f;
pzinl(i+1,11) = g;
pzinl(i+1,12) = cost;
end