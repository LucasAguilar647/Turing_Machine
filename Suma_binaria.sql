-- =====================================
-- Programa de Suma Binaria para Máquina de Turing en PostgreSQL
-- Precondición: los sumandos están alineados en la cinta tras ejecutar copia de multiplicación
-- Resultado: se escribe en un nuevo bloque a la derecha
-- =====================================

-- Etapa 1: Moverse al final del segundo sumando (derecha total)
INSERT INTO programa VALUES ('q_sum_start', '0', 'q_sum_start', '0', 'R');
INSERT INTO programa VALUES ('q_sum_start', '1', 'q_sum_start', '1', 'R');
INSERT INTO programa VALUES ('q_sum_start', '#', 'q_sum_start', '#', 'R');
INSERT INTO programa VALUES ('q_sum_start', 'Y', 'q_sum_start', 'Y', 'R');
INSERT INTO programa VALUES ('q_sum_start', 'X', 'q_sum_start', 'X', 'R');
INSERT INTO programa VALUES ('q_sum_start', 'B', 'q_sum_back', 'B', 'L');

-- Etapa 2: Iniciar suma sin acarreo
-- q_sum_back vuelve un paso y empieza la suma
INSERT INTO programa VALUES ('q_sum_back', '0', 'q_sum_0', '0', 'L');
INSERT INTO programa VALUES ('q_sum_back', '1', 'q_sum_0', '1', 'L');

-- Etapa 3: Suma bit a bit sin acarreo (simplificado solo para bits 0 o 1)
-- Suma: 0 + 0 = 0
INSERT INTO programa VALUES ('q_sum_0', '0', 'q_sum_write0', '0', 'L');
-- Suma: 1 + 0 = 1 o 0 + 1 = 1
INSERT INTO programa VALUES ('q_sum_0', '1', 'q_sum_write1', '1', 'L');
-- Suma: 1 + 1 = 0 con acarreo
INSERT INTO programa VALUES ('q_sum_0', '1', 'q_sum_1', '1', 'L');

-- Etapa 4: Suma con acarreo (q_sum_1)
-- 1 + 0 + 1 = 0 con acarreo
INSERT INTO programa VALUES ('q_sum_1', '1', 'q_sum_1', '1', 'L');
-- 1 + 1 + 1 = 1 con acarreo
INSERT INTO programa VALUES ('q_sum_1', '0', 'q_sum_1', '0', 'L');
-- 0 + 0 + 1 = 1 sin acarreo
INSERT INTO programa VALUES ('q_sum_1', 'B', 'q_sum_write1', 'B', 'S');

-- Etapa 5: Escribir resultados (ficticio, debería usar posición de escritura real)
INSERT INTO programa VALUES ('q_sum_write0', '0', 'q_sum_write0', '0', 'R');
INSERT INTO programa VALUES ('q_sum_write0', 'B', 'q_sum_continue', '0', 'L');
INSERT INTO programa VALUES ('q_sum_write1', '0', 'q_sum_write1', '0', 'R');
INSERT INTO programa VALUES ('q_sum_write1', 'B', 'q_sum_continue', '1', 'L');

-- Etapa final: continuar o aceptar
INSERT INTO programa VALUES ('q_sum_continue', '0', 'q_sum_0', '0', 'L');
INSERT INTO programa VALUES ('q_sum_continue', '1', 'q_sum_0', '1', 'L');
INSERT INTO programa VALUES ('q_sum_continue', 'B', 'q_accept', 'B', 'S');