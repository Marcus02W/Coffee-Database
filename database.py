from flask import Flask, url_for, render_template, request
import psycopg2
import pandas as pd
app = Flask(__name__,template_folder="templateFiles",static_folder="staticFiles")

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/sql_abfrage", methods=["POST"])
def sql():
    if request.method =='POST':
        sql_querry =request.form['sql-querry']
        # Verbindungszeichenfolge erstellen
        conn = psycopg2.connect(
            host="127.0.0.1",
            database="Coffee_Database",
            user="postgres",
            password="postgres")
        df = pd.read_sql_query(sql_querry, conn)
        conn.close()
        html_df=df.to_html()
    return html_df

if __name__ == '__main__':
    app.run(port=1337,debug=True) 