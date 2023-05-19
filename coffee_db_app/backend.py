from flask import Flask, render_template, request, redirect
import psycopg2
import pandas as pd


app = Flask(__name__, template_folder='templateFiles', static_folder='staticFiles')

@app.route('/')
def index():
    return redirect('/start', code=301)

@app.route('/start')
def start():
    return render_template('start.html')

@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/login_customer")
def loadLoginPage_customer():
    return render_template('Login_customer.html')

@app.route("/signup_customer")
def loadSignupPage_customer():
    return render_template('Signup_customer.html')

@app.route("/login_coffee_shop")
def loadLoginPage_coffee_shop():
    return render_template('Login_coffee_shop.html')

@app.route("/signup_coffee_shop")
def loadSignupPage_coffe_shop():
    return render_template('Signup_coffee_shop.html')

@app.route("/customer_landing")
def loadCustomerLanding():
    return render_template('customer_landing.html')

@app.route("/coffee_shop_landing")
def loadCoffeeShopLanding():
    return render_template('coffee_shop_landing.html')


# api's
@app.route("/login_api_customer", methods=['POST'])
def handleLogin_customer():
    isvalid = False
    login_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    
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
def handleSignup_customer():
    isvalid = False
    signup_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    
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
def handleLogin_coffe_shop():
    isvalid = False
    login_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    
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
def handleSignup_coffe_shop():
    isvalid = False
    signup_info = request.form

    # checking validity
    # Verbindungszeichenfolge erstellen
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    
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
        user="coffee_db_technical_user",
        password="coffeedb")
    
    cursor = conn.cursor()
    
    try:

        # password query is always executed before any other query to check validity of login information!
        sql_query = "SELECT * FROM customer_login WHERE customer_login.customer_id='"+data['username']+"' AND customer_login.customer_password='" + data['password'] + "'"
        cursor.execute(sql_query)
        result = cursor.fetchone()
        if result is None:
            return "unverified connection"


        # returning all the stats for the customer landing page
        result_dict=dict()


        # coffee shops overview
        coffee_shops_overview_query = f"select c.shop_id, c.name, c.city, r.score, round(average_rating_mat.average_score, 1) from (coffee_shops c left join ratings r  on c.shop_id = r.shop_id) left join average_rating_mat on average_rating_mat.shop_id = c.shop_id where r.customer_id = {data['username']} order by r.score desc;"
        cursor.execute(coffee_shops_overview_query)
        result_coffee_shops_overview = cursor.fetchall()
        result_dict["coffee_shops_overview"] = result_coffee_shops_overview

        # ratings
        ratings_overview_query = "select c.name, r.score from coffee_shops c join ratings r on c.shop_id = r.shop_id order by r.score desc limit 5;"
        cursor.execute(ratings_overview_query)
        result_ratings_overview = cursor.fetchall()
        result_dict["ratings_overview"] = result_ratings_overview

        # recent orders
        recent_orders_overview_query = "select o.order_id, o.order_date, cof.name  from (customers c join orders o on c.customer_id = o.customer_id) join coffee_shops cof on o.shop_id = cof.shop_id order by o.order_date desc limit 5;"
        cursor.execute(recent_orders_overview_query)
        result_recent_orders_overview = cursor.fetchall()
        result_dict["recent_orders_overview"] = result_recent_orders_overview

        conn.commit()
        cursor.close()
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
        user="coffee_db_technical_user",
        password="coffeedb")
    
    cursor = conn.cursor()
    
    try:
            ####### query has to be chaned to fit coffee shops instead of customers
            # password query is always executed before any other query to check validity of login information!
        sql_query = "SELECT * FROM shop_login WHERE shop_id="+data['username']+" AND shop_password='" + data['password'] + "'"
        cursor.execute(sql_query)
        result = cursor.fetchall()
        if result is None:
            return "unveriefied connection"
        

        # returning all the stats for the customer landing page
        result_dict=dict()


        # coffee shops overview
        coffee_types_overview_query = f"SELECT ct.coffee_type, ct.size, CASE WHEN rel.coffee_type IS NOT NULL AND rel.size IS NOT NULL THEN true ELSE false END AS is_not_null FROM coffee_types ct LEFT JOIN coffee_shops_coffee_types rel ON ct.coffee_type = rel.coffee_type AND ct.size = rel.size where rel.shop_id = {data['username']} order by rel.coffee_type;"
        cursor.execute(coffee_types_overview_query)
        result_coffee_types_overview = cursor.fetchall()
        result_dict["coffee_types_overview"] = result_coffee_types_overview

        # ratings
        ratings_overview_query = f"select c.customer_firstname || '' || c.customer_lastname as customer_name, r.score from customers c join ratings r on c.customer_id = r.customer_id where r.shop_id = {data['username']} order by r.score desc limit 5;"
        cursor.execute(ratings_overview_query)
        result_ratings_overview = cursor.fetchall()
        result_dict["ratings_overview"] = result_ratings_overview

        # recent orders
        recent_orders_overview_query = f"select o.order_id, o.order_date, c.customer_firstname || '' || c.customer_lastname as customer_name  from customers c join orders o on c.customer_id = o.customer_id where o.shop_id = {data['username']} order by o.order_date desc limit 5;"
        cursor.execute(recent_orders_overview_query)
        result_recent_orders_overview = cursor.fetchall()
        result_dict["recent_orders_overview"] = result_recent_orders_overview


        conn.commit()
        cursor.close()
        conn.close()

    ### return value here has to be changed
        return result_dict

    except:

        return "unverified connection"
    
