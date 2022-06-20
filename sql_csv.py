import csv
# import MySQLdb


def insertData(file):
    miConexion = MySQLdb.connect(
        host='localhost', user='root', passwd='', db='test2')
    cur = miConexion.cursor()

    # nombres = ["Juan", "Pedro", "Ana", "Maria", "Merced",
    #          "John", "Ivan", "Melchor", "James", "Monica"]
    # apellidos = ["Perez", "Garcia", "Mondragon",
    #            "Torres", "Gonzalez", "Ramirez", "Doe"]

    datos = read_file(file)

    sql = "INSERT INTO `Ciudad` (`C_ciudad`, `nombre`)"
    sql += " VALUES (%s, %s)"
    val = []

    for i, j in zip(datos[14], datos[5]):
        row = [i, j]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `Municipio` (`C_municipio`, `nombre`)"
    sql += " VALUES (%s, %s)"
    val = []

    for i, j in zip(datos[11], datos[3]):
        row = [i, j]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `Estado` (`C_estado`, `nombre`)"
    sql += " VALUES (%s, %s)"
    val = []

    for i, j in zip(datos[7], datos[4]):
        row = [i, j]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `Asenta` (`id_codigo`, `id_asenta_cpcons`)"
    sql += " VALUES (%s, %s)"
    val = []

    for i, j in zip(datos[0], datos[12]):
        row = [i, j]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `Codigo_postal` (`d_cp`, `C_oficina`, `C_CP`)"
    sql += " VALUES (%s, %s, %s)"
    val = []

    for i, j, k in zip(datos[6], datos[8], datos[9]):
        row = [i, j, k]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `zona` (`C_zona`, `tipo_zona`)"
    sql += " VALUES (%s, %s)"
    val = []

    for index, i in enumerate(datos[13]):
        row = [index, i]
        val.append(row)

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    sql = "INSERT INTO `Tipo_asenta` (`C_tipo_asenta`, `nombre_tipo_asenta`)"
    sql += " VALUES (%s, %s)"
    val = []

    for i, j in zip(datos[10], datos[2]):
        row = [i, j]

    print(val[0])
    # cur.execute(sql)
    cur.executemany(sql, val)
    miConexion.commit()

    miConexion.close()


def read_file(file):
    with open(file, newline="") as csvfile:
        file = csv.reader(csvfile, delimiter=",")

        datos = [[] for i in range(15)]

        count = 0
        for row in file:
            if count > 0:
                for index, i in enumerate(row):
                    datos[index].append(i)
            count += 1

        return datos


insertData("aguascalientes.csv")
# insertData("colima.csv")
# insertData("Jalisco.csv")
