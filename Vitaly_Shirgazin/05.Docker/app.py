import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>Hi! I'm python app</h1><p>I have a good news for you - I'm Working</p>"

app.run()
