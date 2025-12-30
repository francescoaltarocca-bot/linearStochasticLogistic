% puliamo workspace e command window
clear all; clc;

% url dataset
% https://archive.ics.uci.edu/dataset/186/wine+quality

% seed per random generator
rng(1234)

% importiamo il dataset in csv a seconda di quale vogliamo utilizzare
filename = 'winequality-white_and_red_linReg.csv'; % dataset completo
%filename = 'winequality-white.csv'; % dataset vini bianchi
%filename = 'winequality-red.csv'; % dataset vini rossi
data = readtable(filename);
%data = repelem(data,10,1);

% raccogliamo le features nella matrice A, da cui eliminiamo l'ultima 
% colonna: quality
A_data = data{:, 1:end-1};

m = size(A_data,1); % features

% assegniamo le etichette: wine quality
Y_data = data{:,end};
% dividiamo per 10 la variabile target: questo riduce gli errori commessi
Y_data = Y_data./10;

% shuffle
ind_perm = randperm(m);
A_data = A_data(ind_perm,:);
Y_data = Y_data(ind_perm,:);

% centriamo i dati - rescaling per poter ignorare l'intercetta
A_data_mean = A_data - mean(A_data);
Y_data_mean = Y_data - mean(Y_data);

% split in training e test set
m_train = round(2*m/3); % prendiamo 2/3 del campione;
A_train = A_data_mean(1:m_train,:); 
y_train = Y_data_mean(1:m_train);

m_test = m - m_train;
A_test = A_data_mean(m_train+1:end,:);
y_test = Y_data_mean(m_train+1:end);

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Regressione lineare con gradiente stocastico
lambda = 1;
max_it = 30000; % max iterazioni
eps_opt = 1e-3; % opt out dal ciclo for

b = 325; % batch size

% inizializzazione del grafico
figure
line_obj_train = animatedline('Color', 'b');
start = tic;

% inizializziamo il punto di partenza con un vettore di zeri
w = zeros(size(A_train, 2), 1);

for it = 1:max_it

    % funzione obiettivo da minimizzare
    f = (norm(A_train * w - y_train)^2)/m_train + lambda * (w' * w);

    % indice di permutazione: è necessario per estrarre i dati in maniera
    % pseudo casuale dalla matrice delle features
    idx_mb = randperm(m_train, b);
    % gradiente
    g = 2*A_train(idx_mb,:)'*(A_train(idx_mb,:)*w-y_train(idx_mb,:))/b + 2*lambda*w;

    % norma del gradiente
    g_norm = norm(g);
    if (g_norm <= eps_opt)
        break;
    end

    % stampa dei risultati
    fprintf('%s%d%s%.4g%s%.4g\n','it = ', it, ',f =', f, ',||g||=', g_norm);
    alpha = 1e-4;

    % ci muoviamo lungo l'antigradiente con passo alfa
    w = w-alpha*g;

    % grafico
    D = duration(0,0, toc(start), 'Format', 'hh:mm:ss');
    addpoints(line_obj_train, it, f)
    title("Elapsed time: "+ string(D));
end

% Statistiche finali
fprintf('%s%.4f\n', 'mean squared error on training set = ', (norm(A_train*w-y_train)^2)/m_train);
fprintf('%s%.4f\n', 'mean squared error on test set = ', (norm(A_test*w-y_test)^2)/m_test);
