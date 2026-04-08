import os

filename = "tilemap.txt"

if os.path.exists(filename):
    print("o arquivo já existe")

else:
    tilemap = [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0]
    matrix = []

    for i in range(15):
        line = [j for j in tilemap]
        if i == 15//2:
            line[9] = 2
            line[11] = 3
        
        matrix.append(line)

    with open(filename, "w") as file:
        for line in matrix:
            for element in line:
                binary_string = format(element, '08b')
                file.write(binary_string + "\n")


    print("arquivo gerado")