@app.route("/rating_update_api", methods=['POST'])
def update_rating():
    data = request.form
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    cursor = conn.cursor()

    query = f"INSERT INTO ratings (customer_id, shop_id, score) VALUES ({data['customer_id']}, {data['shop_id']}, {data['score']}) ON CONFLICT (customer_id, shop_id) DO UPDATE SET score = {data['score']};"
    cursor.execute(query)

    conn.commit()
    cursor.close()
    conn.close()

    return "success"



@app.route("/sql_abfrage", methods=["POST"])
def sql():
        sql_querry =request.form["querry"]
        # Verbindungszeichenfolge erstellen
        conn = psycopg2.connect(
            host="localhost",
            database="coffee_db",
            user="coffee_db_technical_user",
            password="coffeedb")
        df = pd.read_sql_query(sql_querry, conn)
        conn.close()
        html_df=df.to_html()
        return html_df

@app.route("/sql_abfrage_tabel", methods=["POST"])
def sql_tabel():
        sql_querry =request.form["drop"]
        if sql_querry!="none":
            # Verbindungszeichenfolge erstellen
            conn = psycopg2.connect(
                host="localhost",
                database="coffee_db",
                user="coffee_db_technical_user",
                password="coffeedb")
            sql_querry=f"Select * From {sql_querry};"
            df = pd.read_sql_query(sql_querry, conn)
            conn.close()
            html_df=df.to_html()
        else:
            html_df="Please select a table"
        return html_df

@app.route("/sql_drop_req", methods=["POST"])
def sql_drop_req():
    drop_req =request.form["drop_req"]
    conn = psycopg2.connect(
        host="localhost",
        database="coffee_db",
        user="coffee_db_technical_user",
        password="coffeedb")
    
    if drop_req != "none":
        if drop_req == "AVG-Rating-Mat-view":
            sql_querry="SELECT * FROM public.average_rating_mat;"
            df = pd.read_sql_query(sql_querry, conn)
            conn.close()
            html_df=df.to_html()
        elif drop_req == "worst-rating":
            sql_querry = "SELECT * FROM public.worst_shop_ratings;"
            df = pd.read_sql_query(sql_querry, conn)
            conn.close()
            html_df=df.to_html()   
        elif drop_req == "Cross-types-shops":
            sql_querry = "SELECT * FROM coffee_shops CROSS JOIN coffee_types;"
            df = pd.read_sql_query(sql_querry, conn)
            conn.close()
            html_df=df.to_html()
    else:
        html_df="Please select a table"
        
    return html_df





    