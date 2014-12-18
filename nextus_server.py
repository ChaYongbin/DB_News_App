# -*- coding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
from flask import Flask
from flaskext.mysql import MySQL
from bson import json_util
from flask import request, session
from flask_login import LoginManager, login_user, UserMixin, make_secure_token
from itsdangerous import URLSafeTimedSerializer
import datetime
import time
import json


app = Flask(__name__)

login_manager = LoginManager()
mysql = MySQL()
login_serializer = URLSafeTimedSerializer(app.secret_key)
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'next!!@@##$$'
app.config['MYSQL_DATABASE_DB'] = 'newsdb'

login_manager.init_app(app)
mysql.init_app(app)

def connectDB():
	cursor = mysql.connect().cursor();
	return cursor;

#Flask FrameWork - User Class Create
class User(UserMixin):
	def __init__(self, email, password):
		self.email = email.encode('utf8')
		self.password = password
		
		if email == "":
			self.anonymous = True
		else:
			self.anonymous = False
		self.active = False
		self.authenticate = False
		self.loginDate = datetime.datetime.utcnow()

	def is_active(self):
		return self.active
	def is_authenticated(self):
		return self.authenticate
	def is_anonymous(self):
		return self.anonymous
	def get_id(self):
		return self.email
	def get_auth_token(self):
		userToken = [self.email,self.password]
		data = login_serializer.dumps(userToken)
		return data

	@staticmethod
	def getUserFromDB(cursor,email):
		cursor.execute("select * from USER where email='"+email+"'")
		data = cursor.fetchone()
		if data != None:
			user = User(email,data[1]);
			user.active = True
			user.authenticate = True
			user.anonymous = False
			return user
		else:
			return None

#Loading email of user data
@login_manager.user_loader
def load_user(email):
	cursor = connectDB();
	return User.getUserFromDB(cursor,email);

#Server Test 'Hello World'
@app.route('/helloworld')
def HelloWorld():
	print('HelloWorld!')
	return 'HelloWorld!'

#Server Client Connect Test
@app.route('/connectTest', methods=['POST'])
def Connect_Test():
	test_id = request.form['test_id']

	if test_id != None:
		return 'Success Connect Server'
	return 'Fail Connect Server'

#News Data Get and Push
@app.route('/news', methods=['GET','POST'])
def news():
	cursor = connectDB()
	cursor.execute('SELECT title, img_path, contents, time, user_email FROM article;')

	result = []

	colums = tuple(d[0] for d in cursor.description)

	for row in cursor:
		result.append(dict(zip(colums, row)))

	print(result)

	if result != None:
		return json.dumps(result, default=json_util.default)
	return 'Get Error'


@app.route('/news/comment', methods=['GET','POST'])
def comment():
	cursor = connectDB()
	cursor.execute('SELECT article_id, contents, user_email FROM comment;')

	result = []

	colums = tuple(d[0] for d in cursor.description)

	for row in cursor:
		result.append(dict(zip(colums, row)))

	print(result)

	if result != None:
		return json.dumps(result)
	return 'Get comment Error'


@app.route("/upload", methods=["GET", "POST"])
def upload():
	title = request.form['title']
	img_path = request.form['img_path']
	contents = request.form['contents']
	user_email = request.form['user_email']

	con = mysql.connect()
	cursor = con.cursor()
	cursor.execute("INSERT INTO article (title, img_path, contents, user_email) VALUES ('" + title + "','" + img_path + "', '" + contents + "', '" + user_email + "' );")
	con.commit()
	return 'Success'


@app.route("/upload/comment", methods=["GET", "POST"])
def comment_upload():
	article_id = request.form['article_id']
	contents = request.form['contents']
	user_email = request.form['user_email']

	con = mysql.connect()
	cursor = con.cursor()
	cursor.execute("INSERT INTO article (article_id, contents, user_email) VALUES ('" + article_id + "', '" + contents + "', '" + user_email + "' );")
	con.commit()
	return 'Success'


@app.route("/test", methods=["GET", "POST"])
def test():
	return "test load!!";


if __name__ == "__main__":
	app.run(debug=True, host='10.73.45.55', port=5000);
