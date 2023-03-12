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
        password="placeholder")
    
    try:
        sql_query = "SELECT * FROM customer_login WHERE customer_login.customer_id='"+login_info['username']+"' AND customer_login.customer_password='" + login_info['password'] + "'"
        login_data = pd.read_sql_query(sql_query, conn)
        isvalid=True

    except:
        isvalid=False

    conn.close()

    if isvalid:
        return login_info
    else:
        return "failed"
    