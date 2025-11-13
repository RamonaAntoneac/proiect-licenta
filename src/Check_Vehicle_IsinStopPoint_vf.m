TOL = 0.5;  % Toleranță pentru zona de stop

% === INTRAREA 1 ===
if any(abs(time_check_in1 - 0.1) <= scenario.SampleTime * 0.1)
    stop_pt1 = [X_1_IN, Y_1_IN];
    for j = 1:length(vehicule_in1)
        veh = vehicule_in1(j);
        pos = veh.Position;
        
        if t_stop_in1(j) == 0 && norm(pos(1,1:2) - stop_pt1) <= TOL
            V = [V, veh];
            t_stop_in1(j) = scenario.SimulationTime;
            timp_st_in1 = t_stop_in1(j);
            stop_in1 = ind_stop_in1(j);
            veh_Pos_old_in1 = pos;
            traj_in1 = traiectorii_in1{j};
            veh_stop_in1 = veh;
            WaitTime_in1 = WaitTime_1{j};

            for k = 1:length(V_sens)
                veh_sens = V_sens(k);
                poz_sens = veh_sens.Position;
                pozitii_sens_in1{end+1, 1} = veh_sens;
                pozitii_sens_in1{end,   2} = poz_sens;
            end
            Flag_wait1_in1 = 1;
            break;
        end
        % time_check_in1(j) = 0;
    end
    Adaugare_Vehicule_Sens_vf;
    time_check_in1(j) = 0;
end

% === INTRAREA 2 ===
if any(abs(time_check_in2 - 0.1) <= scenario.SampleTime * 0.1)
    stop_pt2 = [X_2_IN, Y_2_IN];
    for j = 1:length(vehicule_in2)
        veh = vehicule_in2(j);
        pos = veh.Position;

        if t_stop_in2(j) == 0 && norm(pos(1,1:2) - stop_pt2) <= TOL
            V = [V, veh];
            t_stop_in2(j) = scenario.SimulationTime;
            timp_st_in2 = t_stop_in2(j);
            stop_in2 = ind_stop_in2(j);
            veh_Pos_old_in2 = pos;
            traj_in2 = traiectorii_in2{j};
            veh_stop_in2 = veh;
            WaitTime_in2 = WaitTime_2{j};

            for k = 1:length(V_sens)
                veh_sens = V_sens(k);
                poz_sens = veh_sens.Position;
                pozitii_sens_in2{end+1, 1} = veh_sens;
                pozitii_sens_in2{end,   2} = poz_sens;
            end
            Flag_wait1_in2 = 1;
            break;
        end
        % time_check_in2(j) = 0;
    end
    Adaugare_Vehicule_Sens_vf;
    time_check_in2(j) = 0;
end

% === INTRAREA 3 ===
if any(abs(time_check_in3 - 0.1) <= scenario.SampleTime * 0.1)
    stop_pt3 = [X_3_IN, Y_3_IN];
    for j = 1:length(vehicule_in3)
        veh = vehicule_in3(j);
        pos = veh.Position;

        if t_stop_in3(j) == 0 && norm(pos(1,1:2) - stop_pt3) <= TOL
            V = [V, veh];
            t_stop_in3(j) = scenario.SimulationTime;
            timp_st_in3 = t_stop_in3(j);
            stop_in3 = ind_stop_in3(j);
            veh_Pos_old_in3 = pos;
            % time_check_in3(j) = 0;
            traj_in3 = traiectorii_in3{j};
            veh_stop_in3 = veh;
            WaitTime_in3 = WaitTime_3{j};
           
            for k = 1:length(V_sens)
                veh_sens = V_sens(k);
                poz_sens = veh_sens.Position;
                pozitii_sens_in3{end+1, 1} = veh_sens;
                pozitii_sens_in3{end,   2} = poz_sens;
            end
            Flag_wait1_in3 = 1;
            break;
        end
        % time_check_in3(j) = 0;
    end
    % time_check_in3 = zeros(1, length(vehicule_in3));
    Adaugare_Vehicule_Sens_vf;
    time_check_in3(j) = 0;
end

% === INTRAREA 4 ===
if any(abs(time_check_in4 - 0.1) <= scenario.SampleTime * 0.1)
    stop_pt4 = [X_4_IN, Y_4_IN];
    for j = 1:length(vehicule_in4)
        veh = vehicule_in4(j);
        pos = veh.Position;

        if t_stop_in4(j) == 0 && norm(pos(1,1:2) - stop_pt4) <= TOL
            V = [V, veh];
            t_stop_in4(j) = scenario.SimulationTime;
            timp_st_in4 = t_stop_in4(j);
            stop_in4 = ind_stop_in4(j);
            veh_Pos_old_in4 = pos;
            traj_in4 = traiectorii_in4{j};
            veh_stop_in4 = veh;
            WaitTime_in4 = WaitTime_4{j};
            
            for k = 1:length(V_sens)
                veh_sens = V_sens(k);
                poz_sens = veh_sens.Position;
                pozitii_sens_in4{end+1, 1} = veh_sens;
                pozitii_sens_in4{end,   2} = poz_sens;
            end
            Flag_wait1_in4 = 1;
            break;
        end
        % time_check_in4(j) = 0;
    end
    Adaugare_Vehicule_Sens_vf;
    time_check_in4(j) = 0;
end
