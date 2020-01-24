import pymysql
from pathlib import Path
import pandas as pd
import sys
from datetime import datetime
import re

class DBConnector:
    def __init__(self, path):
        """
        Constructor -->
        - path: relative or full path to the connection file
                structure of the file:
                - host
                - user
                - password
                - database
        """
        credentials = Path(path)
        # check file exists
        if (not credentials.exists()):
            print('ERROR - COULD NOT RECOVER CREDENTIAL FILES')
            sys.exit()
        # open credentials super secret file
        with open(credentials) as f:
            lines = f.read().splitlines()
            f.close()
        # create connector
        self.conn = pymysql.connect(host=lines[0], user=lines[1], password=lines[2], db=lines[3])
        # create cursor
        self.cursor = self.conn.cursor()
        self.insert_sql = 'INSERT INTO {} ({}) VALUES ({})'

    def insert_values(self, table, columns, values, row):
        """
        insert given values to specified table
        - table: the table to insert values
        - columns: columns affected, params to insert
        - values: specify a string with '%s' for each param
            -- 3 parameters would be str('%s,%s,%s')
        -row: array / tuple / list with values to insert in the
            order of the columns var
        """
        try:
            self.cursor.execute(self.insert_sql.format(table, columns, values), row)
            self.conn.commit()
        except pymysql.Error as e:
            if (str(e).__contains__('Duplicate')):
                print(f'DUPLICATED VALUE --> {row}')
            else:
                print(f'ERROR - could not insert querie {self.insert_sql.format(table_name, column_names, values)} with params {row}')
            self.conn.rollback()
    
    def execute_query(self, sql):
        """
        executes the given slq sentence. It can
        only execute SELECT sentences.
        - sql: the query to execute
        - return >> pandas dataframe with result
        """
        return pd.read_sql(sql, self.conn)
    
    def close_connection(self):
        """
        closes all open connections
        """
        self.cursor.close()
        self.conn.close()


def recover_integer(val):
    """
    gets the int value from a string
    - val: the var to cast into int type
    - return >> the int value in the given var
        -- if no value could be retrieved,
           returns null
    """
    try:
        new_val = int(val.values[0])
    except:
        try:
            tmp = re.subn('[^\d]','',str(val))
            new_val = int(tmp[0])
        except:
            new_val = -1
    return new_val

def recover_date(val):
    """
    gets a str and casts it into datetime
    - val: the str to cast into datetime type
        -- format needs to be '%d/%m/%Y %H:%M'
    - return >> datetime given in val
        -- if no date could be casted, returns now()
    """
    try:
        generated = datetime.strptime(val, '%d/%m/%Y %H:%M')
    except:
        print('ERROR - could not parse date: ', val)
        generated = datetime.now()
    return generated.strftime('%Y-%m-%d %H:%M:%S')

def run_csv_file_into_sql(registry_df, stations):
    """
    gets a pandas dataframe and insert its alue into DB
    - registry_df: the dataframe to insert
    - stations: dataframe with stations
    """
    # setting values to create the inserts
    table_name = 'Registry'
    column_names = 'no2_Val, o3_Val, pm_val, date_generate, station_ID'
    values = '%s,%s,%s,%s,%s'

    for i,row in registry_df.iterrows():
        station = stations.query(f'name == \'{row["Station"].strip()}\'')
        if (station.size == 0):
            print('no station found with name ',row["Station"])
            # print('\n\nWARNING - row not saved \n',row)
            continue
        station_ID = recover_integer(station.station_ID)
        if (station_ID == -1):
            print('no station saved with name ',row["Station"])
            continue
        no2_value = recover_integer(row['NO2 Value'])
        o3_value = recover_integer(row['O3 Value'])
        pm10_value = recover_integer(row['PM10 Value'])
        date_generated = recover_date(str(row.Generated))
        row_values = [no2_value, o3_value, pm10_value, date_generated, int(station_ID)]
        db_conn.insert_values(table_name, column_names, values, row_values)



# create the connector
db_conn = DBConnector(Path('./Project-Week-2-Barcelona/connection/credentials.txt'))
# recover file to insert
########################
# STATION ##############
########################
data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/air-stations-nov-2017.csv')
station_df = pd.read_csv(data_folder)
print('\nimported data -->\n', station_df)
# setting values to create the inserts
table_name = 'Station'
column_names = 'name, lat, lng'
values = '%s,%s,%s'

for i,row in station_df.iterrows():
    db_conn.insert_values(table_name, column_names, values, [row[0].strip(), row[1], row[2]])


########################
# REGISTRY #############
########################
# get station IDs
stations = db_conn.execute_query('SELECT ID as station_ID, name FROM Station')

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/air-quality-nov-2017.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_06_Juny_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder, sep=';')
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_08_Agost_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_09_Setembre_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_10_Octubre_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_11_Novembre_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2018_12_Desembre_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2019_01_Gener_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

data_folder = Path('./Project-Week-2-Barcelona/datasets/2.-Urban-Environment/2019_02_Febrer_qualitat_aire_BCN.csv')
registry_df = pd.read_csv(data_folder)
print('\nimported data -->\n', registry_df)
run_csv_file_into_sql(registry_df, stations)

#####################
# close connections #
#####################
db_conn.close_connection()
