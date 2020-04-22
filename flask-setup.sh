#!/bin/bash

mkdir $1
cd $1
python3 -m venv venv
source venv/bin/activate
echo "Success"
pip install --upgrade pip
pip install flask
mkdir app
cd app
touch __init__.py
echo -e "from flask import Flask\n\napp = Flask(__name__)\n\nfrom app import routes" >> __init__.py
touch routes.py
echo -e "from app import app\n\n@app.route('/')\n@app.route('/index')\ndef index():\n  return 'Hello world'" >> routes.py
cd ..
touch $1.py
echo -e "from app import app" >> $1.py
pip install python-dotenv
touch .flaskenv
echo "FLASK_APP=$1.py" >> .flaskenv
touch .env
pip freeze > requirements.txt
git init
touch .gitignore
echo -e ".env\n.flaskenv\nvenv/" >> .gitignore
touch README.md
git add .
git commit -m "First commit"
