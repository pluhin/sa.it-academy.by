import flask
from flask import request, jsonify
import sqlite3

app = flask.Flask(__name__)
app.config["DEBUG"] = True
db_name = 'userdb.db'

def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d


@app.route('/', methods=['GET'])
def home():
    return '''<h1>Rest API Mini Project</h1>
<p>A simple API project for managing user</p>'''


@app.route('/api/v1/resources/user/all', methods=['GET'])
def api_all():
    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()
    all_books = cur.execute('SELECT * FROM user;').fetchall()

    return jsonify(all_books)

@app.route('/api/v1/resources/user/add', methods=['GET', 'POST'])
def add_user():
    conn = sqlite3.connect(db_name)
    
    conn.row_factory = dict_factory
    cur = conn.cursor()
    
    query_parameters = request.args
    
    birth_date = query_parameters.get('birthdate')
    email = query_parameters.get('email')
    first_name = query_parameters.get('firstname')
    last_name = query_parameters.get('lastname')
    print(birth_date, email, first_name, last_name)
    cur.execute('INSERT INTO user (birth_date, email, first_name, last_name, permission) VALUES("' + birth_date + '" , "'+email+'"  , "'+first_name+'"  , "'+last_name+'" , 0);')
    conn.commit()
    return "Add successful!"
    
@app.route('/api/v1/resources/user/grant', methods=['GET', 'PUT'])
def grant_permission():
    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()
    
    query_parameters = request.args
    
    id = query_parameters.get('id')
    
    cur.execute('UPDATE user SET permission = 1 WHERE id = '+id+';')
    conn.commit()
    return 'User permission granted!'

@app.route('/api/v1/resources/user/revoke', methods=['GET', 'PUT'])
def revoke_permission():
    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()
    
    query_parameters = request.args
    
    id = query_parameters.get('id')
    
    cur.execute('UPDATE user SET permission = 0 WHERE id = '+id+';')
    conn.commit()
    return 'User permission revoked!'

@app.errorhandler(404)
def page_not_found(e):
    return "<h1>404</h1><p>The resource could not be found.</p>", 404


@app.route('/api/v1/resources/user', methods=['GET'])
def api_filter():
    query_parameters = request.args

    id = query_parameters.get('id')
    
    query = "SELECT * FROM user WHERE"
    to_filter = []

    if id:
        query += ' id=? AND'
        to_filter.append(id)
    
    if not (id):
        return page_not_found(404)

    query = query[:-4] + ';'

    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()

    results = cur.execute(query, to_filter).fetchall()
    
    return jsonify(results)

@app.route('/api/v1/resources/user/remove', methods=['GET', 'PUT'])
def remove_user():
    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()
    
    query_parameters = request.args
    
    id = query_parameters.get('id')
    
    cur.execute('DELETE FROM user WHERE id = '+id+';')
    conn.commit()
    return 'User removed!'

@app.route('/api/v1/resources/user/search', methods=['GET', 'PUT'])
def search_user_by_last_name():
    conn = sqlite3.connect(db_name)
    conn.row_factory = dict_factory
    cur = conn.cursor()
    
    query_parameters = request.args
    
    last_name = query_parameters.get('lastname')
    rows = cur.execute('SELECT * FROM user WHERE last_name = "'+last_name+'";')
    result = []
    for row in rows:
        result.append(row)
    return jsonify(result)

app.run(host='0.0.0.0')
