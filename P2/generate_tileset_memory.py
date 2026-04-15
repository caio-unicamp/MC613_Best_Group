import os

filename = "tilesetmemory.txt"
if os.path.exists(filename):
    print("arquivo existe")
else:

    tiles = [1024*"0", 1024*"1", 512*"0" + 512*"1", 512*"1" + 512*"0"]

    with open(filename, "w") as file:
        for t in tiles:
            for pixel_color in t:
                file.write(f"{pixel_color.zfill(8)}\n")
    



