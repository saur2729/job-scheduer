from flask import Flask
from flask_cors import CORS
from pymongo import MongoClient

app = Flask(__name__)
app.debug = True
CORS(app)

client = MongoClient('localhost', 27017)  # Connect to mongodb


@app.route("/")
def home_page():
  return "Welcome to Home page"

@app.route("/db")
def db_page():
  db_list = []
  dbs = client.list_database_names()
  for db in dbs:
    db_list.append(db)
  print(db_list)
  return {"strr" : db_list}
