% Cursos y sus prerrequisitos

% 1ciclo
prerrequisito(introduccion_a_la_ciencia_de_datos, []).
prerrequisito(actividades_culturales_y_deportivas, []).
prerrequisito(analisis_matematico_i, []).
prerrequisito(quimica_general, []).
prerrequisito(ecologia_general, []).
prerrequisito(administracion_general, []).

% 2ciclo
prerrequisito(fisica_general, []).
prerrequisito(peru_en_el_contexto_internacional, []).
prerrequisito(analisis_matematico_ii, analisis_matematico_i).
prerrequisito(economia_general, []).
prerrequisito(tecnicas_de_exploracion_de_datos,[]).
prerrequisito(lenguaje_y_comunicacion,[]).
prerrequisito(herramientas_de_gestion_empresarial, []).
prerrequisito(administracion_general, analisis_matematico_i).

% 3ciclo

prerrequisito(lenguaje_de_programacion_i, introduccion_a_la_ciencia_de_datos).
prerrequisito(ingenieria_de_procesos, introduccion_a_la_ciencia_de_datos).
prerrequisito(algebra_matricial, analisis_matematico_ii).
prerrequisito(matematicas_discretas, analisis_matematico_ii).
prerrequisito(estadistica_general, analisis_matematico_ii).
prerrequisito(redaccion_y_argumentacion, []).

% 4ciclo

prerrequisito(lenguaje_de_programacion_ii, lenguaje_de_programacion_i).
prerrequisito(sistemas_de_gestion_de_bases_de_datos_i, [lenguaje_de_programacion_i,ingenieria_de_procesos]).
prerrequisito(metodos_de_optimizacion, algebra_matricial).
prerrequisito(analisis_estadistico, estadistica_general).
prerrequisito(metodologia_de_la_investigacion, estadistica_general).
prerrequisito(etica_y_ciudadania, []).

% 5ciclo


prerrequisito(lenguaje_de_programacion_iii, lenguaje_de_programacion_ii).
prerrequisito(analisis_de_regresion, [algebra_matricial,estadistica_general]).
prerrequisito(calculo_de_probabilidades, analisis_estadistico).
prerrequisito(estrategias_de_muestreo, estadistica_general).
prerrequisito(disenos_experimentales_i,analisis_estadistico).

% 6ciclo

prerrequisito(sistemas_de_gestion_de_base_de_datos_ii, [sistemas_de_gestion_de_base_de_datos_i, lenguaje_de_programacion_iii]).
prerrequisito(algoritmia, algebra_matricial).
prerrequisito(inferencia_estadistica, calculo_de_probabilidades).
prerrequisito(tecnicas_multivariadas, analisis_de_regresion).
prerrequisito(disenos_experimentales_ii, disenos_experimentales_i).

% 7ciclo

prerrequisito(sistemas_de_informacion_gerencial, sistemas_de_gestion_de_base_de_datos_ii).
prerrequisito(estadistica_computacional,algoritmia).
prerrequisito(modelos_lineales_i,inferencia_estadistica).
prerrequisito(estadistica_bayesiana,inferencia_estadistica).
prerrequisito(marketing,herramientas_de_gestion_empresarial).

% 8ciclo

prerrequisito(gestion_estrategica_de_datos, sistemas_de_informacion_gerencial).
prerrequisito(modelos_lineales_ii, modelos_lineales_i).
prerrequisito(maquinas_de_aprendizaje, tecnicas_multivariadas).
prerrequisito(estadistica_no_parametrica, []).
prerrequisito(seminario_en_estadistica_informatica_i, 140).
prerrequisito(investigacion_de_mercados, [tecnicas_multivariadas, marketing]).

% 9ciclos

prerrequisito(ciencias_de_datos_i, gestion_estrategica_de_datos).
prerrequisito(gestion_de_proyectos_de_informacion, []).
prerrequisito(analisis_de_series_de_tiempo, []).
prerrequisito(estadistica_espacial, []).
prerrequisito(seminario_en_estadistica_informatica_ii, seminario_en_estadistica_informatica_i).
prerrequisito(practicas_pre_profesionales, 140).
prerrequisito(electivo, []).

% 10ciclo

prerrequisito(ciencias_de_datos_ii, ciencias_de_datos_i).
prerrequisito(tecnologias_emergentes, maquinas_de_aprendizaje).
prerrequisito(seminario_en_estadistica_informatica_iii,seminario_en_estadistica_informatica_ii).
prerrequisito(electivos, []).







% Consulta para obtener los cursos y sus prerrequisitos
cursos_y_prerrequisitos(Curso, Prerrequisitos) :-
    prerrequisito(Curso, Prerrequisitos).

% Consulta para verificar si un curso tiene prerrequisitos
tiene_prerrequisitos(Curso) :-
    prerrequisito(Curso, Prerrequisitos),
    Prerrequisitos \= [].

% Consulta para obtener todos los cursos que tienen prerrequisitos
cursos_con_prerrequisitos(Cursos) :-
    findall(Curso, (prerrequisito(Curso, Prerrequisitos), Prerrequisitos \= []), Cursos).

% Consulta para obtener los cursos sin prerrequisitos
cursos_sin_prerrequisitos(Cursos) :-
    findall(Curso, (prerrequisito(Curso, [])), Cursos).




