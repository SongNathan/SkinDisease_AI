from flask import Flask
import flask_restful as flask_restful
from flask_restful import Api
from test import Test

app = Flask(__name__)
api = Api(app)

api.add_resource(Test, '/test')

if __name__ == '__main__':
    app.run('0.0.0.0', port = 8080, debug = True)