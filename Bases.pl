
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

causas_de("realizar actividad fisica",asma).
causas_de("alguna infeccion",asma).
causas_de("contaminantes",asma).
causas_de("un virus",gripe).
causas_de("contagio de otra persona",gripe).
causas_de("bajas denfesas",gripe).
causas_de("transmitirse cuando una persona con varicela tose",varicela).
causas_de("la infección de la varicela es causada por un virus",varicela).
causas_de("contagio de otra persona", varicela).



%--------------------------------------------------------------
%-----------------Relaciones de prevencion y enfermedades------

prevencion_de("quite las alfombras y aspire regularmente",asma).
prevencion_de("use sólo detergentes y materiales de limpieza sin fragancia en el hogar",asma).
prevencion_de("mantenga los niveles de humedad bajos y arregle los escapes",asma).
prevencion_de("guarde reposo en su hogar cuando este enfermo",gripe).
prevencion_de("lavarse las manos",gripe).
prevencion_de("evitar el contacto cercano",gripe).
prevencion_de("se vacune contra esta enfermedad" , varicela).
prevencion_de("evite el contacto directo con las lesiones de la piel de una persona enferma",varicela).
prevencion_de("desinfecte los utensilios que han estado en contacto con el enfermo",varicela).


%--------------------------------------------------------------
%-----------------Relaciones de tratamiento y enfermedades-----

tratamiento_de("antiinflamatorios, los mas utilizados son los corticoides (beclometasona, budesonida, fluticasona)",asma).
tratamiento_de("broncodilatadores, se utilizan agonistas beta 2 (salbutamol, terbutalina, salmeterol y formeterol)",asma).
tratamiento_de("antihistamínicos, no controlan el asma pero si son útiles para disminuir los síntomas alérgicos",asma).
tratamiento_de("analgesicos habituales (paracetamol o ibuprofeno)",gripe).
tratamiento_de("tratamientos para la gripe antivirales",gripe).
tratamiento_de("beber liquidos en abundancia",gripe).
tratamiento_de("antibioticos",varicela).
tratamiento_de("antihistaminico para aliviar la picazón",varicela).
tratamiento_de("calamina para reducir el ardor",varicela).


%--------------------------------------------------------------

