from flask import Flask

api = Flask(__name__)

@api.route('/')
def message():
    return 'Test API operational!\nUsing Docker!\n'

if __name__ == '__main__':
    api.run(host='0.0.0.0', port=80, debug=True)