clc;
clearvars;
start = input('enter a puzzle in 3 x 3 form (use 0 for space) ..........:   ');
final = [1 2 3 ; 4 5 6 ; 7 8 0];
% % Intializing the matirces...
    pzinl = [];
    pzhis = [];
    pzrhis = [];
    g = 0;
    [c1,c2] = cost_estimation(start,final); % calling cost function 
    cost = c1 + c2; % calculating total cost of the present state to reach 
                   % final state
    f = cost + g;
    pzinl = puzzle_join(pzinl,start,f,g,cost);
    pzhis = puzzle_join(pzhis,start,f,g,cost);
    pzhis(1,13)=0;
    pzhis(1,14)=0;
    pzhis(1,15)=1;
    % % initializing variables 
    intv001 = 1;
    intv0ct = 0;
    intv0nd = 1;
    intv1nd = 1;
    
    % %  while loop for crating node to move the blank or '0' to different 
    % position according to its position in the puzzle
    while intv001 == 1;
        intv0ct = intv0ct + 1;
        [pzout, f, g, cost] =  puzzle_get(pzinl,1);
        [intv002, intv003] = find(pzout==0);
        pzinl = [];
           if cost ~= 0 % checking if cost is non zero
% % % % % % left movement of  blank or '0'
            if intv003 > 1
                pzout1 = pzout;
                pzout1(intv002,intv003) = pzout(intv002,intv003 - 1);
                pzout1(intv002,intv003 - 1) = 0;
                % % cost estimation at each step
                [c1,c2] = cost_estimation(pzout1,final);  
                cost = c1 + c2;
                intv0g1 = g + 1;
                f = intv0g1 + cost;
                [pzinl] =  puzzle_join(pzinl,pzout1,f,intv0g1,cost);
            end
% % % % % % up movement of  blank or '0'
            if intv002 > 1
                pzout1 = pzout;
                pzout1(intv002,intv003) = pzout(intv002-1,intv003);
                pzout1(intv002-1,intv003) = 0;
                [c1,c2] = cost_estimation(pzout1,final);
                cost = c1 + c2;
                intv0g1 = g + 1;
                f = intv0g1 + cost;
                [pzinl] =  puzzle_join(pzinl,pzout1,f,intv0g1,cost);                
            end
% % % % % % right movement of  blank or '0'
            if intv003 < 3
                pzout1 = pzout;
                pzout1(intv002,intv003) = pzout(intv002,intv003 + 1);
                pzout1(intv002,intv003 + 1) = 0;
                [c1,c2] = cost_estimation(pzout1,final);
                cost = c1 + c2;
                intv0g1 = g + 1;
                f = intv0g1 + cost;
                [pzinl] =  puzzle_join(pzinl,pzout1,f,intv0g1,cost);                
            end
% % % % % % down movement of  blank or '0'
            if intv002 < 3
                pzout1 = pzout;
                pzout1(intv002,intv003) = pzout(intv002 + 1,intv003);
                pzout1(intv002 + 1,intv003) = 0;
                [c1,c2] = cost_estimation(pzout1,final);
                cost = c1 + c2;
                intv0g1 = g + 1;
                f = intv0g1 + cost;
                [pzinl] =  puzzle_join(pzinl,pzout1,f,intv0g1,cost);                
            end
% % % % % % compare with history
            [intv003, intv004] = size(pzinl);
            for intv004 = 1 : intv003
                intv005 = puzzle_search(pzhis,pzinl(intv004,:));
                if ~isempty(intv005)
%                     pzhis(intv005,13) = 1;
                else
                    [intv007 , intv008] = size(pzhis);
                    intv008 = pzinl(intv004,1:12);
                    intv008(13) = 0;
                    intv008(14) = intv0nd;
                    intv1nd = intv1nd + 1;
                    intv008(15) = intv1nd;
                    pzhis(intv007+1,:)=intv008;
                end
            end
            % % % % % % selecting new node
            intv005 = find(pzhis(:,13) == 1);
            intv006 = length(intv005);
            pzrhis = pzhis;
            for intv007 = 1:intv006
                pzrhis(intv005(intv007)-(intv007-1),:)=[];
            end
            intv003 = min(pzrhis,[],1);
            [pzout, f, g, cost] =  puzzle_get(intv003,1);
            [intv002, intv003] = find((pzrhis(:,10)==f) & (pzrhis(:,13) == 0));
%             intv002 = intv002(1,1);
            [pzout, f, g, cost] = puzzle_get(pzrhis,intv002(1,1));
            intv0nd = pzrhis(intv002(1,1),15);
            pzinl = [];
            [pzinl] =  puzzle_join(pzinl,pzout,f,g,cost);
            intv005 = puzzle_search(pzhis,pzinl);
            pzhis(intv005,13) = 1;
            intv001 = 1;
        else
            intv001 = 2;
        end
    end
% % Display of steps
    [intv000, intv001] = size(pzhis);
    intv002 = 1;
    pzshow = [];
    intvcnt = 0;
    while intv002 ==1
        intvcnt = intvcnt + 1;
        pzshow(intvcnt) = intv000;
        intv000 = pzhis(intv000,14);
        if intv000 == 0
            intv002 = 2;
        else
            intv002 = 1;
        end
    end
    for intv000 = 1 : intvcnt
        [pzout, f, g, cost] =  puzzle_get(pzhis,pzshow(intvcnt-intv000+1));
        steps=['step number:',intv000];
        disp(steps);
        disp(pzout);
    end           
            