import psycopg2

conn = psycopg2.connect("postgresql://cafe_user:testing@localhost/cafe_data")
cur = conn.cursor()

while True:
    print("Please enter purchase ID")
    purchase_id = int(input())
    print("Please enter employee ID")
    employee_id = int(input())
    print("Please enter product ID")
    product_id = int(input())
    print("Please enter quantity of product sold")
    quantity = int(input())
    cur.execute("""
    INSERT INTO purchases (purchase_id, employee_id, product_id, quantity)
    VALUES (%s, %s, %s, %s)
    RETURNING purchase_id;
    """, (purchase_id, employee_id, product_id, quantity));
    purchase_id = cur.fetchone()[0]
    print(f"Purchase submitted: ID {purchase_id}")
    conn.commit()

cur.close()
conn.close()
