# import pandas as pd
import psycopg2

# data cleaning
fname = input('Enter absolute path to your file: ')
fhand = open(fname)
for line in fhand:
    # remove | character
    row = line.split("|")
    # uncleanSize=len(row)
    # filter rows to remove empty values in the list
    cleanrow = list(filter(None, row))
    # If input file is clean, it should have 17 values >>(FOR INDIVIDUAL SALES) NB//ADDRESS SHOULD HAVE ONE DATA
    # FIELD)  or 12(FOR SHOP SALES) values in the cleanRow
    lineSize = len(cleanrow)
    print(lineSize)

    if lineSize > 14:
        # INDIVIDUAL SALES
        # ROWS DATA
        councilName = cleanrow[0]
        serviceUnitName = cleanrow[1]
        serviceUnitNo = cleanrow[2]
        troppNo = cleanrow[3]
        leaderName = cleanrow[4]
        leaderAddress6 = cleanrow[5]
        girlName7 = cleanrow[6]
        girlAddress8 = cleanrow[7]
        girlRank9 = cleanrow[8]
        customerName10 = cleanrow[9]
        customerAddress11 = cleanrow[10]
        cookieName12 = cleanrow[11]
        cookiePrice13 = cleanrow[12]
        bakerName14 = cleanrow[13]
        bakerAddress15 = cleanrow[14]
        quantitySold16 = cleanrow[15]
        dateSold17 = cleanrow[16]
        individuallist=[councilName,
                            serviceUnitName,serviceUnitNo,councilName,
                            troppNo,serviceUnitNo,leaderName,leaderAddress6,troppNo,
                            girlName7,girlAddress8
                            ,girlRank9, troppNo, customerName10, customerAddress11
                            , cookieName12,bakerName14,bakerAddress15,dateSold17,cookiePrice13,
                            cookieName12, councilName,quantitySold16,dateSold17, customerName10, 
                            customerAddress11,girlName7,girlAddress8
        ]

        try:
            #  SQL STATEMENT FOR INDIVIDUAL SALES
            conn = psycopg2.connect(database="mydb", user='postgres', password='postgres', host='127.0.0.1', port='5432'
                                    )
            # Creating a cursor object using the cursor() method
            print("Opened database successfully")
            cursor = conn.cursor()
            
                      
            # Test
            cursor.execute("""
             BEGIN;
                INSERT INTO council(councilname) VALUES (%s);
                INSERT INTO service_unit(snumber,sname,councilname) VALUES (%s, %s, %s);
                INSERT INTO troop(tnumber,snumber) VALUES (%s, %s);
                INSERT INTO Leader(LName,LAddress,tnumber) VALUES (%s, %s, %s);
                INSERT INTO girl(gName,gAddress,gRank,tnumber) VALUES (%s, %s, %s,%s);
                INSERT INTO customer(CustomerName, CustomerAddress) VALUES (%s, %s);
                INSERT INTO cookie(cookiename) VALUES (%s);
                INSERT INTO baker(BName, Address) VALUES (%s, %s);
                INSERT INTO date(date) VALUES (%s);
                INSERT INTO sells_for(price,cookiename,councilname) VALUES (%s,%s,%s);
                INSERT INTO individual_sales(iQty,date,customername, customeraddress, gname,gaddress) VALUES (%s, %s, %s, %s, %s, %s);
                COMMIT;
                """
                , [individuallist]            
            )

            # Commit your changes in the database
            conn.commit()
            print("Records inserted........")

        except (Exception, psycopg2.Error) as error:
            print("Failed to load data into database", error)

        finally:
            cursor.close()
            conn.close()
            print("PostgreSQL connection is closed")

    else:

        councilName = cleanrow[0]
        serviceUnitName = cleanrow[1]
        serviceUnitNo = cleanrow[2]
        troppNo = cleanrow[3]
        leaderName = cleanrow[4]
        leaderAddress6 = cleanrow[5]
        cookieName12 = cleanrow[6]
        cookiePrice13 = cleanrow[7]
        bakerName14 = cleanrow[8]
        bakerAddress15 = cleanrow[9]
        quantitySold16 = cleanrow[10]
        dateSold17 = cleanrow[11]
        shoplist=[councilName,
                            serviceUnitName,serviceUnitNo,councilName,
                            troppNo,serviceUnitNo,leaderName,leaderAddress6,troppNo,
                            cookieName12,bakerName14,bakerAddress15,dateSold17,cookiePrice13,
                            cookieName12, councilName,quantitySold16,dateSold17, cookieName12,troppNo
        ]
        try:
            # SQL STATEMENT FOR SHOP SALES-------
            conn = psycopg2.connect(database="mydb", user='postgres', password='postgres', host='127.0.0.1', port='5432'
                                    )
            # Creating a cursor object using the cursor() method
            cursor = conn.cursor()
            

            # Preparing SQL queries to INSERT a record into the database.
            # setconstsql='SET CONSTRAINTS DEFERRED ;'
            cursor.execute("""
             BEGIN;
                INSERT INTO council(councilname) VALUES (%s);
                INSERT INTO service_unit(snumber,sname,councilname) VALUES (%s, %s, %s);
                INSERT INTO troop(tnumber,snumber) VALUES (%s, %s);
                INSERT INTO Leader(LName,LAddress,tnumber) VALUES (%s, %s, %s);
                ALTER TABLE  Cookie DISABLE TRIGGER ALL;
                INSERT INTO Cookie(cookiename) VALUES (%s);
                INSERT INTO baker(BName, Address) VALUES (%s, %s);
                INSERT INTO date(date) VALUES (%s);
                INSERT INTO sells_for(price,cookiename,councilname) VALUES (%s,%s,%s);
                ALTER TABLE  Shop_Sales DISABLE TRIGGER ALL;
                INSERT INTO Shop_Sales(sQty,date,cookiename,tnumber) VALUES (%s, %s, %s, %s);
                COMMIT;            
            """
            , [shoplist]            
            )
            
            # Commit your changes in the database
            conn.commit()
            print("Records inserted........")

        except (Exception, psycopg2.Error) as error:
            print("Failed to load data into database", error)
        finally:
            cursor.close()
            conn.close()
            print("PostgreSQL connection is closed")