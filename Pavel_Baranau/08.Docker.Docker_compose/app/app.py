from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

users = {
    "user1": "password1",
    "user2": "password2"
}

@app.route('/')
def login_form():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    if username in users and users[username] == password:
        if username == "user1":
            return redirect(url_for('user1_home'))
        elif username == "user2":
            return redirect(url_for('user2_home'))
    else:
        return 'Invalid login or password. Try again.'

@app.route('/admin_panel')
def user1_home():
    return 'Welcome, Admin. You are in the Admin Panel'

@app.route('/user_home')
def user2_home():
    return 'Welcome, User 2. You are on User Page 2.'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
