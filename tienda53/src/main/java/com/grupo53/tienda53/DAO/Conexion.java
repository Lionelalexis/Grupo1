package com.grupo53.tienda53.DAO;

import java.sql.*;
import java.text.SimpleDateFormat;

/**
 * Clase que permite conectar con la base de datos
 * 
 *
 */
public class Conexion {
	/**
	 * Parametros de conexion, la ip 127.0.0.1 es mi maquina= localhost aca aws se
	 * debe cambiar por la ip de aws
	 */
	static String nombre_base_datos = "tienda53grupo1";
	static String usuariobd = "root";
	static String clavebd = "mintic";
	static String url = "jdbc:mysql://127.0.0.1/" + nombre_base_datos;
	// static String nombre_base_datos = "g53e1";
	// static String usuariobd = "admin";
	// static String clavebd = "minticroca";
	// static String url =
	// "jdbc:mariadb://tiendasgenericasdr-g9-g38-53.czo3ixoe3xoe.us-east-1.rds.amazonaws.com/"
	// + nombre_base_datos;

	// objeto sin inicializar de la conexión
	Connection connection = null;

	/** Constructor de DbConnection */
	public Conexion() {
		try {
			// obtenemos el driver de para mysql
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Class.forName("org.mariadb.jdbc.Driver");

			// obtenemos la conexión
			connection = DriverManager.getConnection(url, usuariobd, clavebd);

			// si hay conexión correcta mostrar información en consola
			if (connection != null) {

				System.out.println("------------------------------------------------------");
				System.out.println("Conexión a base de datos " + nombre_base_datos + " OK");
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
				Date date = new Date(System.currentTimeMillis());
				System.out.println(formatter.format(date));
				System.out.println(url);
				System.out.println("------------------------------------------------------");
			}

		} catch (SQLException e) {
			// error de la base de datos
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			// error en carga de clases
			System.out.println(e);
		} catch (Exception e) {
			// cualquier otro error
			System.out.println(e);
		}
	}

	/** Permite retornar la conexión */
	public Connection getConnection() {
		return connection;
	}

	// cerrando la conexión
	public void desconectar() {
		connection = null;
	}
}
