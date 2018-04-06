function [c1,c2] =  cost_estimation(start,final)
% % % % Cost estimation....
% % Estimating C1 for the difference in the  
% % final and initial state of the puzzle
c1=sum(sum(~(start == final)));
% % initializnig c2 to 0
c2 = 0;
for i = 1 : 3
    for j = 1 : 3
        % % storing value of elements in i2 to compare
        % % with the final state
        i2 = start(i,j);
        % % putting final position of the element
        [i3 i4] = find(final == i2);
        % % Difference in the final position and the 
        % initial position
        c2 = c2 + abs(i3 - i) + abs(i4 - j);
    end
end
end