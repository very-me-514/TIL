# server.py

from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    # 응답 파트
    return "<p>Hello, World!</p>"




@app.route("/qwer") # URL
def about():
    # 응답 파트
    return "<p>HAHA</p>"




if __name__ == '__main__':
    app.run(port=3000, debug=True)