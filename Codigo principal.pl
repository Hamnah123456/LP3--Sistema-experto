%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Codigo principal %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Inicio de seción:
start:-
 write("Bienvenido"),
 write('1. Iniciar sesión'), nl,
 write('2. Registrarse'), nl,
 write('Seleccione una opción (1 o 2): '),
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% Mostrar horarios %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Restricciones del horario.
%	1. grupos diferentes
%	2. La suma de creditos min:12 , max: 24
no_superposicion(X, Y) :- 
 curso(X, Grupo, _, _, _, _), curso(Y, Grupo, _, _, _, _), X \= Y.

contar_creditos:-
 curso(_,_,_,_, N,_)





