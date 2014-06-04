<%-- 
    Document   : listar
    Created on : 30/04/2014, 04:45:13 PM
    Author     : Administrador
--%>

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>

<%
Connection conexionbd = null;
ResultSet tablaresultados= null;
Statement instruccion=null;

if(request.getParameter("OK") != null)
{
try {
 
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;
  conexionbd = DriverManager.getConnection("jdbc:odbc:dsnmibase");
  instruccion = conexionbd.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

// preparando condicion de busqueda

int clave = Integer.parseInt(request.getParameter("CLAVEB"));

// construyendo select con condicion

String q="select * from mitabla where clave="+clave;

// mandando el sql a la base de datos

try { tablaresultados = instruccion.executeQuery(q);

// mandando resultset a tabla html

out.println("<TABLE Border=1 CellPadding=1><TR>");

out.println("<th bgcolor=Red>CLAVE</th><th bgcolor=Red>NOMBRE</th><th bgcolor=Red>EDAD</th></TR>");

while(tablaresultados.next()) {

out.println("<TR>");

out.println("<TD>"+tablaresultados.getString(1)+"</TD>");

out.println("<TD>"+tablaresultados.getString(2)+"</TD>");

out.println("<TD>"+tablaresultados.getString(3)+"</TD>");

out.println("</TR>"); }; // fin while

out.println("</TABLE></CENTER></DIV></HTML>");

} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tablaresultados.close();instruccion.close();conexionbd.close();} catch(SQLException e) {};

};

// construyendo forma dinamica

out.println("<FORM ACTION=consultar.jsp METHOD=post>");

out.println("CLAVE BUSCAR:<INPUT TYPE=TEXT NAME=CLAVEB><BR>");

out.println("<INPUT TYPE=SUBMIT NAME=OK VALUE=BUSCAR><BR>");

out.println("</FORM>");

%>

<a href="Opciones.jsp">volver</a>