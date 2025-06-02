DELETE FROM alfabeto;
INSERT INTO alfabeto (simbolo) VALUES ('0'), ('1'), ('X'), ('B');


DELETE FROM programa;


INSERT INTO programa VALUES
-- MARCO EL 0 Y VOY AL ULTIMO
('q0', '0', 'q_check0', 'X', 'R'),
-- MARCO EL 1 Y VOY AL ULTIMO
('q0', '1', 'q_check1', 'X', 'R'),
-- CASO BASE
('q0', 'X', 'q_accept', 'X', 'S'),
('q0', 'B', 'q_accept', 'B', 'S'),

-- MOVERSE HASTA EL FINAL
('q_check0', '0', 'q_check0', '0', 'R'),
('q_check0', '1', 'q_check0', '1', 'R'),
('q_check0', 'X', 'q_check0', 'X', 'R'),
('q_check0', 'B', 'q_back0', 'B', 'L'),

('q_check1', '0', 'q_check1', '0', 'R'),
('q_check1', '1', 'q_check1', '1', 'R'),
('q_check1', 'X', 'q_check1', 'X', 'R'),
('q_check1', 'B', 'q_back1', 'B', 'L'),

-- MIRO SI MATCHEA CON MI NUMERO
('q_back0', '0', 'q_match', 'B', 'L'),
('q_back0', '1', 'q_error', '-', 'L'),
('q_back1', '1', 'q_match', 'B', 'L'),
('q_back1', '0', 'q_error', '-', 'L'),

-- VUELVO AL PRINCIPIO
('q_match', '0', 'q_match', '0', 'L'),
('q_match', '1', 'q_match', '1', 'L'),
('q_match', 'X', 'q0', 'B', 'R'),


-- SI NO COINCIDEN RECHAZO
-- SI EL INPOUT ES VACIO
('q_back1', 'X', 'q_accept', 'B', 'S'), 
('q_back1', 'B', 'q_accept', 'B', 'S'), 
('q_back0', 'X', 'q_accept', 'B', 'S'), 
('q_back0', 'B', 'q_accept', 'B', 'S');