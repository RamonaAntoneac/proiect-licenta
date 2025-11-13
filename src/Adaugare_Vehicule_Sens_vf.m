% -------------- DEFINIRE -------------------
vehicule_in = {vehicule_in1, vehicule_in2, vehicule_in3, vehicule_in4};
t_stop_all = {t_stop_in1, t_stop_in2, t_stop_in3, t_stop_in4};
t_wait_all = {t_wait_in1, t_wait_in2, t_wait_in3, t_wait_in4};
t_in_vec   = [t_in1, t_in2, t_in3, t_in4];  
V_in_all   = {V_in1, V_in2, V_in3, V_in4};  


% t_stop_all = {t_stop_in1, t_stop_in2, t_stop_in3, t_stop_in4};
time_check_all = {time_check_in1, time_check_in2, time_check_in3, time_check_in4};
% ------------- ADĂUGARE ÎN V_sens -------------
for i = 1:n_intrari
    vehs = vehicule_in{i};               
    t_stop_vec = t_stop_all{i};          
    time_check_vec = time_check_all{i};  
    t_wt = t_wait_all{i};              
    t_in = t_in_vec(i);                  

    for j = 1:length(vehs)
        veh = vehs(j);
        t_stop = t_stop_vec(j);
        time_check = time_check_vec(j);

        if t_stop ~= 0 && scenario.SimulationTime >= (t_wt + t_in + t_stop)
            if ~ismember(veh, V_sens)
                V_sens = [V_sens, veh];
                fprintf("Vehiculul %s de la intrarea %d a intrat în sens la t = %.2f\n", ...
                        veh.Name, i, t_stop);
            end
        end
    end
end


% ----------------- ADĂUGARE ÎN V_sens_inX ------------------
for idx = 1:n_intrari
    vehs_trec = V_in_all{idx};  % vehicule care trec prin fața intrării idx
    for p = 1:length(vehs_trec)
        veh = vehs_trec(p);
        if ismember(veh, V_sens) && ~ismember(veh, V_sens_in{idx})
            V_sens_in{idx} = [V_sens_in{idx}, veh];
        end
    end
end

% --------------- SINCRONIZARE ÎNAPOI -------------------
V_sens_in1 = V_sens_in{1};
V_sens_in2 = V_sens_in{2};
V_sens_in3 = V_sens_in{3};
V_sens_in4 = V_sens_in{4};
