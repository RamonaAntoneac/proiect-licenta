%--------Mentinere distanta intre vehiculele de pe aceeasi intrare----

%toleranta
T = 0.5;

%-------------IN1------------------------------

if norm(coada_in1(2).Position(1,1:2) - p1_stop_in1) <= T
    if ismember(coada_in1(1),V)
        disp("Vehiculul " + coada_in1(2).Name + " trebuie sa astepte in p1 " + t_wait);
    end
end

%  1_1 in punstul de stop si 1_2 trebuie sa astepte
if norm(coada_in1(3).Position(1,1:2) - p1_stop_in1) <= T
    if ismember(coada_in1(2),V)
        disp("Vehiculul " + coada_in1(3).Name + " trebuie sa astepte in p1 " + t_wait);
    end
elseif norm(coada_in1(3).Position(1,1:2) - p2_stop_in1) <= T
    if norm(coada_in1(2).Position(1,1:2) - p1_stop_in1) <= T && ismember(coada_in1(1),V)
        disp("Vehiculul " + coada_in1(3).Name + " trebuie sa astepte in p2 " + t_wait);
    end
end

if norm(coada_in1(4).Position(1,1:2) - p1_stop_in1) <= T
    if ismember(coada_in1(3),V)
        disp("Vehiculul " + coada_in1(4).Name + " trebuie sa astepte in p1 " + t_wait);
    end
elseif norm(coada_in1(4).Position(1,1:2) - p2_stop_in1) <= T
    if norm(coada_in1(3).Position(1,1:2) - p1_stop_in1) <= T && ismember(coada_in1(2),V)
        disp("Vehiculul " + coada_in1(4).Name + " trebuie sa astepte in p2 " + t_wait);
    end
end

if norm(coada_in1(5).Position(1,1:2) - p1_stop_in1) <= T
    if ismember(coada_in1(4),V)
        disp("Vehiculul " + coada_in1(4).Name + " trebuie sa astepte in p1 " + t_wait);
    end
elseif norm(coada_in1(5).Position(1,1:2) - p2_stop_in1) <= T
    if norm(coada_in1(4).Position(1,1:2) - p1_stop_in1) <= T && ismember(coada_in1(3),V)
        disp("Vehiculul " + coada_in1(5).Name + " trebuie sa astepte in p2 " + t_wait);
    end
end

%---------------IN2-----------------------------

if norm(coada_in2(2).Position(1,1:2) - p1_stop_in2) <= T
    if ismember(coada_in2(1),V)
        disp("Vehiculul " + coada_in2(2).Name + " trebuie sa astepte in p1 " + t_wait1);
    end
end

if norm(coada_in2(3).Position(1,1:2) - p1_stop_in2) <= T
    if ismember(coada_in2(2),V)
        disp("Vehiculul " + coada_in2(3).Name + " trebuie sa astepte in p1 " + t_wait1);
    end
elseif norm(coada_in2(3).Position(1,1:2) - p2_stop_in2) <= T
    if norm(coada_in2(2).Position(1,1:2) - p1_stop_in2) <= T && ismember(coada_in2(1),V)
        disp("Vehiculul " + coada_in2(3).Name + " trebuie sa astepte in p2 " + t_wait1);
    end
end

if norm(coada_in2(4).Position(1,1:2) - p1_stop_in2) <= T
    if ismember(coada_in2(3),V)
        disp("Vehiculul " + coada_in2(4).Name + " trebuie sa astepte in p1 " + t_wait1);
    end
elseif norm(coada_in2(4).Position(1,1:2) - p2_stop_in2) <= T
    if norm(coada_in2(3).Position(1,1:2) - p1_stop_in2) <= T && ismember(coada_in2(2),V)
        disp("Vehiculul " + coada_in2(4).Name + " trebuie sa astepte in p2 " + t_wait1);
    end
end


if norm(coada_in2(5).Position(1,1:2) - p1_stop_in2) <= T
    if ismember(coada_in2(4),V)
        disp("Vehiculul " + coada_in2(5).Name + " trebuie sa astepte in p1 " + t_wait1);
    end
elseif norm(coada_in2(5).Position(1,1:2) - p2_stop_in2) <= T
    if norm(coada_in2(4).Position(1,1:2) - p1_stop_in2) <= T && ismember(coada_in2(3),V)
        disp("Vehiculul " + coada_in2(5).Name + " trebuie sa astepte in p2 " + t_wait1);
    end
