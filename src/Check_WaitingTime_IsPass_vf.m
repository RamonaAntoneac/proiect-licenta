%------------Verificare finalizare timp de asteptare----------

if (Flag_wait1_in1 == 2) 
    if t_wait <= 0
        t_wait = t_wait_in1; 
    end
    numeVehicul = strtrim(char(veh_stop_in1.Name));
    if isempty(Intrare1)
        Intrare1(1).Vehicul = numeVehicul;
        Intrare1(1).Timp_Asteptare = t_wait_in1;
    else
        exista = any(strcmp(strtrim({Intrare1.Vehicul}), numeVehicul));
        if ~exista
            n = length(Intrare1) + 1;
            Intrare1(n).Vehicul = numeVehicul;
            Intrare1(n).Timp_Asteptare = t_wait_in1;
        end
    end
    if t_wait >0
       t_wait = t_wait - scenario.SampleTime;
    end
    if scenario.SimulationTime >= (timp_st_in1 + t_wait_in1)
       Flag_wait1_in1 = 0;
       t_wait_in1 = 0;
       timp_st_in1 = 0;
       t_wait = 0;
    end
end

if (Flag_wait1_in2 == 2) 
    if t_wait1 <=0
    t_wait1 = t_wait_in2;
    end

    numeVehicul = strtrim(char(veh_stop_in2.Name));
    if isempty(Intrare2)
        Intrare2(1).Vehicul = numeVehicul;
        Intrare2(1).Timp_Asteptare = t_wait_in2;
    else
        exista = any(strcmp(strtrim({Intrare2.Vehicul}), numeVehicul));
        if ~exista
            n1 = length(Intrare2) + 1;
            Intrare2(n1).Vehicul = numeVehicul;
            Intrare2(n1).Timp_Asteptare = t_wait_in2;
        end
    end
    if t_wait1 >0
        t_wait1 = t_wait1 - scenario.SampleTime;
    end
    if scenario.SimulationTime >= (timp_st_in2 + t_wait_in2)
       Flag_wait1_in2 = 0;
       t_wait_in2 = 0;
       timp_st_in2 = 0;
       t_wait1 = 0;
    end
end

if (Flag_wait1_in3 == 2) 
    if t_wait2 <=0
        t_wait2 = t_wait_in3;
    end
    numeVehicul = strtrim(char(veh_stop_in3.Name));
    if isempty(Intrare3)
        Intrare3(1).Vehicul = numeVehicul;
        Intrare3(1).Timp_Asteptare = t_wait_in3;
    else
        exista = any(strcmp(strtrim({Intrare3.Vehicul}), numeVehicul));
        if ~exista
            n2 = length(Intrare3) + 1;
            Intrare3(n2).Vehicul = numeVehicul;
            Intrare3(n2).Timp_Asteptare = t_wait_in3;
        end
    end
    if t_wait2>0
        t_wait2 = t_wait2 - scenario.SampleTime;
    end
    if scenario.SimulationTime >= (timp_st_in3 + t_wait_in3)
       Flag_wait1_in3 = 0;
       t_wait_in3 = 0;
       timp_st_in3 = 0;
       t_wait2 = 0;
    end
end

if (Flag_wait1_in4 == 2) 
    if t_wait3 <=0
        t_wait3 = t_wait_in4;
    end
    numeVehicul = strtrim(char(veh_stop_in4.Name));
    if isempty(Intrare4)
        Intrare4(1).Vehicul = numeVehicul;
        Intrare4(1).Timp_Asteptare = t_wait_in4;
    else
        exista = any(strcmp(strtrim({Intrare4.Vehicul}), numeVehicul));
        if ~exista
            n3 = length(Intrare4) + 1;
            Intrare4(n3).Vehicul = numeVehicul;
            Intrare4(n3).Timp_Asteptare = t_wait_in4;
        end
    end
    if t_wait3>0
        t_wait3 = t_wait3 - scenario.SampleTime;
    end
    if scenario.SimulationTime >= (timp_st_in4 + t_wait_in4)
       Flag_wait1_in4 = 0;
       t_wait_in4 = 0;
       timp_st_in4 = 0;
       t_wait3=0;
    end
end
