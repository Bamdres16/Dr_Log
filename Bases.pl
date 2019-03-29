
%enfermedades: gripe, asma, varicela.
%Asma:  -sintomas: tos, ahogo,dolorPecho.
%       -causas: ejercicio,infeccion,contaminantes.
%       -prevencion:vacunas, vitaminas,consultaMedica.
%       -tratamiento:antiinflamatorio,broncodilatadores,
%       antihistaminicos.
%
%Gripe: -sintomas:tos, fiebre, mocos.
%       -causas: virus,contagio, bajasDefensas.
%       -prevencion: abrigo, vitaminas, higiene.
%       -tratamiento: paracetamol,analgesico, hidratacion.
%
%Varicela: -sintomas:comezon,fiebre, dolor.
%          -causas:virus, infeccion, contagio.
%          -prevencion: vacuna.
%          -tratamiento:aspirina, acetaminofen, calamina.
%

%Tabla 1. Sintomas.
sintomas(tos).
sintomas(ahogo).
sintomas(dolorPecho).
sintomas(fiebre).
sintomas(mocos).
sintomas(comezon).
sintomas(dolor).

%Tablas 2. Causas
causas(ejercicio).
causas(infeccion).
causas(contaminantes).
causas(virus).
causas(contagio).
causas(bajasDefensas).

%Tabla 3.prevencion
prevencion(vacuna).
prevencion(vitaminas).
prevencion(consultaMedica).
prevencion(abrigo).
prevencion(higiene).

%Tabla 4. Tratamiento
tratamiento(antiinflamatorio).
tratamiento(broncodilatadores).
tratamiento(antihistaminicos).
tratamiento(paracetamol).
tratamiento(analgesico).
tratamiento(limon).
tratamiento(hidratacion).
tratamiento(aspirina).
tratamiento(acetaminofen).
tratamiento(calamina).


%Tabla 5. Enfermedad
enfermedad(gripe).
enfermedad(asma).
enfermedad(varicela).


%---------------------------------------------------------------
%-----------------Relaciones de sintomas y enfermedades---------.
%
%
sintomas_de(tos, ahogo,dolorPecho,asma).
sintomas_de(tos, fiebre, mocos, gripe).
sintomas_de(comezon, fiebre, dolor, varicela).

sintomas_De(tos,asma).
sintomas_De(ahogo, asma).
sintomas_De(dolorPecho, asma).

sintomas_De(tos, gripe).
sintomas_De(fiebre, gripe).
sintomas_De(mocos, gripe).

sintomas_De(comezon, varicela).
sintomas_De(fiebre, varicela).
sintomas_De(dolor, varicela).

%
sintomas_General(W,X,Y,Z):- sintomas_de(W,X,Y,Z).
sintomas_General(W,X,Y,Z):- sintomas_de(X,Y,W,Z).
sintomas_General(W,X,Y,Z):- sintomas_de(X,W,Y,Z).
sintomas_General(W,X,Y,Z):- sintomas_de(Y,X,W,Z).
sintomas_General(W,X,Y,Z):- sintomas_de(Y,W,X,Z).
sintomas_General(W,X,Y,Z):- sintomas_de(W,Y,X,Z).
%--------------------------------------------------------------
%-----------------Relaciones de causas y enfermedades----------

causas_de(ejercicio, infeccion, contaminantes,asma).
causas_de(virus, contagio, bajasDefensas,gripe).
causas_de(virus, infeccion, contagio, varicela).

causas_General(W,X,Y,Z):- causas_de(W,X,Y,Z).
causas_General(W,X,Y,Z):- causas_de(X,Y,W,Z).
causas_General(W,X,Y,Z):- causas_de(X,W,Y,Z).
causas_General(W,X,Y,Z):- causas_de(Y,X,W,Z).
causas_General(W,X,Y,Z):- causas_de(Y,W,X,Z).
causas_General(W,X,Y,Z):- causas_de(W,Y,X,Z).

%--------------------------------------------------------------
%-----------------Relaciones de prevencion y enfermedades------

prevencion_de(vacunas, vitaminas,consultaMedica,asma).
prevencion_de(abrigo, vitaminas, higiene,gripe).
prevencion_de(vacuna,evitarContacto ,vitaminas , varicela).

prevencion_General(W,X,Y,Z):- prevencion_de(W,X,Y,Z).
prevencion_General(W,X,Y,Z):- prevencion_de(X,Y,W,Z).
prevencion_General(W,X,Y,Z):- prevencion_de(X,W,Y,Z).
prevencion_General(W,X,Y,Z):- prevencion_de(Y,X,W,Z).
prevencion_General(W,X,Y,Z):- prevencion_de(Y,W,X,Z).
prevencion_General(W,X,Y,Z):- prevencion_de(W,Y,X,Z).

%--------------------------------------------------------------
%-----------------Relaciones de tratamiento y enfermedades-----

tratamiento_de(antiinflamatorio,broncodilatadores,antihistaminicos, asma).
tratamiento_de(paracetamol,analgesico, hidratacion, gripe).
tratamiento_de(aspirina, acetaminofen, calamina,varicela).

tratamiento_General(W,X,Y,Z):- tratamiento_de(W,X,Y,Z).
tratamiento_General(W,X,Y,Z):- tratamiento_de(X,Y,W,Z).
tratamiento_General(W,X,Y,Z):- tratamiento_de(X,W,Y,Z).
tratamiento_General(W,X,Y,Z):- tratamiento_de(Y,X,W,Z).
tratamiento_General(W,X,Y,Z):- tratamiento_de(Y,W,X,Z).
tratamiento_General(W,X,Y,Z):- tratamiento_de(W,Y,X,Z).

%--------------------------------------------------------------

