% inainte de calcul sa se scoata veh care parasesc sensul
if ~isempty(V_sens)
    Eliberare_vect
end

%verificare intersectie libera
if isempty(V_sens) && isempty(V)
    t_wait_in4 = 0;
end

for z = 1:length(V_sens_in4)
    veh_z = V_sens_in4(z);
    pos_veh_z = veh_z.Position;
    d_z_in4 = dist(pos_veh_z(1),pos_veh_z(2),X_in4,Y_in4);
    t_z_in4 = d_z_in4/v;
    cond = t_z_in4 - t_in4;
    if(t_wait_in4 == 0)
        if abs(cond)>=t_safety
            t_wait_in4 = 0;
        else
            t_wait_in4 = t_safety + cond;
            t_wait_in4 = max(0,t_wait_in4);
        end
    else
        if cond >= t_safety || t_safety <= -(cond)
            t_wait_in4 = t_wait_in4;
        elseif t_safety >= -(cond)
            t_wait_in4 = t_wait_in4 + t_safety + cond;
        end
    end
end


% caz2-veh care inca nu au intrat in sens si se iau in considerare

for z=1:length(V)
    veh_z = V(z);
    if ismember(veh_z, vehicule_in2)
        in = 2;
    elseif ismember(veh_z, vehicule_in3)
        in = 3;
    elseif ismember(veh_z, vehicule_in4)
        in = 4;
    elseif ismember(veh_z, vehicule_in1)  
        in = 1;
    end
    switch in
        case 1
            j = 1;
            if ismember(veh_z,V_in4)
                exp = t_in1_in4 + t_in1 + t_wait_in1;
                cond = exp - t_in4;
                conditie = cond - t_wait_in4
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in4 = t_wait_in4;
                elseif t_safety >= -conditie
                    t_wait_in4 = t_safety + conditie;
                end
            end
        case 2
            j = 2;
            if ismember(veh_z,V_in4)
                exp = t_in1_in2 + t_in1 + t_wait_in2;
                cond = exp - t_in4;
                conditie = cond - t_wait_in4
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in4 = t_wait_in4;
                elseif t_safety >= -conditie
                    t_wait_in4 = t_safety + conditie;
                end
            end
        case 3
            j = 3;
            if ismember(veh_z,V_in4)
                exp = t_in3_in2 + t_in3 + t_wait_in3;
                cond = exp - t_in4;
                conditie = cond - t_wait_in4
                if conditie >= t_safety || t_safety <= -conditie
                    t_wait_in4 = t_wait_in4;
                elseif t_safety >= -conditie
                    t_wait_in4 = t_safety + conditie;
                end
            end
        case 4
            j = 4;
    end
end

t_wait_in4 = max(0,t_wait_in4);