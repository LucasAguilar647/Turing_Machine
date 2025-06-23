-- ====================================
-- MAIN - TP MÁQUINA DE TURING
-- Ejecutar esto desde psql conectado a la base "postgres":
-- psql -U postgres -d postgres -h localhost -p 8080 -f main.sql
-- ====================================


DROP DATABASE IF EXISTS tp_maquina_turing;


CREATE DATABASE tp_maquina_turing;


\c tp_maquina_turing


\i Crear_Tablas.sql
\i Funciones.sql





-- \i Programa_Palindromo.sql
-- SELECT simuladorMT('1001001');

-- \i Multiplicar_binarios.sql
-- SELECT simuladorMT('101#11');
-- SELECT * FROM get_resultado_final();  

-- \i Programa_ParesDuplicados.sql
-- SELECT simuladorMT('aabbcczzkkaabbcczz');

-- \i Programa_invertir_string.sql
-- SELECT simuladorMT('cbacbacba');

     





SELECT * FROM get_descripciones();


\i Ver_Movimientos.sql
