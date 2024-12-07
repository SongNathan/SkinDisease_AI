from flask import Flask
import flask_restful as flask_restful
from flask_restful import Api
from test import Test

app = Flask(__name__)
api = Api(app)

# '/test' 경로에 Test 리소스 추가
api.add_resource(Test, '/test')

# app.run() 호출 제거 (PythonAnywhere에서 WSGI로 실행되므로)
if __name__ == '__main__':
    app.run(debug=True)
