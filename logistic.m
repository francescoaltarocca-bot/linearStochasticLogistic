% puliamo workspace e command window
clear all; clc

% url dataset
% https://archive.ics.uci.edu/dataset/186/wine+quality

% seed per random generator
rng(1234)

% importiamo il dataset in csv
filename = 'winequality-white_and_red.csv';
data = readtable(filename);

% raccogliamo le features nella matrice A, da cui eliminiamo le ultime due
% colonne: quality e wine type
A_data = data{:, 1:end-2};

m = size(A_data, 1); % # samples
n = size(A_data, 2); % # features

% assegniamo le etichette (type: 1 bianco, -1 rosso)
Y_data = data{:,end};

% shuffle dei dati
ind_perm = randperm(m);
A_data = A_data(ind_perm,:);
Y_data = Y_data(ind_perm,:);

% salviamo i dati originali, non permutati, per poterli confrontare con 
% la prediction alla fine
Y_or = Y_data; 

% centriamo i dati - rescaling per ignorare l'intercetta
A_data = A_data - mean(A_data);
Y_data = Y_data - mean(Y_data);

% slit data in train e test
m_train = round(2*m/3);
A_train = A_data(1:m_train,:);
y_train = Y_data(1:m_train);
y_train_or = Y_or(1:m_train); % shuffle delle y originali non centrate

m_test = m-m_train;
A_test = A_data(m_train+1:end,:);
y_test = Y_data(m_train+1:end);
y_test_or = Y_or(m_train+1:end); % shuffle delle y originali non centrate
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
% Logistic regression

% griglie di valori per alfa e lambda
alpha = [0.0001, 0.001, 0.01];
lambda = [0.1, 0.5, 1];

max_it = 10000; % max iterazioni
eps_opt = 1e-3; % opt out dal ciclo for

start = tic;

% inizializziamo il punto di partenza con un vettore di zeri
wb =  zeros(n+1, 1); 

% definiamo un range di colori per i grafici
colors = ['b','g','k','r','m','y','c',"#D95319"];

% primo ciclo for: fissiamo lambda e variamo su alfa
for ll = 1:length(lambda)
    
    % inizializzazione delle figure
    figure
    ylim([0 inf])
    xlim([0 max_it])
    xlabel("iterazioni");
    ylabel("f.obiettivo");
    grid on

    % secondo ciclo for: variamo alfa
    for aa = 1:length(alpha)

        % inizializziamo le righe per i grafici con colori variabili
        line_obj_train = animatedline('Color', colors(aa), 'LineWidth', 1.5);

        % fulcro del modello
        for it = 1:max_it

            % calcoliamo u per facilitare il calcolo della fz obiettivo
            u = 1 + exp(-y_train.*(A_train*wb(1:end-1)+wb(end)));
            % funzione obiettivo f
            f = (sum(log(u))/m_train+lambda(ll)*norm(wb(1:end-1))^2);

            c = y_train.*(1./u-1);

            % gradiente
            g = [A_train ones(m_train,1)]'*c/m_train+2*lambda(ll)*[wb(1:n); 0];

            % norma del gradiente
            g_norm =norm(g);

            % condizione di uscita
            if (g_norm <= eps_opt)
                break;
            end

            % ci muoviamo lungo l'antigradiente con passo alfa_i
            wb = wb - alpha(aa)*g;

            % grafico
            D = duration(0,0,toc(start),'Format','hh:mm:ss');
            addpoints(line_obj_train, it, f)
            title("Comparison lambda: " + string(lambda(ll)));

        end

        % normalizziamo gli assi delle figure
        axis tight

        % Definiamo il testo della legenda del grafico
        legend_entries{aa} = ['\alpha = ' num2str(alpha(aa))];

        % risultati: calcoliamo le probabilià p su tutto il vettore
        p = 1./(1+exp(-(A_data*wb(1:end-1)+wb(end))));
        y_pred(p>=0.5,1)=1;
        y_pred(p<0.5,1)=-1;
        fprintf('%s%d%s%d%s%d\n','alpha = ', alpha(aa), ' lambda = ', lambda(ll), ' iterazioni = ', it)
        fprintf('%s%.2f%s\n', 'accuracy on training set = ', 100*sum(y_pred(1:m_train)==y_train_or)/m_train, '%');
        fprintf('%s%.2f%s\n', 'accuracy on test set = ', 100*sum(y_pred(m_train+1:end)==y_test_or)/m_test, '%');

    end
        % Legenda per il grafico
        legend(legend_entries);
end