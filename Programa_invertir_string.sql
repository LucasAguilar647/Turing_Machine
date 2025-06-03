DELETE FROM alfabeto;
INSERT INTO alfabeto (simbolo) VALUES ('a'), ('b'), ('c'), ('X'), ('B');


DELETE FROM programa;


INSERT INTO programa VALUES
-- MOVERSE HASTA EL FINAL LA PRIMERA VEZ
('qB', 'a', 'qB', 'a', 'R'),
('qB', 'b', 'qB', 'b', 'R'),
('qB', 'c', 'qB', 'c', 'R'),
('qB', 'B', 'load', 'B', 'L'), 

--AGARRA EL PRIMER VALOR A COPIAR (ULTIMO CARACTER)
('load', 'a', 'load_a', 'X', 'R' ),
('load', 'b', 'load_b', 'X', 'R' ), --TODO load_b
('load', 'c', 'load_c', 'X', 'R' ), --TODO load_c
('load', 'B', 'finish?', 'B', 'L' ),

--BUSCA EL PRIMER B DISPONIBLE Y PEGA EL VALOR
('load_a', 'a', 'load_a', 'a', 'R'),
('load_a', 'b', 'load_a', 'b', 'R'),
('load_a', 'c', 'load_a', 'c', 'R'),
('load_a', 'X', 'load_a', 'X', 'R'),
('load_a', 'B', 'search_X', 'a', 'L'), --PEGA EL VALOR Y SE VA PARA LA IZQUIERDA

--BUSCA ALGUNA X (CORRESPONDEN AL STRING ORIGINAL)
('search_X', 'a', 'search_X', 'a', 'L'),
('search_X', 'b', 'search_X', 'b', 'L'), --a,b,c PERTENECEN AL STRING COPIADO
('search_X', 'c', 'search_X', 'c', 'L'), 
('search_X', 'X', 'load_next', 'X', 'L'), --CAMBIA DE ESTADO PARA VER SI ENCUENTRA OTRO CARACTER PARA COPIAR

('load_next', 'a', 'load_a', 'X', 'R'), 
('load_next', 'b', 'load_b', 'X', 'R'), --a,b,c PERTENECEN AL STRING ORIGINAL
('load_next', 'c', 'load_c', 'X', 'R'),
('load_next', 'B', 'finish?', 'B', 'R'),
('load_next', 'X', 'load_next', 'X', 'L')
