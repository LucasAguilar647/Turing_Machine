-- =====================================
-- Máquina de Turing: Multiplicación binaria (simplificada)
-- Multiplica dos números binarios separados por '#'
-- Resultado: concatenación del multiplicando por cada '1' en el multiplicador
-- Ejemplo: 101#11 => 101101 (equivalente a 5 * 3 = 15 en binario sin suma)
-- =====================================


DELETE FROM alfabeto;
INSERT INTO alfabeto (simbolo) VALUES
    ('0'), ('1'), ('#'), ('+'), ('B'), ('X'), ('Y');


DELETE FROM programa;


INSERT INTO programa VALUES ('q0', '0', 'q0', '0', 'R');
INSERT INTO programa VALUES ('q0', '1', 'q0', '1', 'R');
INSERT INTO programa VALUES ('q0', '#', 'q1', '#', 'R');


INSERT INTO programa VALUES ('q1', '0', 'q1', '0', 'R');
INSERT INTO programa VALUES ('q1', '1', 'q1', '1', 'R');
INSERT INTO programa VALUES ('q1', 'B', 'q2', 'B', 'L');


INSERT INTO programa VALUES ('q2', '1', 'q3', 'Y', 'L');  
INSERT INTO programa VALUES ('q2', '0', 'q4', 'X', 'L');  
INSERT INTO programa VALUES ('q2', '#', 'q6', '#', 'L');  


INSERT INTO programa VALUES ('q3', '0', 'q3', '0', 'L');
INSERT INTO programa VALUES ('q3', '1', 'q3', '1', 'L');
INSERT INTO programa VALUES ('q3', '#', 'q5', '#', 'L');


INSERT INTO programa VALUES ('q5', '0', 'q5', '0', 'L');
INSERT INTO programa VALUES ('q5', '1', 'q5', '1', 'L');
INSERT INTO programa VALUES ('q5', 'B', 'q_copy', 'B', 'R');


INSERT INTO programa VALUES ('q_copy', '0', 'q_cp0', '0', 'R');
INSERT INTO programa VALUES ('q_copy', '1', 'q_cp1', '1', 'R');
INSERT INTO programa VALUES ('q_copy', 'X', 'q_copy', 'X', 'R');
INSERT INTO programa VALUES ('q_copy', 'Y', 'q_copy', 'Y', 'R');
INSERT INTO programa VALUES ('q_copy', '#', 'q_copy', '#', 'R');


INSERT INTO programa VALUES ('q_cp0', '0', 'q_cp0', '0', 'R');
INSERT INTO programa VALUES ('q_cp0', '1', 'q_cp0', '1', 'R');
INSERT INTO programa VALUES ('q_cp0', '#', 'q_cp0', '#', 'R');
INSERT INTO programa VALUES ('q_cp0', 'X', 'q_cp0', 'X', 'R');
INSERT INTO programa VALUES ('q_cp0', 'Y', 'q_cp0', 'Y', 'R');
INSERT INTO programa VALUES ('q_cp0', 'B', 'q_back', '0', 'L');


INSERT INTO programa VALUES ('q_cp1', '0', 'q_cp1', '0', 'R');
INSERT INTO programa VALUES ('q_cp1', '1', 'q_cp1', '1', 'R');
INSERT INTO programa VALUES ('q_cp1', '#', 'q_cp1', '#', 'R');
INSERT INTO programa VALUES ('q_cp1', 'X', 'q_cp1', 'X', 'R');
INSERT INTO programa VALUES ('q_cp1', 'Y', 'q_cp1', 'Y', 'R');
INSERT INTO programa VALUES ('q_cp1', 'B', 'q_back', '1', 'L');


INSERT INTO programa VALUES ('q_back', '0', 'q_back', '0', 'L');
INSERT INTO programa VALUES ('q_back', '1', 'q_back', '1', 'L');
INSERT INTO programa VALUES ('q_back', '#', 'q2', '#', 'L');



INSERT INTO programa VALUES ('q4', '0', 'q4', '0', 'L');
INSERT INTO programa VALUES ('q4', '1', 'q4', '1', 'L');
INSERT INTO programa VALUES ('q4', '#', 'q2', '#', 'L');


INSERT INTO programa VALUES ('q6', 'X', 'q6', 'X', 'L');
INSERT INTO programa VALUES ('q6', 'Y', 'q6', 'Y', 'L');
INSERT INTO programa VALUES ('q6', 'B', 'q_accept', 'B', 'S');
