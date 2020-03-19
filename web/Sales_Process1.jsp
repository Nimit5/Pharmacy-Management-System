<%-- 
    Document   : Sales_Process1
    Created on : 17 Mar, 2020, 7:58:58 AM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.lang.*" %>
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
        <form action="Order.jsp">
            <table class="table table-bordered table-dark">
                <thead>
                    <%
                        String cust_name = request.getParameter("custname");
                        String cust_num = request.getParameter("custnum");
                    %>

                <div style="border: 3px solid black; padding: 15px; margin: 5px; border-radius: 5px;">  

                    <div class="form-group">
                        <label for="exampleFormControlInput1">Customer Name</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" value="<%=cust_name%>" name="custname">
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlInput2">Customer Contact Number</label>
                        <input type="text" class="form-control" id="exampleFormControlInput2" name="custnum" value="<%=cust_num%>">
                    </div>

                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">MEDICINE NAME</th>
                        <th scope="col">MEDICINE TYPE</th>
                        <th scope="col">MEDICINE COMPANY</th>
                        <th scope="col">MEDICINE COST</th>
                        <th scope="col">MEDICINE QUANTITY</th>
                        <th scope="col">AMOUNT</th>

                    </tr>
                    </thead>
                    <tbody>
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
                            int total = 0;
                            String[] cb1 = request.getParameterValues("cb1");
                            String[] cb2 = request.getParameterValues("cb2");
                            int k, sr, z;
                            int x = cb1.length;
                            int[] cb3 = new int[x];
                            int[] upd = new int[x];
                            z = 0;
                            for (k = 0; k < cb1.length; k++) {
                                System.out.println(cb1[k]);
                            }

                            for (String r : cb2) {
                                if (r != "") {
                                    cb3[z] = Integer.parseInt(r);
                                    z++;
                                }
                            }
                            for (int y = 0; y < z; y++) {

                                System.out.println(cb3[y]);
                            }

                            for (k = 0, sr = 1; k < cb1.length; k++, sr++) {
                                int amt = 0;
                                PreparedStatement st = con.prepareStatement("select * from medicines where M_name=?");
                                st.setString(1, cb1[k]);
                                ResultSet rs = st.executeQuery();
                                if (rs.isBeforeFirst()) {
                                    int i = 0;
                                    while (rs.next()) {
                                        i = i + 1;

                                        upd[k] = rs.getInt(5) - cb3[k];

                        %>

                        <tr>

                            <td><%=sr%></td>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getInt(4)%></td>
                            <td><%=cb3[k]%></td>
                            <%
                                int quant = cb3[k];
                                int cos = rs.getInt(4);
                                amt = quant * cos;
                                total = total + amt;
                                cos = 0;
                                for (int g = 0; g < upd.length; g++) {
                            %>
                    <input type = "hidden" name = "update" value = "<%= upd[g]%>">
                    <input type = "hidden" name = "length" value = "<%= x%>">
                    <%
                        }
                        for (int h = 0; h < cb1.length; h++) {
                    %>
                    <input type = "hidden" name = "medicinesnames" value = "<%= cb1[h]%>">
                    <input type = "hidden" name = "cust_name" value = "<%=cust_name%>">
                    <input type = "hidden" name = "cust_num" value = "<%=cust_num%>">


                    <%

                        }


                    %>
                    <td><%=amt%></td>
                    </tr>
                    <%

                                }

                            }
                        }
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><b>TOTAL AMOUNT</b></td>
                        <td><%=total%></td>
                    </tr>
                    </tbody>
            </table>
            <button type="submit" class="btn btn-success" style="float: right; margin-right: 4%;">ORDER</button>

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
