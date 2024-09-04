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
import java.sql.ResultSet;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    String login = request.getParameter("login");
		    String pass = request.getParameter("password");

		    String url = "jdbc:mysql://localhost:3306/project_jee";
		    String user = "root";
		    String password = "untm";
		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver"); 
		        Connection con = DriverManager.getConnection(url, user, password);
		        PreparedStatement psd = con.prepareStatement("SELECT id FROM user WHERE login=? AND password=?"); 
		        psd.setString(1, login);
		        psd.setString(2, pass); 
		        ResultSet rs = psd.executeQuery(); 
		        
		        rs.close();
		        psd.close();
		        con.close();
		    } catch (Exception e) {
		        System.out.print(e);
		         
		    }
	}

}
