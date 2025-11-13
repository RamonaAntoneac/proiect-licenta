%--------SCOATE VEH DIN VECTORI-----------

V_sens_in_all = {V_sens_in1,V_sens_in2,V_sens_in3,V_sens_in4};
%---eliberare vect v_sens_in, cand e in sens si trece de intrarea
%respectiva
for i = 1:length(V_sens)
    veh = V_sens(i);
    pos = veh.Position;

    for j = 1:4
        if ismember(veh, V_sens_in_all{j})
            a_trecut = false;

           
            switch j
                case 1  % intrarea 1
                    if (pos(1) >5 && pos(1)<10) && (pos(2)>-9 && pos(2)<-2.47)  % ex: a trecut de y = -34
                        a_trecut = true;
                    end
                case 2
                    if (pos(1) < 10.63 && pos(1)>2.7) && (pos(2) >2.64 && pos(2)<5)
                        a_trecut = true;
                    end
                case 3
                    if (pos(1) < -3 && pos(1) >-8) && (pos(2) < 9 && pos(2) >3)
                        a_trecut = true;
                    end
                case 4
                    if (pos(1) > -8 && pos(1) <-3) && (pos(2) <-4.5 && pos(2) > -10)
                        a_trecut = true;
                    end
            end

            if a_trecut
                idx_remove = [];
                for k = 1:length(V_sens_in_all{j})
                    if isequal(V_sens_in_all{j}(k), veh)
                        idx_remove = k;
                        break;
                    end
                end
                
                if ~isempty(idx_remove)
                    V_sens_in_all{j}(idx_remove) = [];
                    disp("Vehiculul "+ veh.Name+ " a trecut de intrarea " + j);
                end
            end
        end
    end
end

% actualizare vectori finali
V_sens_in1 = V_sens_in_all{1};
V_sens_in2 = V_sens_in_all{2};
V_sens_in3 = V_sens_in_all{3};
V_sens_in4 = V_sens_in_all{4};


%---eliberare V dupa ce veh intra in sens
V_new = V;
for i = 1:length(V_sens)
    for j = 1:length(V_new)
        if isequal(V_sens(i), V_new(j))
            V_new(j) = []; 
            break;  
        end
    end
end
V = V_new; 


for g = length(V_sens_in4):-1:1  % parcurgere inversă pentru a evita probleme când se șterge
    if strcmp(V_sens_in4(g).Name, "Car3_0")
        if V_sens_in4(g).Position(1) >= 3.9 && V_sens_in4(g).Position(2) >= 36
            V_sens_in4(g) = [];  
        end
    end

end