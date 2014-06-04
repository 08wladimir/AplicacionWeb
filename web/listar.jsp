

<%@ page import="java.io.*,java.util.*,java.net.*,java.sql.*" %>


<%
Connection conexionbd = null;
ResultSet tablaresultados= null;
Statement instruccion=null;


try {
 
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;
  conexionbd = DriverManager.getConnection("jdbc:odbc:dsnmibase");
  instruccion = conexionbd.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

} catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {};

String q="select * from mitabla";
try { tablaresultados = instruccion.executeQuery(q);

out.println("<CENTER><TABLE Border=1 CellPadding=1><TR>");

out.println("<th bgcolor=Green>Clave</th><th bgcolor=White>Nombre</th><th bgcolor=Red>Edad</th></TR>");

while(tablaresultados.next()) {
out.println("<TR>");
out.println("<TD>"+tablaresultados.getString(1)+"</TD>");
out.println("<TD>"+tablaresultados.getString(2)+"</TD>");
out.println("<TD>"+tablaresultados.getString(3)+"</TD>");
out.println("</TR>"); }; // fin while
out.println("</TABLE></DIV></CENTER></HTML>");
} //fin try no usar ; al final de dos o mas catchs

catch(SQLException e) {};

try {tablaresultados.close();instruccion.close();conexionbd.close();} catch(SQLException e) {};




%>


<a href="Opciones.jsp">volver</a>
