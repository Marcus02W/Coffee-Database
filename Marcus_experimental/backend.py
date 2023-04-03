from flask import Flask, render_template, request, redirect
import psycopg2
import pandas as pd


app = Flask(__name__, template_folder='templateFiles', static_folder='staticFiles')

@app.route('/')
def index():
    return redirect('/login', code=301)

@app.route("/login")
def loadLoginPage():
    return render_template('Login.html')

@app.route("/signup")
def loadSignupPage():
    return render_template('Signup.html')

@app.route("/customer_landing")
def loadCustomerLanding():
    return render_template('customer_landing.html')

@app.route("/coffee_shop_landing")
def loadCoffeeShopLanding():
    return render_template('coffee_shop_landing.html')


# api's
@app.route("/login_api", methods=['POST'])
def handleLogin():
    isvalid = False
    login_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="postgres",
        password="x5Tg9%eZu1!")
    
    cursor = conn.cursor()
    
    try:
        sql_query = "SELECT * FROM customer_login WHERE customer_login.customer_id='"+login_info['username']+"' AND customer_login.customer_password='" + login_info['password'] + "'"
        #login_data = pd.read_sql_query(sql_query, conn)
        cursor.execute(sql_query)
        result = cursor.fetchone()
        conn.commit()
        conn.close()
        if result is None:
            return "failed"


        return login_info

    except:
        return "failed"


    

@app.route("/signup_api", methods=['POST'])
def handleSignup():
    isvalid = False
    signup_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="postgres",
        password="x5Tg9%eZu1!")
    
    cursor = conn.cursor()

    try:
        sql_query = "begin; insert into customers (customer_id, customer_firstname, customer_lastname) values (" + signup_info['username'] + ",'" + signup_info['firstname'] + "','" + signup_info['lastname'] + "'); insert into customer_login (customer_id, customer_password) values (" + signup_info['username'] + ",'" + signup_info['password'] + "'); commit;"
        cursor.execute(sql_query)
        
        isvalid=True

    except:
        isvalid=False

    conn.commit()
    conn.close()

    if isvalid:
        return "successful"
    else:
        return "failed"
    

@app.route("/customer_page_api", methods=['POST'])
def customer_page_handling():
        

    data = request.form

    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="postgres",
        password="x5Tg9%eZu1!")
    
    cursor = conn.cursor()
    
    try:
        # password query is always executed before any other query to check validity of login information!
        sql_query = "SELECT * FROM customer_login WHERE customer_login.customer_id='"+data['username']+"' AND customer_login.customer_password='" + data['password'] + "'"
        cursor.execute(sql_query)
        result = cursor.fetchone()
        if result is None:
            return "unveriefied connection"

        # returning all the stats for the customer landing page

        conn.commit()
        conn.close()

        return "verified connection"

    except:

        return "unverified connection"

    





    