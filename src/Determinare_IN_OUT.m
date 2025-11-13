%------DETERMINARE INTRARI SI IESIRI-----
% --- Limite ---
limits_in = [1.5 6.4 -42 -34;   % in1
             32  42  -1   5;    % in2
             -3.5 1  32  41.5;  % in3
             -40 -33 -5.5 -1];  % in4

limits_out = [-3.5 1 -42 -30;   % out1 
               30 42 -5.5 0;    % out2
               1  7  30  42;    % out3
              -42 -30 -3  5];   % out4

% --- Vehicule și traiectorii grupate pe intrări ---
vehicule_in = {
    vehicule_in1,     % in1
    vehicule_in2,     % in2
    vehicule_in3,     % in3
    vehicule_in4      % in4
};

traiectorii_in = {
    waypoints_in1,  % in1
    waypoints_in2,  % in2
    waypoints_in3,  % in3
    waypoints_in4   % in4
};

% --- Inițializări ---
intrari = [];
iesiri = [];
vehicule_all = [];

% --- Detectare IN/OUT pentru fiecare vehicul ---
for entry_id = 1:4
    vehs = vehicule_in{entry_id};
    trajs = traiectorii_in{entry_id};
    
    for j = 1:length(vehs)
        traiectorie = trajs{j};
        [in_id, out_id] = detectare_in_out(traiectorie, limits_in, limits_out);
        
        intrari = [intrari, in_id];
        iesiri = [iesiri, out_id];
        vehicule_all = [vehicule_all, vehs(j)];
    
         if ~isnan(in_id) && ~isnan(out_id)
            fprintf('%s: IN = in%d, OUT = out%d\n', vehs(j).Name, in_id, out_id);
        elseif ~isnan(in_id)
            fprintf('%s: IN = in%d, OUT = nedetectat\n', vehs(j).Name, in_id);
        elseif ~isnan(out_id)
            fprintf('%s: IN = nedetectat, OUT = out%d\n', vehs(j).Name, out_id);
        else
            fprintf('%s: IN = nedetectat, OUT = nedetectat\n', vehs(j).Name);
        end

    end
end

% --- Grupare după intrare ---
IN = cell(1, 4); % IN{1} va conține vehiculele de la in1, etc.
for i = 1:length(intrari)
    in_id = intrari(i);
    if ~isnan(in_id)
        IN{in_id} = [IN{in_id}, vehicule_all(i)];
    end
end

% --- Grupare după ieșire ---
OUT = cell(1, 4);
for i = 1:length(iesiri)
    out_id = iesiri(i);
    if ~isnan(out_id)
        OUT{out_id} = [OUT{out_id}, vehicule_all(i)];
    end
end

% --- Vehicule care traversează prin fața fiecărei intrări ---
V_in = cell(1, 4);
for i = 1:length(intrari)
    entry = intrari(i);
    exit_ = iesiri(i);
    
    if isnan(entry) || isnan(exit_)
        continue;
    end
    
    traversate = [];
    if entry ~= exit_
        idx = mod((entry+1:entry+3) - 1, 4) + 1;
        j = 1;
        while j <= length(idx) && idx(j) ~= exit_
            traversate = [traversate, idx(j)];
            j = j + 1;
        end
    else
        traversate = mod((entry+1:entry+3) - 1, 4) + 1;
    end
    
    for j = traversate
        V_in{j} = [V_in{j}, vehicule_all(i)];
    end
end
V_in1 = V_in{1};
V_in2 = V_in{2};
V_in3 = V_in{3};
V_in4 = V_in{4};

IN1 = IN{1,1};
IN2 = IN{1,2};
IN3 = IN{1,3};
IN4 = IN{1,4};

OUT1 = OUT{1,1};
OUT2 = OUT{1,2};
OUT3 = OUT{1,3};
OUT4 = OUT{1,4};

% ------- FUNCȚII -------

function [entryID, exitID] = detectare_in_out(traiectorie, limits_in, limits_out)   
    start_pt = traiectorie(1, 1:2);       
    end_pt   = traiectorie(end, 1:2);     

    entryID = det_id(start_pt, limits_in);
    exitID  = det_id(end_pt, limits_out);
end

function id = det_id(pt, limits)
    id = NaN; % implicit

    for i = 1:size(limits, 1)
        xmin = limits(i, 1);
        xmax = limits(i, 2);
        ymin = limits(i, 3);
        ymax = limits(i, 4);

        if pt(1) >= xmin && pt(1) <= xmax && pt(2) >= ymin && pt(2) <= ymax
            id = i;
            return;
        end
    end
end
