%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Codigo principal %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicio de secion:
start:-
 write("Bienvenido"),
 write('1. Iniciar sesion'), nl,
 write('2. Registrarse'), nl,
 write('Seleccione una opcion (1 o 2): '),
 read(Opcion),
 procesar_opcion(Opcion).

%Dependiendo de la opcion escogida se hara lo siguiente:
procesar_opcion(1) :-
 iniciar_sesion.
procesar_opcion(2) :-
 registrar.
procesar_opcion(_) :-
 write('Opción no válida. Por favor, seleccione 1 o 2.'), nl,
 start.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Requisitos para los cursos %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
registrar :- nl, 
 write('seguidos de un punto.'), nl, 
 nl,
 write('Ingresa tu codigo y la primera letra de tu nombre en minuscula y al final un punto: '), 
 read(Codigo), 
 nl,
 write('Ingrese los cursos aprobados separados por comas: '),
 read_line_to_string(user_input, AprobadosStr),
 split_string(AprobadosStr, ",", " ", Aprobados),
 assertz(usuario(Codigo, Aprobados)),
 write('Información agregada con éxito.').

 
iniciar_sesion:-
 mostrar_opciones_cursos
 
% Reglas para definir los requisitos de cursos.
requisito(matematicas2, matematicas).
requisito(historia2, historia).
requisito(programacion2, programacion).
requisito(fisica2, fisica).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Mostrar horarios %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Restricciones del horario.
%	1. grupos diferentes
%	2. La suma de creditos min:12 , max: 24

% Definición de cursos y sus créditos.

% curso(nombre, grupo, aula,prof, creditos,horario)

% Reglas para evitar grupos iguales y controlar la suma de créditos.
horario_valido(Horario) :-
    no_mismos_grupos(Horario),
    suma_creditos(Horario, Suma),
    Suma =< 24.

% Regla para verificar que no haya grupos iguales.
no_mismos_grupos(Horario) :-
    findall(Grupo, member(curso(_, Grupo, _, _, _, _), Horario), Grupos),
    length(Grupos, N),
    length(Grupos, NDistinct),
    N =:= NDistinct.

% Regla para calcular la suma de créditos de un horario.
suma_creditos([], 0).
suma_creditos([curso(_, _, _, _, Creditos, _)|Resto], Suma) :-
    suma_creditos(Resto, SumaResto),
    Suma is SumaResto + Creditos.

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%% Predicado para mostrar opciones del horario %%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Reglas para mostrar todas las opciones de cursos disponibles.
mostrar_opciones_cursos(Usuario) :-
    write('Cursos disponibles:'), nl,
    findall(Curso, (curso(Curso, _, _, _, _), cumple_requisitos(Usuario, Curso)), Cursos),
    listar_opciones(Cursos, 1).

listar_opciones([], _).
listar_opciones([Curso|Resto], Numero) :-
    write(Numero), write('. '), write(Curso), nl,
    NuevoNumero is Numero + 1,
    listar_opciones(Resto, NuevoNumero).

% Reglas para permitir al usuario elegir un curso.
elegir_curso(CursoElegido) :-
    mostrar_opciones_cursos,
    write('Elija el número del curso deseado: '),
    read(Numero),
    curso(CursoElegido, _, _, _, _),
    Numero >= 1, Numero =< CursoElegido.

cumple_requisitos(Usuario, Curso) :-
    not(requisito(Curso, _)), % Si no tiene requisitos, siempre cumple.
    usuario_aprobo_curso(Usuario, Curso).

cumple_requisitos(Usuario, Curso) :-
    requisito(Curso, Requisito),
    usuario_aprobo_curso(Usuario, Requisito).

% Reglas para verificar si un usuario aprobó un curso.
usuario_aprobo_curso(Usuario, Curso) :-
    usuario(Usuario, CursosAprobados),
    member(Curso, CursosAprobados).




