
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
sintomas(fatiga).
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
:- dynamic enfermedad/1.
enfermedad(gripe).
enfermedad(asma).
enfermedad(varicela).

%---------------------------------------------------------------
%-----------------Relaciones de sintomas y enfermedades---------.
%
%
sintomas_de(tos,asma).
sintomas_de(ahogo,asma).
sintomas_de(fatiga,asma).
sintomas_de(tos, gripe).
sintomas_de(fiebre,gripe).
sintomas_de(mocos,gripe).
sintomas_de(fiebre,varicela).
sintomas_de(dolor,varicela).
sintomas_de(comezon,varicela).

%

%--------------------------------------------------------------
%-----------------Relaciones de causas y enfermedades----------

causas_de(ejercicio,asma).
causas_de(infeccion,asma).
causas_de(contaminantes,asma).
causas_de(virus,gripe).
causas_de(contagio,gripe).
causas_de(bajasDefensas,gripe).
causas_de(virus,varicela).
causas_de(infeccion,varicela).
causas_de(contagio, varicela).



%--------------------------------------------------------------
%-----------------Relaciones de prevencion y enfermedades------

prevencion_de(vacunas,asma).
prevencion_de(vitaminas,asma).
prevencion_de(consultaMedica,asma).
prevencion_de(vitaminas,gripe).
prevencion_de(higiene,gripe).
prevencion_de(abrigo,gripe).
prevencion_de(vitaminas , varicela).
prevencion_de(vacuna,varicela).
prevencion_de(evitarContacto).


%--------------------------------------------------------------
%-----------------Relaciones de tratamiento y enfermedades-----

tratamiento_de(antiinflamatorio,asma).
tratamiento_de(broncodilatadores,asma).
tratamiento_de(antihistaminicos,asma).
tratamiento_de(paracetamol,gripe).
tratamiento_de(analgesico,gripe).
tratamiento_de(hidratacion,gripe).
tratamiento_de(aspirina,varicela).
tratamiento_de(acetaminofen,varicela).
tratamiento_de(calamina,varicela).


%--------------------------------------------------------------

