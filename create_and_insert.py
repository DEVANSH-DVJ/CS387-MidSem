import psycopg2 as pg

conn = pg.connect(database='LabMidSem', user='postgres',
                  password='secret', host='localhost', port='5432')
cur = conn.cursor()


with open('PS/DDL_olympics_new.sql', 'r') as file:
    crt = file.read()
with open('PS/sampleData_olympics.sql', 'r') as file:
    ins = file.read()

for x in crt.split(';') + ins.split(';'):
    try:
        cur.execute(x)
    except Exception as e:
        print(e)

conn.commit()

cur.close()
if (conn):
    conn.close()
