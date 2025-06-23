letras = [chr(c) for c in range(ord('a'), ord('z') + 1)]


with open("Programa_Inversor_Completo.sql", "w") as f:
    f.write("-- Programa que invierte la palabra y la copia al final con alfabeto completo (a–z)\n")
    f.write("DELETE FROM alfabeto;")
    f.write("INSERT INTO alfabeto (simbolo) VALUES\n")
    for i, l in enumerate(letras + ['X', 'B']):
        end = ',' if i < len(letras + ['X', 'B']) - 1 else ';'
        f.write(f"('{l}'){end}\n")
    f.write("\n")
    f.write("DELETE FROM programa;\n\n")

    f.write("--MOVERSE HASTA EL FINAL LA PRIMERA VEZ;\n")
    for l in letras:
        f.write(f"INSERT INTO programa VALUES ('q0', '{l}', 'q0', '{l}', 'R');\n")
    
    f.write("INSERT INTO programa VALUES ('q0', 'B', 'load', 'B', 'L');\n\n")

    f.write("--AGARRA EL PRIMER VALOR A COPIAR (ULTIMO CARACTER);\n")
    for l in letras:
        f.write(f"INSERT INTO programa VALUES ('load', '{l}', 'load_{l}', 'X', 'R');\n")
   
    f.write("INSERT INTO programa VALUES ('load', 'B', 'finish', 'B', 'L');\n\n")

    f.write("--BUSCA EL PRIMER B DISPONIBLE Y PEGA EL VALOR;\n")
    for l in letras:
        
        for s in letras + ['X']:
            f.write(f"INSERT INTO programa VALUES ('load_{l}', '{s}', 'load_{l}', '{s}', 'R');\n")
        f.write(f"INSERT INTO programa VALUES ('load_{l}', 'B', 'search_X', '{l}', 'L');  --PEGA EL VALOR Y SE VA PARA LA IZQUIERDA\n\n")

    f.write("--BUSCA ALGUNA X (CORRESPONDEN AL STRING ORIGINAL);\n")

    for l in letras:
        f.write(f"INSERT INTO programa VALUES ('search_X', '{l}', 'search_X', '{l}', 'L');\n")
    f.write("INSERT INTO programa VALUES ('search_X', 'X', 'load_next', 'X', 'L'); --CAMBIA DE ESTADO PARA VER SI ENCUENTRA OTRO CARACTER PARA COPIAR\n\n")

    for l in letras:
         f.write(f"INSERT INTO programa VALUES ('load_next', '{l}', 'load_{l}', 'X', 'R');\n")
    f.write(f"INSERT INTO programa VALUES ('load_next', 'B', 'finish', 'B', 'R');\n")
    f.write(f"INSERT INTO programa VALUES ('load_next', 'X', 'load_next', 'X', 'L');\n\n")

print("Archivo 'Programa_Inversor_Completo.sql' generado correctamente.")