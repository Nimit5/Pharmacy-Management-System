<%-- 
    Document   : Add_sales
    Created on : 6 Mar, 2020, 12:50:13 PM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>

        <title>Sales</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <style>
            /*auto increment/decrement the sr.no.*/
            body {
                counter-reset: section;
            }

            i.srno {
                counter-reset: subsection;
            }

            i.srno:before {
                counter-increment: section;
                content: counter(section);
            }
        </style>


        <%-- 
    Document   : Add_sales
    Created on : 6 Mar, 2020, 12:50:13 PM
    Author     : jainn
        --%>
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


        <form>
            <div style="border: 3px solid black; padding: 15px; margin: 5px; border-radius: 5px;">  

                <div class="form-group">
                    <label for="exampleFormControlInput1">Customer Name</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Customer Name">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput2">Customer Contact Number</label>
                    <input type="text" class="form-control" id="exampleFormControlInput2" placeholder="Customer Contact Number">
                </div>
                <script type='text/javascript'>
                    $(document).ready(function () {
                        $('#POITable').on('change', 'select.search_type', function (e) {
                            var selectedval = $(this).val();
                            $(this).closest('td').next().html(selectedval);
                        });
                    });
                </script>
                <%
                    try {
                        String uname = request.getParameter("un");
                        String pass = request.getParameter("ps");

                        Class.forName(
                                "com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://Localhost:3306/pharmacy", "root", "Nimit@051099");
                        PreparedStatement st = con.prepareStatement("select * from login where username=? and pass=?");
                        ResultSet rs = st.executeQuery();

                    } catch (Exception e) {
                        e.printStackTrace();
                        String sqlMessage = e.getMessage();
                    }

                %>
                <table class="table" id="POITable" border="2px">
                    <tr>
                        <th>Sl No</th>
                        <th>Medicine Name</th>
                        <th>Quantity</th>
                        <th>Cost</th>
                        <th>Amount</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td><i class="srno"></i></td>
                        <td>
                            <select class="search_type" name="select_one">
                                <option value="">Select</option>
                                <option value="abc">abc</option>
                                <option value="def">acd</option>
                                <option value="xyz">aep</option>
                            </select>
                        </td>
                        <td><input type="text" size="8"/></td>
                        <td><input type="text" size="8"/></td>

                        <td><input type="text" size="8"/></td>

                        <td><button type="button" onclick="deleteRow(this)">-</button><button type="button" onclick="insRow()">+</button></td>
                    </tr>
                </table>

                <script type='text/javascript'>
                    function deleteRow(row)
                    {
                        var i = row.parentNode.parentNode.rowIndex;
                        document.getElementById('POITable').deleteRow(i);
                    }
                    function insRow()
                    {
                        var x = document.getElementById('POITable');
                        var new_row = x.rows[1].cloneNode(true);
                        var len = x.rows.length;
                        //new_row.cells[0].innerHTML = len; //auto increment the srno
                        var inp1 = new_row.cells[1].getElementsByTagName('select')[0];
                        inp1.id += len;
                        inp1.value = '';
                        new_row.cells[2].innerHTML = '';
                        new_row.cells[4].getElementsByTagName('input')[0].value = "";
                        x.appendChild(new_row);
                    }
                </script>
            </div> 

        </form>



        <form>
            <button type="button" class="btn btn-success"  style="float: right; margin-right:10px; border: 2px solid black; ">Place Order</button>
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
