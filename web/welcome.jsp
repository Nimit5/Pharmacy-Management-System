<%-- 
    Document   : welcome
    Created on : 5 Mar, 2020, 12:42:56 PM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <%

        /*if(session.getAttribute("uname") == null || session.getAttribute("pass") == null) {
            response.sendRedirect("login.jsp");
        }
*/
    %>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="index.css">

    </head>

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
                        <a class="nav-link" href="Medi_Details.jsp">
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
        <div style="margin-left: 135px; margin-top: 25px;">
            <h4>DASHBOARD</h4>
        </div>
        <div style="background-color:#3CB371 ; margin: 10px 75px; margin-top: 20px;  padding: 10px; padding-left: 100px; width: 300px; color: red;">
            <a href="Add_Medi.jsp" style="text-decoration: none; color: black; ">Add Medicines</a>
        </div>
        <div style="background-color:#3CB371 ; margin: 10px 75px; padding: 10px; padding-left: 100px; width: 300px; color: black;">
            <a href="Add_Sales1.jsp" style="text-decoration: none; color: black; " >Add Sales</a>
        </div>
        <div style="background-color:#3CB371; margin: 10px 75px; padding: 10px; padding-left: 100px; width: 300px; color: black;">
            <a href="Medi_Details.jsp" style="text-decoration: none; color: black; " >Medicines Details</a>
        </div>
        <div style="background-color:#3CB371 ; margin: 10px 75px; padding: 10px; padding-left: 100px; width: 300px; color: black; ">
            <a href="Add_Medi.jsp" style="text-decoration: none; color: black; " >Sales Details</a>
        </div>
    </body>
</html>