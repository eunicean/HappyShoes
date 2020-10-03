from flask import Flask,jsonify,request,render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'zapateriahappyshoes'
mysql = MySQL(app)

@app.route('/')
def login():
	return render_template('layout.html',name="Juan")

@app.route('/usuario/listar')
def usuario_listar():
	cur = mysql.connection.cursor()
	cur.execute("call listar_usuarios()")
	respuesta = cur.fetchall()
	print (respuesta)
	cur.close()
	return jsonify(respuesta)

@app.route('/sucursal/listar')
def sucursal_listar():
	cur = mysql.connection.cursor()
	cur.execute("call listar_sucursales()")
	respuesta = cur.fetchall()
	print (respuesta)
	cur.close()
	return render_template('sucursal/listar.html',data=respuesta)

@app.route('/sucursal/insertar', methods = ['GET', 'POST'])
def user():
    if request.method == 'GET':
        """return the information for <user_id>"""
        return render_template('sucursal/insertar.html')
    if request.method == 'POST':
        """modify/update the information for <user_id>"""
        # you can use <user_id>, which is a str but could
        # changed to be int or whatever you want, along
        # with your lxml knowledge to make the required
        # changes
        data = request.form # a multidict containing POST data
        tipo = (data.get("tipo"))
        locacion = (data.get("locacion"))
        fecha = (data.get("fecha"))
        cod_gerente = (data.get("cod_gerente"))
        try:
        	cadena = "call crear_sucursal ('"+tipo+"','"+locacion+"','"+fecha+"',"+cod_gerente+")"
        	print(cadena)
        	cur = mysql.connection.cursor()
        	cur.execute(cadena)
        	mysql.connection.commit()
        	cur.close() 
        except Exception as e:
        	print("Problema: "+str(e))
        return data


@app.route('/empleado/listar')
def empleado_listar():
	cur = mysql.connection.cursor()
	cur.execute("call listar_personal()")
	respuesta = cur.fetchall()
	print (respuesta)
	cur.close()
	return render_template('/personal/listar.html',data=respuesta)



if __name__ == '__main__':
    app.run()