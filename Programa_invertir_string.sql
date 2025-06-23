DELETE FROM alfabeto;
INSERT INTO alfabeto (simbolo) VALUES ('a'), ('b'), ('c'), ('X'), ('B');


DELETE FROM programa;


INSERT INTO programa VALUES

('qB', 'a', 'qB', 'a', 'R'),
('qB', 'b', 'qB', 'b', 'R'),
('qB', 'c', 'qB', 'c', 'R'),
('qB', 'B', 'load', 'B', 'L'), 


('load', 'a', 'load_a', 'X', 'R' ),
('load', 'b', 'load_b', 'X', 'R' ), 
('load', 'c', 'load_c', 'X', 'R' ), 
('load', 'B', 'finish?', 'B', 'L' ),


('load_a', 'a', 'load_a', 'a', 'R'),
('load_a', 'b', 'load_a', 'b', 'R'),
('load_a', 'c', 'load_a', 'c', 'R'),
('load_a', 'X', 'load_a', 'X', 'R'),
('load_a', 'B', 'search_X', 'a', 'L'), 


('search_X', 'a', 'search_X', 'a', 'L'),
('search_X', 'b', 'search_X', 'b', 'L'), 
('search_X', 'c', 'search_X', 'c', 'L'), 
('search_X', 'X', 'load_next', 'X', 'L'),

('load_next', 'a', 'load_a', 'X', 'R'), 
('load_next', 'b', 'load_b', 'X', 'R'), 
('load_next', 'c', 'load_c', 'X', 'R'),
('load_next', 'B', 'finish?', 'B', 'R'),
('load_next', 'X', 'load_next', 'X', 'L')
