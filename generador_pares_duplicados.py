letras = [chr(c) for c in range(ord('a'), ord('z') + 1)]

with open("Programa_ParesDuplicados.sql", "w") as f:
    
    f.write("DELETE FROM alfabeto;\n\n")
    f.write("INSERT INTO alfabeto (simbolo) VALUES\n")
    for i, l in enumerate(letras + ['X', 'B']):
        end = ',' if i < len(letras + ['X', 'B']) - 1 else ';'
        f.write(f"('{l}'){end}\n")
    f.write("\n")


    f.write("DELETE FROM programa;\n\n")

    
    for l in letras:
        f.write(f"INSERT INTO programa VALUES ('q0', '{l}', 'q1{l}', 'X', 'R');\n")
    f.write("INSERT INTO programa VALUES ('q0', 'X', 'q0', 'X', 'R');\n")
    f.write("INSERT INTO programa VALUES ('q0', 'B', 'q_accept', 'B', 'S');\n\n")

   
    for l in letras:
      
        f.write(f"INSERT INTO programa VALUES ('q1{l}', '{l}', 'q0', 'X', 'R');\n")
        
        for l2 in letras:
            if l2 != l:
                f.write(f"INSERT INTO programa VALUES ('q1{l}', '{l2}', 'q_reject', '{l2}', 'S');\n")
        f.write(f"INSERT INTO programa VALUES ('q1{l}', 'X', 'q1{l}', 'X', 'R');\n")
        f.write(f"INSERT INTO programa VALUES ('q1{l}', 'B', 'q_reject', 'B', 'S');\n\n")

print("Archivo 'Programa_ParesDuplicados.sql' generado correctamente.")
