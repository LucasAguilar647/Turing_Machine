letras = [chr(c) for c in range(ord('a'), ord('z') + 1)]


with open("Programa_Inversor_Completo.sql", "w") as f:
    f.write("-- Programa que invierte la palabra y la copia al final con alfabeto completo (a–z)\n")
    f.write("DELETE FROM programa;\n\n")

    
    for l in letras:
        f.write(f"INSERT INTO programa VALUES ('q0', '{l}', 'q1{l}', 'X', 'R');\n")
    f.write("INSERT INTO programa VALUES ('q0', 'X', 'q0', 'X', 'R');\n")
    f.write("INSERT INTO programa VALUES ('q0', 'B', 'q_insert_sep', '#', 'R');\n\n")

  
    f.write("INSERT INTO programa VALUES ('q_insert_sep', 'B', 'q_accept', 'B', 'S');\n\n")

   
    for l in letras:
        
        for s in letras + ['X', '#']:
            f.write(f"INSERT INTO programa VALUES ('q1{l}', '{s}', 'q1{l}', '{s}', 'R');\n")
        f.write(f"INSERT INTO programa VALUES ('q1{l}', 'B', 'q2{l}', '{l}', 'L');\n\n")

       
        for s in letras + ['X', '#']:
            f.write(f"INSERT INTO programa VALUES ('q2{l}', '{s}', 'q2{l}', '{s}', 'L');\n")
        f.write(f"INSERT INTO programa VALUES ('q2{l}', 'B', 'q0', 'B', 'R');\n\n")

print("Archivo 'Programa_Inversor_Completo.sql' generado correctamente.")
