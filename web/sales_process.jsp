<%-- 
    Document   : sales_process
    Created on : 12 Mar, 2020, 11:42:59 AM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <title>Sale</title>
    </head>
    <script type='text/javascript'>
        var t = localStorage.getItem('row-count') - 1;
        console.log(t);
    </script>
    <body>
        <nav class="navbar navbar-light" style="background-color: #3CB371; border-radius: 5px;">
            <span class="navbar-text">
                <h3>Pharmacy Management System</h3>
            </span>
        </nav>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #3CB371">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.html">
                            <h5>Home</h5> <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="About.html">
                            <h5>Dashboard</h5>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">
                            <h5>Medicines</h5>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">
                            <h5>Sales</h5>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
            String cust_name = request.getParameter("custname");
            String cust_num = request.getParameter("custnum");
            String total_medi=request.getParameter("hidf");
            int t=Integer.parseInt(total_medi)-1;          
            String mname[] = request.getParameterValues("some");
            String mqty[] = request.getParameterValues("mqty");
            String x=request.getParameter("mess");
            System.out.println(cust_name);
            System.out.println(cust_num);
            System.out.println(t);
            out.println(cust_name);
            out.println(cust_num);
            out.println(t);
            int l=Integer.parseInt(total_medi)-1;
            /*for(int p=0;p<l;p++)
            {
                System.out.println(mname[p]);
                System.out.println(mqty[p]);
            }*/
         %>
    </body>
</html>
