function [intv0ln] = puzzle_search(intv2da,intv1da)
intv000 = intv1da(1,:);
intv001 = length(intv000);

% % searcuhing the element in the matrx
intv0ln = find((intv2da(:,1) == intv000(1,1)) & (intv2da(:,2) == intv000(1,2)) & (intv2da(:,3) == intv000(1,3)) ...
    & (intv2da(:,4) == intv000(1,4)) & (intv2da(:,5) == intv000(1,5)) & (intv2da(:,6) == intv000(1,6)) ...
    & (intv2da(:,7) == intv000(1,7)) & (intv2da(:,8) == intv000(1,8)) & (intv2da(:,9) == intv000(1,9)));
end