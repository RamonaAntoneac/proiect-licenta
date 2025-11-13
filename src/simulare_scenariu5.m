% Run Simulation - varianta 1
close all
clear all
%extragere date
[scenario, vehicule_in1, vehicule_in2, vehicule_in3, vehicule_in4, waypoints_in1, waypoints_in2, waypoints_in3, waypoints_in4,speed] = scenariu5();

%Traiectoriile pentru fiecare intrare
traiectorii_in1 = waypoints_in1;
traiectorii_in2 = waypoints_in2;
traiectorii_in3 = waypoints_in3;
traiectorii_in4 = waypoints_in4;
 
plot(scenario)

%Pentru ca toate veh sa parcurga complet traiectoria
scenario.StopTime = 70;

%initializare parametrii
Init_params_5

%determinare intrari si iesiri pentru fiecare vehicul
Determinare_IN_OUT

 while advance(scenario)
     pause(0.001); 

     Check_Vehicle_IsinStopPoint_vf
     SetWaitingTime_vf
     Adaugare_Vehicule_Sens_vf
     Check_WaitingTime_IsPass_vf
     Eliberare_vect
     distanta_veh_5

    time = time + scenario.SampleTime; 
    time_check_in1 = time_check_in1 + scenario.SampleTime;
    time_check_in2 = time_check_in2 + scenario.SampleTime;
    time_check_in3 = time_check_in3 + scenario.SampleTime;
    time_check_in4 = time_check_in4 + scenario.SampleTime;

end

 