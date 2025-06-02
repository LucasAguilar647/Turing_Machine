
-- =====================
-- FUNCION: simuladorMT
-- =====================

CREATE OR REPLACE FUNCTION simuladorMT(entrada TEXT)
RETURNS VOID AS $$
DECLARE
    cinta TEXT[] := string_to_array(entrada, NULL);
    posicion INTEGER := 1;
    estado TEXT := 'q0';
    paso INTEGER := 0;
    simbolo_actual TEXT;
    transicion RECORD;
    halt BOOLEAN := FALSE;
BEGIN
    -- Validación del alfabeto
    FOR simbolo_actual IN SELECT unnest(cinta) LOOP
        IF NOT EXISTS (SELECT 1 FROM alfabeto WHERE alfabeto.simbolo = simbolo_actual) THEN
            RAISE EXCEPTION 'Carácter inválido en la entrada: %', simbolo_actual;
        END IF;
    END LOOP;

    -- Limpiar traza anterior
    DELETE FROM traza_ejecucion;

    LOOP
        paso := paso + 1;

        -- Expandir cinta
        IF posicion < 1 THEN
            cinta := array_prepend('B', cinta);
            posicion := 1;
        ELSIF posicion > array_length(cinta, 1) THEN
            cinta := array_append(cinta, 'B');
        END IF;

        simbolo_actual := cinta[posicion];

        -- Buscar transición
        SELECT * INTO transicion
        FROM programa
        WHERE estado_ori = estado AND caracter_ori = simbolo_actual
        LIMIT 1;

        IF NOT FOUND THEN
            halt := TRUE;
        ELSE
            cinta[posicion] := transicion.caracter_nue;
            estado := transicion.estado_nue;

            IF transicion.desplazamiento = 'R' THEN
                posicion := posicion + 1;
            ELSIF transicion.desplazamiento = 'L' THEN
                posicion := posicion - 1;
            END IF;
        END IF;

        INSERT INTO traza_ejecucion (
            estado_actual,
            posicion_cabezal,
            cinta,
            caracter_leido,
            caracter_escrito,
            desplazamiento,
            estado_siguiente,
            halting
        ) VALUES (
            estado,
            posicion,
            array_to_string(cinta, ''),
            simbolo_actual,
            COALESCE(transicion.caracter_nue, simbolo_actual),
            COALESCE(transicion.desplazamiento, NULL),
            COALESCE(transicion.estado_nue, NULL),
            halt
        );

        IF halt THEN
            EXIT;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

-- =====================
-- FUNCION: get_descripciones
-- =====================

CREATE OR REPLACE FUNCTION get_descripciones()
RETURNS TABLE (
    paso INTEGER,
    descripcion TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        CAST(ROW_NUMBER() OVER () AS INTEGER) AS paso,
        'Estado: ' || estado_actual || 
        ', Cabezal: ' || posicion_cabezal ||
        ', Cinta: ' || cinta || 
        CASE WHEN halting THEN ' (HALTING)' ELSE '' END
    FROM traza_ejecucion
    ORDER BY paso;
END;
$$ LANGUAGE plpgsql;
