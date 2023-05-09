from flask import Flask, render_template, request, redirect
import psycopg2
import pandas as pd


app = Flask(__name__, template_folder='templateFiles', static_folder='staticFiles')

@app.route('/')
def index():
    return redirect('/login', code=301)

@app.route("/login_customer")
def loadLoginPage():
    return render_template('Login_customer.html')

@app.route("/signup_customer")
def loadSignupPage():
    return render_template('Signup_customer.html')

@app.route("/login_coffee_shop")
def loadLoginPage():
    return render_template('Login_coffee_shop.html')

@app.route("/signup_coffee_shop")
def loadSignupPage():
    return render_template('Signup_coffee_shop.html')

@app.route("/customer_landing")
def loadCustomerLanding():
    return render_template('customer_landing.html')

@app.route("/coffee_shop_landing")
def loadCoffeeShopLanding():
    return render_template('coffee_shop_landing.html')


# api's
@app.route("/login_api_customer", methods=['POST'])
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


    

@app.route("/signup_api_customer", methods=['POST'])
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



@app.route("/login_api_coffee_shop", methods=['POST'])
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
        sql_query = "SELECT * FROM shop_login WHERE shop_id='"+login_info['username']+"' AND shop_password='" + login_info['password'] + "'"
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


    

@app.route("/signup_api_coffee_shop", methods=['POST'])
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
        sql_query = "begin; insert into coffee_shops (shop_id, name, city, adress, owner_firstname, owner_lastname) values (" + signup_info['shop_id'] + ",'" + signup_info['name'] + "','" + signup_info['city'] + "','" + signup_info['adress'] + "','"+  signup_info['owner_firstname'] + "','" + signup_info['owner_lastname'] + "'); insert into shop_login (shop_id, shop_password) values (" + signup_info['shop_id'] + ",'" + signup_info['password'] + "'); commit;"
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
        result_dict=dict()


        # coffee shops overview
        coffee_shops_overview_query = "select name, city from coffee_shops limit 10;"
        cursor.execute(coffee_shops_overview_query)
        result_coffee_shops_overview = cursor.fetchall()
        result_dict["coffee_shops_overview"] = result_coffee_shops_overview

        # ratings
        ratings_overview_query = "select c.name, r.score from coffee_shops c join ratings r on c.shop_id = r.shop_id order by r.score desc limit 5;"
        cursor.execute(ratings_overview_query)
        result_ratings_overview = cursor.fetchall()
        result_dict["ratings_overview"] = result_ratings_overview

        # recent orders

        conn.commit()
        conn.close()

        return result_dict

    except:

        return "unverified connection"
    


@app.route("/coffee_shop_page_api", methods=['POST'])
def coffee_shop_page_handling():
        

    data = request.form

    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="postgres",
        password="x5Tg9%eZu1!")
    
    cursor = conn.cursor()
    
    try:
        ####### query has to be chaned to fit coffee shops instead of customers
        # password query is always executed before any other query to check validity of login information!
        sql_query = "SELECT * FROM customer_login WHERE customer_login.customer_id='"+data['username']+"' AND customer_login.customer_password='" + data['password'] + "'"
        cursor.execute(sql_query)
        result = cursor.fetchone()
        if result is None:
            return "unveriefied connection"







        conn.commit()
        conn.close()

    ### return value here has to be changed
        return "verified connection"

    except:

        return "unverified connection"

    





    