% inainte de calcul sa se scoata veh care parasesc sensul
if ~isempty(V_sens)
    Eliberare_vect
end

% verificare intersectie libera
if isempty(V_sens) && isempty(V)
    t_wait_in3 = 0;
end

for z = 1:length(V_sens_in3)
    veh_z = V_sens_in3(z);
    pos_veh_z = veh_z.Position;
    d_z_in3 = dist(pos_veh_z(1),pos_veh_z(2),X_in3,Y_in3);
    t_z_in3 = d_z_in3/v;
    cond = t_z_in3 - t_in3;
    %pentru in3 corespunde t_wait_in3
    if(t_wait_in3 == 0)
        if cond >= t_safety || t_safety <= -(cond)
            t_wait_in3 = 0;
        elseif t_safety >= -(cond)
            t_wait_in3 = t_safety + cond;
            t_wait_in3 = max(0,t_wait_in3);
        end
    else
        % cond1 = cond - t_wait_in3;
        if cond >= t_safety || t_safety <= -(cond)
            t_wait_in3 = t_wait_in3;
        elseif t_safety >= -(cond)
            t_wait_in3 = t_wait_in3 + t_safety + cond;
        end
    end
end

% caz2-veh care inca nu au intrat in sens si se iau in considerare
if(t_wait_in3 ~=0)
for z=1:length(V)
    veh_z = V(z);
    if ismember(veh_z, vehicule_in2)
        in = 2;
        % o = iesiri(2);
    elseif ismember(veh_z, vehicule_in3)
        in = 3;
        % o = iesiri(3);
    elseif ismember(veh_z, vehicule_in4)
        in = 4;
        % o = iesiri(4);
    elseif ismember(veh_z, vehicule_in1)  
        in = 1;
        % o = iesiri(1);
    end
    switch in
        case 1
            j = 1;
            if ismember(veh_z,V_in3)
                exp = t_in1_in3 + t_in1 + t_wait_in1;
                cond = exp - t_in3;
                conditie = cond - t_wait_in3
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in3 = t_wait_in3;
                elseif t_safety >= -conditie
                    t_wait_in3 = t_safety + conditie;
                end
            end
        case 2
            j = 2;
            if ismember(veh_z,V_in3)
                exp = t_in2_in3 + t_in2 + t_wait_in2;
                cond = exp - t_in3;
                conditie = cond - t_wait_in3
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in3 = t_wait_in3;
                elseif t_safety >= -conditie
                    t_wait_in3 = t_safety + conditie;
                end
            end
        case 3
            j = 3;
        case 4
            j = 4;
            if ismember(veh_z,V_in3)
                exp = t_in4_in3 + t_in4 + t_wait_in4;
                cond = exp - t_in3;
                conditie = cond - t_wait_in3
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in3 = t_wait_in3;
                elseif t_safety >= -conditie
                    t_wait_in3 = t_safety + conditie;
                end
            end

    end
end
end
t_wait_in3 = max(0,t_wait_in3);

