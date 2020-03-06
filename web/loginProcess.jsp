<%-- 
    Document   : loginProcess
    Created on : 4 Mar, 2020, 5:24:24 PM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <%
         String uname = request.getParameter("un"); 
         String pass = request.getParameter("ps"); 
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy","root","Nimit@051099");
         PreparedStatement st=con.prepareStatement("select * from login where username=? and pass=?");
         st.setString(1,uname);
         st.setString(2,pass);
         ResultSet rs = st.executeQuery();
         if(rs.next())
            {
                HttpSession hs = request.getSession();
                hs.setAttribute(uname, "uname");
                hs.setAttribute(pass, "pass");
                response.sendRedirect("welcome.jsp");
            }
         else
         {
         response.sendRedirect("login.jsp");
         }
         %>
    </body>
</html>
