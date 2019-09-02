def num_repetidas (columna1, columna2):
    repetidos = 0
    for x in columna1:
        for y in columna2:
            if x == y:
                repetidos += 1
    return repetidos