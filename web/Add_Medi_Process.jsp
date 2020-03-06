<%-- 
    Document   : Add_Medi_Process
    Created on : 6 Mar, 2020, 8:00:03 AM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         String Mname = request.getParameter("Mn"); 
         String Mtype = request.getParameter("Mt"); 
         String Mcomp = request.getParameter("Mcom"); 
         int Mcost= Integer.parseInt(request.getParameter("Mcos"));
         int Mqty= Integer.parseInt(request.getParameter("Mq"));
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy","root","Nimit@051099");   
         PreparedStatement st=con.prepareStatement("insert into medicines (M_name, M_type, M_company, M_cost, M_quantity)"
        + " values (?, ?, ?, ?, ?)");
         st.setString(1,Mname);
         st.setString(2,Mtype);
         st.setString(3,Mcomp);
         st.setInt(4,Mcost);
         st.setInt(5,Mqty);
         int count = st.executeUpdate();
         response.sendRedirect("welcome.jsp");
        %>
        
    </body>
</html>
