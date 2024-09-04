package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null) {
			String id = request.getParameter("id");
			
			String url = "jdbc:mysql://localhost:3306/project_jee";
		    String user = "root";
		    String password = "untm";
		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver"); // Correct driver class name
		        Connection con = DriverManager.getConnection(url, user, password);
		        PreparedStatement psd = con.prepareStatement("delete from etudiant where id=?");
		        psd.setString(1, id);
		        psd.executeUpdate(); 
		        
		        response.sendRedirect("index.jsp");
		        psd.close();
		        con.close();
		    } catch (Exception e) {
		        System.out.print(e);
		         
		    }
		}
		else {
			response.sendRedirect("authentification.jsp");
		}
	}

	

}
