import psycopg2
from data.config import config
from classes.utils.cursorReader import CursorReader
from psycopg2 import Error

def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        # create a cursor
        cur = conn.cursor()
        
	# execute a statement
        print('Vending Machine View:')
        cur.execute('SELECT id, slot_row, slot_column, price, quantity, category_name FROM public.vending_machine_overview;')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)
       
	# close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')

def getItems():
    """ Connect to the PostgreSQL database server """
    conn = None
    rows = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        # create a cursor
        cur = conn.cursor()
        
	# execute a statement
        print('Vending Machine View:')
        cur.execute('SELECT name, category, "row", "column", quantity, price, id FROM public.vending_machine_overview;')

        # display the PostgreSQL database server version
        rows = cur.fetchall()

	# close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')
    return rows

def vendItem(item_id):
    try:
        # Establish a connection to the PostgreSQL database
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        cur = conn.cursor()

        # Execute the stored procedure
        cur.execute("CALL vend_item(%s)", [item_id])

        # If the stored procedure returns any data, fetch it
        # results = cursor.fetchall()  # Uncomment and modify if the stored procedure returns data

        # Commit the transaction
        conn.commit()

        for notice in conn.notices:
            print(notice)

    except psycopg2.DatabaseError as e:
        # Handling exceptions raised by the database
        print(f"Database error: {e}")
        conn.rollback()  # Rollback the transaction in case of error

    except Error as e:
        # Handling other psycopg2 exceptions
        print(f"Error occurred: {e}")
        conn.rollback()  # Rollback the transaction in case of error

    finally:
        # Close the cursor and connection
        if cur:
            cur.close()
        if conn is not None:
            conn.close()
            print('Database connection closed.')
