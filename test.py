import pymysql
from pathlib import Path
import pandas as pd

credentials = Path('./connection/credentials.txt')
if (not credentials.exists()):
    print('ERROR - COULD NOT RECOVER CREDENTIAL FILES')

with open(credentials) as f:
    lines = f.read().splitlines()
    f.close()

data_folder = Path('./datasets/2.-Urban-Environment/air-stations-nov-2017.csv')
df = pd.read_csv(data_folder)
#print(df.columns)
print(df)

# create INSERT sentence
insert_sql = 'INSERT INTO Station ({}) VALUES (%s,%s,%s)'
column_names = 'name, lat, lng'


conn = pymysql.connect(host=lines[0], user=lines[1], password=lines[2], db=lines[3])

# create cursor
cursor = conn.cursor()

for i,row in df.iterrows():
    cursor.execute(insert_sql.format(column_names), [row[0], float(row[1]), float(row[2])])

# the connection is not autocommitted by default, so we must commit to save our changes
conn.commit()

conn.close()
cursor.close()
