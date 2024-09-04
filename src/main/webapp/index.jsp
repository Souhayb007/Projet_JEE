<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
String login = "";
if(session.getAttribute("login") != null) {
    login = session.getAttribute("login").toString();	
} else {
    response.sendRedirect("authentication.jsp");	
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home page</title>
</head>
<body>
<div align="right">
    <h4>Bonjour <%=login %></h4>
    <br>
    <a href="logout">Logout</a>
</div>
<H1>Liste des étudiants</H1>
<table border="1" width="100%">
    <tr>
        <th>id</th>
        <th>nom</th>
        <th>date d'inscription</th>
        <th>sexe</th>
        <th>Action</th>
    </tr>
    <%
    String url = "jdbc:mysql://localhost:3306/project_jee";
    String user = "root";
    String password = "untm";
    int numbre = 0;
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        PreparedStatement psd = con.prepareStatement("SELECT * FROM etudiant");
        ResultSet rs = psd.executeQuery(); 
        while(rs.next()){
    %>
        <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><a href="Delete?id=<%=rs.getString(1)%>">Supprimer</a></td>
        </tr>
    <%
        }
        psd = con.prepareStatement("SELECT count(*) FROM etudiant");
        rs = psd.executeQuery();
        rs.next();
        numbre = rs.getInt(1);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    %>
</table>
Nombre des étudiants : <%=numbre %><br>
<a href="ajouter.jsp">Ajouter un étudiant</a>
</body>
</html>
