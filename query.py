import psycopg2
from psycopg2 import sql
council_name = input("Enter council name:")
troop_number = int(input("Enter troop number:"))
try:
    conn = psycopg2.connect(database="mydb", user="postgres", password="postgres", host="127.0.0.1", port="5432")

    print("Opened database successfully")

    cur = conn.cursor()
    tabeShop_Sales="shop_sales"
    tablesells_for="sells_for"
    query1='''
        SELECT cookiename,sQty FROM {} WHERE Shop_Sales.tnumber = %s                
    '''
    Query2="""
    SELECT price FROM {} WHERE CouncilName=%s
        AND Shop_Sales.cookiename=sells_for.cookiename    
    """
    insert_query1 = sql.SQL(query1).format(table=sql.Identifier(tabeShop_Sales))
    insert_query2 = sql.SQL(Query2).format(table=sql.Identifier(tablesells_for))
    cur.execute(insert_query1,(tabeShop_Sales,council_name))
    cur.execute(insert_query2, (tablesells_for,troop_number))
    
    data = cur.fetchall()
    if data:
        for row in data:
            print(row)
    else:
        print("Data does not")
except (Exception, psycopg2.Error) as error:
    print("Failed to retrieve records", error)
finally:
    cur.close()
    conn.close()
    print("Postgresql connection closed")
