-- =====================
-- CREAR TABLAS
-- =====================
--Al crear una base nueva no necesitamos eliminar las tablas, ya que no existen.
--DROP TABLE IF EXISTS traza_ejecucion;
--DROP TABLE IF EXISTS programa;
--DROP TABLE IF EXISTS alfabeto;

CREATE TABLE alfabeto (
    simbolo TEXT PRIMARY KEY
);

CREATE TABLE programa (
    estado_ori TEXT NOT NULL,
    caracter_ori TEXT NOT NULL,
    estado_nue TEXT NOT NULL,
    caracter_nue TEXT NOT NULL,
    desplazamiento CHAR(1) NOT NULL CHECK (desplazamiento IN ('L', 'R', 'S'))
);

CREATE TABLE traza_ejecucion (
    paso SERIAL PRIMARY KEY,
    estado_actual TEXT NOT NULL,
    posicion_cabezal INTEGER NOT NULL CHECK (posicion_cabezal >= 1),
    cinta TEXT NOT NULL,
    caracter_leido TEXT NOT NULL,
    caracter_escrito TEXT NOT NULL,
    desplazamiento CHAR(1),
    estado_siguiente TEXT,
    halting BOOLEAN DEFAULT FALSE
);
