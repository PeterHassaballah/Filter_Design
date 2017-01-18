% Low pass filter

%Pulizia
clc
clear all


% Butterworth = 1
% Chebichev = 0
tipo = 1; 

A_stop_band = 30; % i valori devono essere inseriti in decibel 

A_band_pass = 1;   % i valori devono essere inseriti in decibel 

w_stop_band = 20000; % valore di frequenza non normalizzato

w_band_pass = 10000; % valore di frequenza non normalizzato

fprintf('------------------------REALIZZATORE DI FILTRI--------------------------\n');

%   Normalizzazione

Omega_band_pass = 1;

Omega_stop_band = w_stop_band/w_band_pass;

%   Normalizzazione

if tipo == 1

    fprintf('tipo scelto: Butterworth\n');

    % pass band attenuation index

    eps_bp = (10^(A_band_pass/10)-1)^(1/2);

    % stop band attenuation index

    eps_sb = (10^(A_stop_band/10)-1)^(1/2);

elseif tipo == 0 
    fprintf('tipo scelto: Chebishev\n');
end
    
% 

k = Omega_band_pass/Omega_stop_band; 

%

k_eps = eps_bp/eps_sb;

% filter order

filter_order = log(k_eps)/log(k);
        
filter_order = ceil(filter_order); % approssimazione all'intero successivo 

% selezione della frequenza di taglio 

Omega_0_MAX = Omega_stop_band/(eps_sb^(1/filter_order));

Omega_0_min = Omega_band_pass/(eps_bp^(1/filter_order));

fprintf('The frequency must match the required attenuation index. \nPlease choose one pole frequency between %d and %d\n',Omega_0_min,Omega_0_MAX);
Omega_0=input('Insert the chosen Omega_O: ');



