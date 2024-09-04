<%@ page language="java" %>
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
    <title>Insert title here</title>
</head>
<body>
<div align="right">
    <h4>Bonjour <%=login %></h4>
    <br>
    <a href="logout">Logout</a>
</div>
<H1>Ajouter un étudiant</H1>

<form method="POST" action="ajouter">
    <table border="1">
        <tr>
            <td>Nom</td>
            <td><input type="text" name="nom" required></td>
        </tr>
        <tr>
            <td>Date d'inscription</td>
            <td><input type="date" name="date" required></td>
        </tr>
        <tr>
            <td>Sexe</td>
            <td>
                <input type="radio" name="sexe" value="femme" checked>Femme
                <input type="radio" name="sexe" value="homme">Homme
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Ajouter">
                <input type="reset" value="Annuler">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