end

%-------------IN3---------------------

if norm(coada_in3(2).Position(1,1:2) - p1_stop_in3) <= T
    if ismember(coada_in3(1),V)
        disp("Vehiculul " + coada_in3(2).Name + " trebuie sa astepte in p1 " + t_wait2);
    end
end


if norm(coada_in3(3).Position(1,1:2) - p1_stop_in3) <= T
    if ismember(coada_in3(2),V)
        disp("Vehiculul " + coada_in3(3).Name + " trebuie sa astepte in p1 " + t_wait2);
    end
elseif norm(coada_in3(3).Position(1,1:2) - p2_stop_in3) <= T
    if norm(coada_in3(2).Position(1,1:2) - p1_stop_in3) <= T && ismember(coada_in3(1),V)
        disp("Vehiculul " + coada_in3(3).Name + " trebuie sa astepte in p2 " + t_wait2);
    end
end

if norm(coada_in3(4).Position(1,1:2) - p1_stop_in3) <= T
    if ismember(coada_in3(3),V)
        disp("Vehiculul " + coada_in3(4).Name + " trebuie sa astepte in p1 " + t_wait2);
    end
elseif norm(coada_in3(4).Position(1,1:2) - p2_stop_in3) <= T
    if norm(coada_in3(3).Position(1,1:2) - p1_stop_in3) <= T && ismember(coada_in3(2),V)
        disp("Vehiculul " + coada_in3(4).Name + " trebuie sa astepte in p2 " + t_wait2);
    end
end

if norm(coada_in3(5).Position(1,1:2) - p1_stop_in3) <= T
    if ismember(coada_in3(4),V)
        disp("Vehiculul " + coada_in3(4).Name + " trebuie sa astepte in p1 " + t_wait2);
    end
elseif norm(coada_in3(5).Position(1,1:2) - p2_stop_in3) <= T
    if norm(coada_in3(4).Position(1,1:2) - p1_stop_in3) <= T && ismember(coada_in3(3),V)
        disp("Vehiculul " + coada_in3(5).Name + " trebuie sa astepte in p2 " + t_wait2);
    end
end

%---------------IN4----------------------
if norm(coada_in4(2).Position(1,1:2) - p1_stop_in4) <= T
    if ismember(coada_in4(1),V)
        disp("Vehiculul " + coada_in4(2).Name + " trebuie sa astepte in p1 " + t_wait3);
    end
end

%  1_1 in punstul de stop si 1_2 trebuie sa astepte
if norm(coada_in4(3).Position(1,1:2) - p1_stop_in4) <= T
    if ismember(coada_in4(2),V)
        disp("Vehiculul " + coada_in4(3).Name + " trebuie sa astepte in p1 " + t_wait3);
    end
elseif norm(coada_in4(3).Position(1,1:2) - p2_stop_in4) <= T
    if norm(coada_in4(2).Position(1,1:2) - p1_stop_in4) <= T && ismember(coada_in4(1),V)
        disp("Vehiculul " + coada_in4(3).Name + " trebuie sa astepte in p2 " + t_wait3);
    end
end

if norm(coada_in4(4).Position(1,1:2) - p1_stop_in4) <= T
    if ismember(coada_in4(3),V)
        disp("Vehiculul " + coada_in4(4).Name + " trebuie sa astepte in p1 " + t_wait3);
    end
elseif norm(coada_in4(4).Position(1,1:2) - p2_stop_in4) <= T
    if norm(coada_in4(3).Position(1,1:2) - p1_stop_in4) <= T && ismember(coada_in4(2),V)
        disp("Vehiculul " + coada_in4(4).Name + " trebuie sa astepte in p2 " + t_wait3);
    end
end

if norm(coada_in4(5).Position(1,1:2) - p1_stop_in4) <= T
    if ismember(coada_in4(4),V)
        disp("Vehiculul " + coada_in4(5).Name + " trebuie sa astepte in p1 " + t_wait3);
    end
elseif norm(coada_in4(5).Position(1,1:2) - p2_stop_in4) <= T
    if norm(coada_in4(4).Position(1,1:2) - p1_stop_in4) <= T && ismember(coada_in4(3),V)
        disp("Vehiculul " + coada_in4(5).Name + " trebuie sa astepte in p2 " + t_wait3);
    end
end
