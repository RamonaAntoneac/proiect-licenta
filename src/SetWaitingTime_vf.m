%--------------CALCULARE TIMP DE ASTEPTARE ----------

%calculare timp de asteptare pentru veh de pe IN3
if Flag_wait1_in3 == 1 && t_wait_in3 == 0 
   Calcul_in3
   traj_in3=[veh_Pos_old_in3(1:end);traj_in3(stop_in3+1:end,:)];          
   WaitTime_in3=[t_wait_in3;WaitTime_in3(stop_in3+1:end)];
   speed_in3 = 5*ones(length(traj_in3),1); 
   trajectory(veh_stop_in3,traj_in3,speed_in3,WaitTime_in3);

   Flag_wait1_in3 = 2;

end

%calculare timp de asteptare pentru veh de pe IN4
if Flag_wait1_in4 == 1 && t_wait_in4 == 0
    Calcul_in4
    %determinare noua traiectorie cu timpul de asteptare
    traj_in4=[veh_Pos_old_in4(1:end);traj_in4(stop_in4+1:end,:)];      
    WaitTime_in4=[t_wait_in4;WaitTime_in4(stop_in4+1:end)];
    speed_in4 = 5*ones(length(traj_in4),1)       
    speed_in4(WaitTime_in4 > 0) = 0;
    trajectory(veh_stop_in4,traj_in4,speed_in4,WaitTime_in4);

   Flag_wait1_in4 = 2;  
   
end

%calculare timp de asteptare pentru veh de pe IN1
if Flag_wait1_in1 == 1 && t_wait_in1 == 0
    Calcul_in1
    %determinare noua traiectorie cu timpul de asteptare
    traj_in1=[veh_Pos_old_in1(1:end);traj_in1(stop_in1+1:end,:)];  
    WaitTime_in1=[t_wait_in1;WaitTime_in1(stop_in1+1:end)];
    speed_in1 = 5*ones(length(traj_in1),1); 
    speed_in1(WaitTime_in1 > 0) = 0; 
    trajectory(veh_stop_in1,traj_in1,speed_in1,WaitTime_in1);

   Flag_wait1_in1 = 2;  
   
end

%calculare timp de asteptare pentru veh de pe IN2
if Flag_wait1_in2 == 1 && t_wait_in2 == 0
    Calcul_in2
    %determinare noua traiectorie cu timpul de asteptare
    traj_in2=[veh_Pos_old_in2(1:end);traj_in2(stop_in2+1:end,:)];  
    WaitTime_in2=[t_wait_in2;WaitTime_in2(stop_in2+1:end)];
    speed_in2 = 5*ones(length(traj_in2),1); 
    speed_in2(WaitTime_in2 > 0) = 0;
    trajectory(veh_stop_in2,traj_in2,speed_in2,WaitTime_in2);

   Flag_wait1_in2 = 2; 
   
end