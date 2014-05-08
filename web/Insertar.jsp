<%-- 
    Document   : Insertar
    Created on : 8/05/2014, 04:25:45 PM
    Author     : Administrador
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%

if(request.getParameter("GRABAR") != null)

{

// objetos de enlace

Connection canal = null;
ResultSet tabla= null;
Statement instruccion=null;



// abriendo canal o enlace en su propio try-catch

try {

Class.forName("com.mysql.jdbc.Driver").newInstance();
canal=DriverManager.getConnection("jdbc:odbc:dsnmibase");
instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

//cargando los campos a grabar

// excepto clave porque en mysql es de tipo auto-increment
int clave = Integer.parseInt(request.getParameter("CLAVE"));

String nombre = request.getParameter("NOMBRE");

int edad = Integer.parseInt(request.getParameter("EDAD"));



// insert into tabla(nombre,edad,estatura) values('juan', 15, 1.88);

String q="insert into mitabla(clave,nombre,edad) values(\"" +clave+"\","+nombre+"\","+edad+")";

try {

// agregando renglon (insert)

int n=instruccion.executeUpdate(q);

//avisando que se hizo la instruccion

out.println("REGISTRO INSERTADO");

} catch(SQLException e) {out.println(e);};

try{

// tabla.close();

instruccion.close();

canal.close();

} catch(SQLException e) {out.println(e);};

};

// construyendo forma dinamica

out.println("<FORM ACTION=Insertar.jsp METHOD=post>");

out.println("CLAVE :<INPUT TYPE=TEXT NAME=CLAVE><BR>");

out.println("NOMBRE :<INPUT TYPE=TEXT NAME=NOMBRE><BR>");

out.println("EDAD :<INPUT TYPE=TEXT NAME=EDAD><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=GRABAR VALUE=INSERTAR ><BR>");

out.println("</FORM>");

%>