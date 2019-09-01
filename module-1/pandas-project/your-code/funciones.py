def calendario(date):
    mes = []
    for e in df["Date"]:
        if e.find("Jan") != -1:
            mes.append(1)
        elif e.find("Feb") != -1:
            mes.append(2)
        elif e.find("Mar") != -1:
            mes.append(3)
        elif e.find("Apr") != -1:
            mes.append(4)
        elif e.find("May") != -1:
            mes.append(5)
        elif e.find("Jun") != -1:
            mes.append(6)
        elif e.find("Jul") != -1:
            mes.append(7)
        elif e.find("Aug") != -1:
            mes.append(8)
        elif e.find("Sep") != -1:
            mes.append(9)
        elif e.find("Oct") != -1:
            mes.append(10)
        elif e.find("Nov") != -1:
            mes.append(11)
        elif e.find("Dic") != -1:
            mes.append(12)
        else:
            pass
    print(mes)
