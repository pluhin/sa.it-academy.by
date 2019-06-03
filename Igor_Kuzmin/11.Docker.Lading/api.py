from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class HelloDocker(Resource):
    def get(self):
        return {'Hello': 'Docker'}

api.add_resource(HelloDocker, '/')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)
	
