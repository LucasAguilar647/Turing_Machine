-- ============================================
-- SUMA BINARIA CON MÁQUINA DE TURING (VERSIÓN FINAL FUNCIONAL CON CARRY AL BORDE)
-- Entrada: binario1#binario2 (ej: 1#1, 1000#1)
-- Salida: suma binaria correcta (ej: 10, 1001)
-- ============================================

-- Alfabeto
DELETE FROM alfabeto;
INSERT INTO alfabeto (simbolo) VALUES
  ('0'), ('1'), ('#'), ('B'),
  ('Y');  -- Marcador para bit derecho ya procesado

-- Programa (transiciones)
DELETE FROM programa;

-- q0: Ir al final de la cinta
INSERT INTO programa VALUES ('q0', '0', 'q0', '0', 'R');
INSERT INTO programa VALUES ('q0', '1', 'q0', '1', 'R');
INSERT INTO programa VALUES ('q0', '#', 'q0', '#', 'R');
INSERT INTO programa VALUES ('q0', 'B', 'q1', 'B', 'L');

-- q1: Leer bit del segundo número (a la derecha del #)
INSERT INTO programa VALUES ('q1', '0', 'q2_0', 'Y', 'L');
INSERT INTO programa VALUES ('q1', '1', 'q2_1', 'Y', 'L');
INSERT INTO programa VALUES ('q1', '#', 'q8', '#', 'L');

-- q2_0: leímos 0
INSERT INTO programa VALUES ('q2_0', '0', 'q3_00', '0', 'L');
INSERT INTO programa VALUES ('q2_0', '1', 'q3_01', '1', 'L');
INSERT INTO programa VALUES ('q2_0', '#', 'q3_0E', '#', 'L');

-- q2_1: leímos 1
INSERT INTO programa VALUES ('q2_1', '0', 'q3_10', '1', 'L');
INSERT INTO programa VALUES ('q2_1', '1', 'q3_11', '0', 'L');
INSERT INTO programa VALUES ('q2_1', '#', 'q3_1E', '#', 'L');

-- q3_00, q3_01, q3_10: escribir resultado directamente y avanzar
INSERT INTO programa VALUES ('q3_00', '0', 'q4', '0', 'R');
INSERT INTO programa VALUES ('q3_01', '0', 'q4', '0', 'R');
INSERT INTO programa VALUES ('q3_10', '0', 'q4', '0', 'R');

-- q3_11: suma 1+1=0, iniciar carry
INSERT INTO programa VALUES ('q3_11', '0', 'q5', '0', 'L');
INSERT INTO programa VALUES ('q3_11', '1', 'q5', '0', 'L');
INSERT INTO programa VALUES ('q3_11', 'B', 'q7', 'B', 'L');  

-- Casos extremos al principio
INSERT INTO programa VALUES ('q3_0E', '0', 'q4', '0', 'R');
INSERT INTO programa VALUES ('q3_1E', '0', 'q3_10', '1', 'L');
INSERT INTO programa VALUES ('q3_1E', '1', 'q3_11', '0', 'L');
INSERT INTO programa VALUES ('q3_1E', '#', 'q7', '#', 'L'); 

-- q5: resolver carry
INSERT INTO programa VALUES ('q5', '0', 'q6', '1', 'L');
INSERT INTO programa VALUES ('q5', '1', 'q5', '0', 'L');
INSERT INTO programa VALUES ('q5', '#', 'q7', '#', 'L');

-- q6: volver al ciclo normal
INSERT INTO programa VALUES ('q6', '0', 'q0', '0', 'R');
INSERT INTO programa VALUES ('q6', '1', 'q0', '1', 'R');

-- q7: si llegamos a borde, agregar 1
INSERT INTO programa VALUES ('q7', 'B', 'q8', '1', 'S');

-- q4: volver al inicio para seguir sumando
INSERT INTO programa VALUES ('q4', '0', 'q4', '0', 'R');
INSERT INTO programa VALUES ('q4', '1', 'q4', '1', 'R');
INSERT INTO programa VALUES ('q4', '#', 'q4', '#', 'R');
INSERT INTO programa VALUES ('q4', 'Y', 'q4', 'Y', 'R');
INSERT INTO programa VALUES ('q4', 'B', 'q1', 'B', 'L');

-- q8: HALT
INSERT INTO programa VALUES ('q8', 'B', 'qhalt', 'B', 'S');
INSERT INTO programa VALUES ('qhalt', 'B', 'qhalt', 'B', 'S');
