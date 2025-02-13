/* IMPORTS  */
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.File;
import java.sql.*;

/* MÉTODOS: */

static class Funciones{

	//ATRIBUTOS
	private Statement statement = null;
	private ResultSet resultado = null;

	//CONSTRUCTOR
	public Funciones(){}

	//CONEXIONPUFO
	public Connection conexionPufo(){
        Connection con = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/pufosa", "root", "");
			System.out.println("DEBUG: CONECTADO CON LA BD"); //DEBUG
        } catch (SQLException e) {
			System.err.println("DEBUG: NO SE HA PODIDO ESTABLECER LA CONEXIÓN");
            throw new RuntimeException(e); //DEBUG
        }
        try {
			// Cargar el driver de MariaDB
			Class.forName("com.mysql.cj.jdbc.Driver");
			// Establecer la conexión
		} catch (Exception e){
			System.err.println("ERROR: NO SE HA PODIDO CARGAR EL DRIVER"); //DEBUG
			e.printStackTrace(); //DEBUG
		}
		return con;
	}


	//METODO CONSULTA FACIL

	/*
	* Como en el examen no se especifica si el metodo puede o no mostrar por pantalla a pesar de retornar el result set
	* he añadido la funcionalidad de mostrarlo directamente en el metodo para mostrar por pantalla como se pide
	* el propio resultset ya que no puedo mostrarlo desde el main porque se cierra
	*
	* */

		public ResultSet consultaFacil(Connection con){
	            //Query
	            try {
	                // Crear el Statement para ejecutar la consulta
	                statement = con.createStatement();
	                // Ejecutar la consulta
	                resultado = statement.executeQuery("select nombre, apellido from empleados where comision > 50;");
					System.out.println("DEBUG: CONSULTA REALIZADA CON EXITO"); //DEBUG
					System.out.println("\nResultados de la consulta facil:\n");
					while (resultado.next()) {
						String nombre = resultado.getString("nombre");
						String apellido = resultado.getString("apellido");
						System.out.println( "Nombre: " + nombre + ", Apellido: " + apellido);
					}
	            } catch (SQLException e) {
	                System.err.println("DEBUG: ERROR AL EJECUTAR EL STATEMENT "); //DEBUG
	                e.printStackTrace(); //DEBUG
	            }

				// Cerrar la conexión
				if (con != null) {
					try {
						con.close();
						System.out.println("DEBUG: Conexión cerrada."); //DEBUG
					} catch (SQLException e) {
						e.printStackTrace(); //DEBUG
					}
				}
				return resultado;
	        }


	//METODO CONSULTA CHUNGA
	public void consultaChunga(Connection con){
		//Query
		try {
			// Crear el Statement para ejecutar la consulta
			statement = con.createStatement();
			// Ejecutar la consulta
			resultado = statement.executeQuery("SELECT empleados.Nombre, empleados.Apellido\n" +
					"FROM empleados, departamento, ubicacion\n" +
					"WHERE empleados.Departamento_ID = departamento.departamento_ID AND departamento.Ubicacion_ID = ubicacion.Ubicacion_ID AND empleados.Comision > 0\n" +
					"GROUP BY ubicacion.GrupoRegional = 'NEW YORK'");
			System.out.println("DEBUG: CONSULTA REALIZADA CON EXITO"); //DEBUG
			// Procesar los resultados
			System.out.println("\nResultados de la consulta chunga:\n");
			while (resultado.next()) {
				String nombre = resultado.getString("nombre");
				String apellido = resultado.getString("apellido");
				System.out.println( "Nombre: " + nombre + ", Apellido: " + apellido);
			}
			System.out.println("\n\n\n");
		} catch (SQLException e) {
			System.err.println("DEBUG: ERROR AL EJECUTAR EL STATEMENT "); //DEBUG
			e.printStackTrace(); //DEBUG
		}

		// Cerrar la conexión
		if (con != null) {
			try {
				con.close();
				System.out.println("DEBUG: Conexión cerrada."); //DEBUG
			} catch (SQLException e) {
				e.printStackTrace(); //DEBUG
			}
		}
	}


	public String consultaXML(String xPathExpression){
			String res = "";
			try {
				// Carga del documento xml
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document documento = builder.parse(new File("bookstore.xml"));
				// Preparacion de xpath
				XPath xpath = XPathFactory.newInstance().newXPath();
				// Consultas
				NodeList nodos = (NodeList) xpath.evaluate(xPathExpression, documento, XPathConstants.NODESET);
				for (int i = 0; i < nodos.getLength(); i++) {
					res = nodos.item(i).getNodeName() + " : " + nodos.item(i).getTextContent();
				}
			} catch(Exception e){
				System.err.println("DEBUG: ERROR AL HACER LA CONSULTA XPATH"); //DEBUG
				res = "ERROR DE CONSULTA";
			}
			return res;
	}

}


	/* MÉTODO MAIN:  */

	public static void main(String[] args) throws SQLException {
		//La clase con las funciones --> NOTA: PODÍA HABERLO HECHO ESTÁTICO PERO ERA MÁS SENCILLO ASÍ
		Funciones f = new Funciones();

		//Conecto con la bd
		Connection con = f.conexionPufo();
		//consulta facil
		f.consultaFacil(con);


		/*nota: como no es estático no puedo manejar
		la variable de conexión como me gustaría
		por lo que tengo que reabrir la conexión para poder hacer la consulta chunga*/
		con = f.conexionPufo();
		//consulta chunga
		f.consultaChunga(con);

		/*
		* La consulta al XPath está mal pero de ser correcta, por la estructura
		* de los métodos, lo haría de la siguiente manera:
		*
		* 	// La expresion xpath de busqueda
		*	String xPathExpression1 = "//catalog/books/title";
		*	System.out.println(f.consultaXML(xPathExpression1));
		*
		* */

		/*
		 * La segunda consulta al XPath tampoco sé como hacerla pero de saber hacerla, por la estructura
		 * de los métodos, lo haría de la siguiente manera:
		 *
		 * 	// La expresion xpath de busqueda
		 *	String xPathExpression2 = "libros que ha publicado James Linn";
		 *	System.out.println(f.consultaXML(xPathExpression2));
		 *
		 *
		 * */



	}

/* FIN  */