%-----------------Initializare parametrii

time = 0;
%timp de verificare pentru pozitii 
time_check_in1 = zeros(1, length(vehicule_in1));  %[car1_0,car1_1,car1_2,car1_3]
time_check_in2 = zeros(1, length(vehicule_in2));
time_check_in3 = zeros(1, length(vehicule_in3));
time_check_in4 = zeros(1, length(vehicule_in4));


pozitii_sens_in3 = {};
pozitii_sens_in2 = {};
pozitii_sens_in1 = {};
pozitii_sens_in4 = {};

%flag de trecere de la o etapa la alta 
Flag_wait1_in1 = 0;
Flag_wait1_in2 = 0;
Flag_wait1_in3 = 0;
Flag_wait1_in4 = 0;


%Pozitiile in care vehiculele se opresc si asteapta timpul de asteptare
X_1_IN = 4;
Y_1_IN = -18;
ind_stop_in1= [35,  21, 24, 29, 10]; 

X_2_IN = 18.3;
Y_2_IN = 2; 
ind_stop_in2 = [131, 15, 13, 13, 17]; 

X_3_IN = -1;
Y_3_IN = 16; 
ind_stop_in3 = [73, 19, 20, 13, 15]; 

X_4_IN = -16.5;
Y_4_IN = -3;
ind_stop_in4 = [54, 14, 10, 12, 13]; 


%coordonatele punctelor de intrare in sens
Y_in4 = -3.48;
X_in4= -7.5;
Y_in1 = -9.6;
X_in1 = 3.6;
Y_in2 = 1.81;
X_in2 = 10.63;
Y_in3 = 8.2;
X_in3 = -0.5;

%Vectorii corespunzatori timpului de asteptare cu care vom restabili traiectoria 

WaitTime_1 = {zeros(length(traiectorii_in1{1}),1),zeros(length(traiectorii_in1{2}),1),zeros(length(traiectorii_in1{3}),1),zeros(length(traiectorii_in1{4}),1),zeros(length(traiectorii_in1{5}),1)}; 
WaitTime_2 = {zeros(length(traiectorii_in2{1}),1),zeros(length(traiectorii_in2{2}),1),zeros(length(traiectorii_in2{3}),1),zeros(length(traiectorii_in2{4}),1),zeros(length(traiectorii_in2{5}),1)}; 
WaitTime_3 = {zeros(length(traiectorii_in3{1}),1),zeros(length(traiectorii_in3{2}),1),zeros(length(traiectorii_in3{3}),1),zeros(length(traiectorii_in3{4}),1),zeros(length(traiectorii_in3{5}),1)}; 
WaitTime_4 = {zeros(length(traiectorii_in4{1}),1),zeros(length(traiectorii_in4{2}),1),zeros(length(traiectorii_in4{3}),1),zeros(length(traiectorii_in4{4}),1),zeros(length(traiectorii_in4{5}),1)};

%viteza
v = speed(1);

%vectorul de intrari; fiecare elem repr fiecare intrare a sensului
in_1 = 0;
in_2 = 0;
in_3 = 0;
in_4 = 0;
IN = []; 

%vectori pentru iesiri, vor contine fiecare masinile coresp
out_1 = []; 
out_2 = [];
out_3 = [];
out_4 = [];
%vector de celule
OUT = cell(1,4); 


%timpul cand veh ajung in punctul de stop
t_stop_in1 = zeros(1, length(vehicule_in1));  %timpul cand veh ego ajunge in punctul de stop
t_stop_in2 = zeros(1, length(vehicule_in2)); %timpul cand veh1 ajunge in punctul de stop 
t_stop_in3 = zeros(1, length(vehicule_in3));
t_stop_in4 = zeros(1, length(vehicule_in4));


%timpul de asteptare care va fi calculat 
t_wait_in1 = 0; %timpul de asteptare pentru ego
t_wait_in2 = 0; %timpul de asteptare pentru veh1
t_wait_in3 = 0;
t_wait_in4 = 0;


%distanta de la fiecare intrare la fiecare iesire
d_in1_out1 = 0;    
d_in1_out2 = 0;
d_in1_out3 = 0;
d_in1_out4 = 0;
d_in2_out1 = 0;
d_in2_out2 = 0;
d_in2_out3 = 0;
d_in2_out4 = 0;
d_in3_out1 = 0;
d_in3_out2 = 0;
d_in3_out3 = 0;
d_in3_out4 = 0;
d_in4_out1 = 0;
d_in4_out2 = 0;
d_in4_out3 = 0;
d_in4_out4 = 0;


