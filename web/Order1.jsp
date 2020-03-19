<%-- 
    Document   : Order
    Created on : 17 Mar, 2020, 12:30:47 PM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.servlet.http.HttpSession,java.lang.Math" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ORDER</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
                        <a class="nav-link" href="welcome.jsp">
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
        <%
            response.setHeader("Cache-Control", "no-cache,no store,must revalidate");
            String[] medi = request.getParameterValues("medicinesnames");
            String[] updates = request.getParameterValues("update");
            String[] mequant = request.getParameterValues("mquant");
            String[] custname = request.getParameterValues("cust_name");
            String[] custnum = request.getParameterValues("cust_num");
            String[] l = request.getParameterValues("length");
            String[] tot = request.getParameterValues("bill");
            
            double sqrt = Math.sqrt(medi.length);
            int sq = (int) sqrt;
            System.out.println("MEDI LENGTH IS " + medi.length);
            System.out.println("UPDATES LENGTH IS " + updates.length);
            System.out.println("MEQUANT LENGTH IS " + mequant.length);
            System.out.println("CUST_NAME LENGTH IS " + custname.length);
            System.out.println("CUST_NUM LENGTH IS " + custnum.length);
            System.out.println("LENGTH IS " + sq);

            System.out.println("MEDI----");
            for (String r : medi) {
                System.out.println(r);
            }
            System.out.println("UPDATES----");
            for (String r : updates) {
                System.out.println(r);
            }
            System.out.println("MEQUANT----");
            for (String r : mequant) {
                System.out.println(r);
            }
            System.out.println("CUSTNAME----");
            for (String r : custname) {
                System.out.println(r);
            }
            System.out.println("CUSTNUM----");
            for (String r : custnum) {
                System.out.println(r);
            }
            System.out.println("L----");
            for (String r : l) {
                System.out.println(r);
            }

            int i, j, orderID = 0;
            orderID++;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
            Connection con1 = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
            for (i = 0; i < sq; i++) {
                System.out.println(medi[i]);
                System.out.println(Integer.parseInt(updates[i]));
                int z = Integer.parseInt(updates[i]);
                PreparedStatement st1 = con.prepareStatement("update medicines set M_quantity=? where M_name=? ");
                if (z >= 0) {
                    st1.setInt(1, z);
                } else {
                    st1.setInt(1, 0);
                }
                st1.setString(2, medi[i]);
                int rs1 = st1.executeUpdate();
            }
        %>
        <div class="alert alert-success" role="alert">
            <%    orderID++;

                PreparedStatement st1 = con1.prepareStatement("insert into ordetais(Cust_Name,Cust_Num,Order_ID,Medi_Name,Quantity, Medi_cost, Bill_Amount) values(?, ?, ?, ?, ?,?,?)");
                st1.setString(1, custname[0]);
                st1.setString(2, custnum[0]);
                st1.setInt(7, Integer.parseInt(tot[0]));
                //to be continuued
                int count = st1.executeUpdate();
                con.close();%>
            Your Order is Placed !!! Order ID is <%=orderID%>

        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
        </script>
    </body>
</html>

