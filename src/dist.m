function arc_length = dist(a1, a2, b1, b2)
    % a1, a2: coordonate punct 1
    % b1, b2: coordonate punct 2

    R = 18.3 / 2; % raza cercului
    C = [1.61, -0.53];  % centrul cercului

    % Punctele originale
    P1 = [a1, a2];
    P2= [b1, b2];

    % Vectori către puncte
    v1 = P1 - C;
    v2 = P2 - C;

    % Unghiuri absolute
    u1 = atan2(v1(2), v1(1));
    u2 = atan2(v2(2), v2(1));

    % Unghi în sens invers acelor de ceasornic
    theta = u2 - u1;
    if theta < 0
        theta = theta + 2*pi;
    end

    % Lungime arc
    arc_length = R * theta;
end

function P_proj = proiecteaza_pe_cerc(P, C, R)
    % Proiectează punctul P pe cercul de centru C și rază R
    v = P - C;
    if norm(v) == 0
        error('Punctul coincide cu centrul cercului.');
    end
    v_unit = v / norm(v);
    P_proj = C + R * v_unit;
end
