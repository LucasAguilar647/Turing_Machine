-- ====================================
-- MAIN - TP MÁQUINA DE TURING 
-- Ejecutar esto desde psql conectado a la base "postgres"
--psql -U postgres -d postgres -h localhost -p 8080 -f main.sql

-- ====================================

-- Eliminar base si existe
DROP DATABASE IF EXISTS tp_maquina_turing;

-- Crear base nueva
CREATE DATABASE tp_maquina_turing;

-- Conectarse a la nueva base
\c tp_maquina_turing

-- Crear tablas y funciones
\i Crear_Tablas.sql
\i Funciones.sql

--Deberia ir un menu de opciones para saber cual ejecutar

\i Programa_Palindromo.sql
SELECT simuladorMT('1001');
SELECT * FROM get_descripciones();


-- ================================
-- FIN
-- ================================
