% Low pass filter

% Butterworth = 1
% Chebichev = 0
tipo = 1; 

A_stop_band = 30; % i valori devono essere inseriti in decibel 

A_band_pass = 1;   % i valori devono essere inseriti in decibel 

w_stop_band = 20000; % valore di frequenza non normalizzato

w_band_pass = 10000; % valore di frequenza non normalizzato

sprintf(' Please choose one pole fr') 

%   Normalizzazione

Omega_band_pass = 1;

Omega_stop_band = w_stop_band/w_band_pass;

%   Normalizzazione

if(tipo == 1)    

    sprintf(' Please choose one pole fr') 

    % pass band attenuation index

    eps_bp = (10^(A_band_pass/10)-1)^(1/2);

    % stop band attenuation index

    eps_sb = (10^(A_stop_band/10)-1)^(1/2);
    
elseif (tipo == 0 )
    
% 

k = Omega_band_pass/Omega_stop_band; 

%

k_eps = eps_bp/eps_sb;

% filter order

filter_order = ln(k_eps)/ln(k);
        
filter_order = ceil(filter_order) % approssimazione all'intero successivo 

% selezione della frequenza di taglio 

Omega_0_MAX = Omega_stop_band/(eps_sb^(1/filter_order)) 

Omega_0_min = Omega_band_pass/(eps_bp^(1/filter_order))

sprintf(' Please choose one pole frequency between %d and %d',Omega_0_min,Omega_0_MAX)
Omega_0=input(' : ');




end
