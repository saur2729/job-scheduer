from flask import Flask
from flask_cors import CORS
from pymongo import MongoClient

app = Flask(__name__)
app.debug = True
CORS(app)

client = MongoClient('localhost', 27017)  # Connect to mongodb

@app.route("/")
def home_page():
  my_str = "This is my first list of all DBs Ashu - \n"
  dbs = client.list_database_names()
  for db in dbs:
    my_str += db + "\n"
  return my_str