%distanta de la punctul de stop la intrarea in sens
d_in1 = 8.7;
d_in2 = 8;
d_in3 = 8;
d_in4 = 8;

%timpul de la punct de stop la intrarea in sens pentru fiecare intrare
t_in4 = d_in4/v; 
t_in1 = d_in1/v;
t_in2 = d_in2/v;
t_in3 = d_in3/v;

%vectorul cu masinile pentru care se calculeaza twait
V = []; 

%distanta arcului de cerc de la o intrare la alta
d_in1_in2 = dist(X_in1,Y_in1,X_in2, Y_in2);
d_in1_in3 = dist(X_in1,Y_in1,X_in3, Y_in3);
d_in1_in4 = dist(X_in1,Y_in1,X_in4, Y_in4);
d_in2_in3 = dist(X_in2,Y_in2,X_in3, Y_in3);
d_in2_in4 = dist(X_in2,Y_in2,X_in4, Y_in4);
d_in2_in1 = dist(X_in2,Y_in2,X_in1, Y_in1);
d_in3_in4 = dist(X_in3,Y_in3,X_in4, Y_in4);
d_in3_in1 = dist(X_in3,Y_in3,X_in1, Y_in1);
d_in3_in2 = dist(X_in3,Y_in3,X_in2, Y_in2);
d_in4_in1 = dist(X_in4,Y_in4,X_in1, Y_in1);
d_in4_in2 = dist(X_in4,Y_in4,X_in2, Y_in2);
d_in4_in3 = dist(X_in4,Y_in4,X_in3, Y_in3);

%timp de parcurgere de la o intrare la alta
t_in1_in2 = d_in1_in2/v;
t_in1_in3 = d_in1_in3/v;
t_in1_in4 = d_in1_in4/v;
t_in2_in3 = d_in2_in3/v;
t_in2_in4 = d_in2_in4/v;
t_in2_in1 = d_in2_in1/v;
t_in3_in4 = d_in3_in4/v;
t_in3_in1 = d_in3_in1/v;
t_in3_in2 = d_in3_in2/v;
t_in4_in1 = d_in4_in1/v;
t_in4_in2 = d_in4_in2/v;
t_in4_in3 = d_in4_in3/v;

%vectorii masinilior care trec prin fata fiecarei intrari
V_in1 = [];
V_in2 = [];
V_in3 = [];
V_in4 = [];

l = 5; %latime

V_sens = []; %vectorul masinilor deja in sens  z-masina din sens z<Vsens

d_z_in = 0; %distanta de la pozitia veh deja in sens pana la intrarea i
t_z_in = d_z_in/v; %timpul de parcurgere al veh deja in sens pana la intrarea i

V_sens_in1 = []; %vectorul maisnilor care sunt deja in sens si vor trece prin fata intrarii i
V_sens_in2 = [];
V_sens_in3 = [];
V_sens_in4 = [];

t_safety = 2*l/v; %timp de siguranta 


n_intrari = 4;
V_sens_in = cell(1, n_intrari);

%structuri pentru stocarea timpurilor de asteptare pentru fiecare vehicul
n=0;
n1=0;
n2=0;
n3=0;
Intrare1 = struct('Vehicul', {}, 'Timp_Asteptare', {});
Intrare2 = struct('Vehicul', {}, 'Timp_Asteptare', {});
Intrare3 = struct('Vehicul', {}, 'Timp_Asteptare', {});
Intrare4 = struct('Vehicul', {}, 'Timp_Asteptare', {});

% Vectori de coada pentru fiecare intrare
coada_in1 = vehicule_in1;
coada_in2 = vehicule_in2;
coada_in3 = vehicule_in3;
coada_in4 = vehicule_in4; 

% puncte de stop pe banda
p1_stop_in1 = [4,-27.46];
p2_stop_in1 = [4,-35.2];

p1_stop_in2 = [27,2];
p2_stop_in2 = [37.1,2];

p1_stop_in3 = [-1, 26.3];
p2_stop_in3 = [-1, 36.3];

p1_stop_in4 = [-26,-3];
p2_stop_in4 = [-35.5,-3];

% variabile pentru evidenta scurgerii timpului de asteptare
t_wait = 0;
t_wait1 = 0;
t_wait2= 0;
t_wait3 = 0;