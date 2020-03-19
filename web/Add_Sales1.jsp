<%-- 
    Document   : Sales_process1
    Created on : 17 Mar, 2020, 7:14:59 AM
    Author     : jainn
--%>

<%-- 
    Document   : Medi_Details
    Created on : 6 Mar, 2020, 9:12:05 AM
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
        <title>MEDICINES DETAILS</title>


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
                            <h5>About</h5>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">
                            <h5>Contact</h5>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">
                            <h5>Login</h5>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <form action="Sales_Process1.jsp" method="post">
            <table class="table table-bordered table-dark">
                <thead>

                <div style="border: 3px solid black; padding: 15px; margin: 5px; border-radius: 5px;">  

                    <div class="form-group">
                        <label for="exampleFormControlInput1">Customer Name</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Customer Name" name="custname">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput2">Customer Contact Number</label>
                        <input type="text" class="form-control" id="exampleFormControlInput2" name="custnum" placeholder="Customer Contact Number">
                    </div>

                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">MEDICINE NAME</th>
                        <th scope="col">MEDICINE TYPE</th>
                        <th scope="col">MEDICINE COMPANY</th>
                        <th scope="col">MEDICINE COST</th>
                        <th scope="col">MEDICINE STOCK</th>
                        <th scope="col">MEDICINE QUANTITY</th>

                    </tr>
                    </thead>
                    <tbody>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
                            PreparedStatement st = con.prepareStatement("select * from medicines");
                            ResultSet rs = st.executeQuery();
                            if (rs.isBeforeFirst()) {
                                int i = 0;
                                while (rs.next()) {
                                    i = i + 1;
                        %>

                        <tr>

                            <th scope="row"><%=i%></th>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getInt(4)%></td>
                            <td><%=rs.getInt(5)%></td>
                            <td>
                                <div class="input-group mb-3 ">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input type="checkbox" aria-label="Checkbox for following text input" name="cb1" value="<%=rs.getString(1)%>" >
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" aria-label="Text input with checkbox" name="cb2">
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            }
                            con.close();
                        %>
                    </tbody>
            </table>

            <button type="submit"  class="btn btn-success"  style="float: right; margin-right:10px; border: 2px solid black; ">Proceed</button>

        </form>


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
