
% Extrage timpii de așteptare din fiecare structură
t1_ast = [Intrare1.Timp_Asteptare];
t2_ast = [Intrare2.Timp_Asteptare];
t3_ast = [Intrare3.Timp_Asteptare];
t4_ast = [Intrare4.Timp_Asteptare];

t_asteptare = [t1_ast, t2_ast, t3_ast, t4_ast];
titluri = {'Intrare 1', 'Intrare 2', 'Intrare 3', 'Intrare 4'};


t_avg = mean(t_asteptare);
t_min = min(t_asteptare);
t_max = max(t_asteptare);

figure;
for i = 1:4
    t = t_asteptare(i);
    subplot(2,2,i);
    
    % Calculează timpii caracteristici pentru intrarea curentă
    t_avg = mean(t);
    t_min = min(t);
    t_max = max(t);
    

    plot(1:length(t), t, 'o-', 'LineWidth', 1.5); hold on;
    

    yline(t_avg, '--r', ['Medie: ' num2str(t_avg, '%.2f') ' s']);
    yline(t_min, '--g', ['Min: ' num2str(t_min, '%.2f') ' s']);
    yline(t_max, '--b', ['Max: ' num2str(t_max, '%.2f') ' s']);
    
    xlabel('Vehicul');
    ylabel('Timp de așteptare [s]');
    title(titluri{i});
    grid on;
end

sgtitle('Analiza timpilor de așteptare pentru fiecare intrare')


figure;
histogram(t_asteptare, 'BinWidth', 1);  
xlabel('Timp de așteptare [s]');
ylabel('Număr de vehicule');
title('Distribuția timpilor de așteptare');

intrari = 4;
t_pe_intrare = cell(1, intrari);
t_pe_intrare = {t1_ast, t2_ast, t3_ast, t4_ast};
medii_intrari = zeros(1, intrari);
for i = 1:intrari
    medii_intrari(i) = mean(t_pe_intrare{i});
end

figure;
bar(1:intrari, medii_intrari);
xlabel('Intrare');
ylabel('Timp mediu de așteptare [s]');
title('Echitate între intrări (timp mediu)');

t_min = min(t_asteptare);
t_max = max(t_asteptare);





