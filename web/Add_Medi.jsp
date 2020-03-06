<%-- 
    Document   : Add_Medi
    Created on : 6 Mar, 2020, 7:40:45 AM
    Author     : jainn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD MEDICINE</title>
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
        
        <%-- Actual functions starts here --%>
        <form action="Add_Medi_Process.jsp">
  <div class="form-group">
    <label for="formGroupExampleInput">Medicine Name</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Medicine Name" name="Mn">
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Medicine Type</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Medicine Type" name="Mt">
  </div>
           <div class="form-group">
    <label for="formGroupExampleInput3">Medicine Company</label>
    <input type="text" class="form-control" id="formGroupExampleInput3" placeholder="Medicine Company" name="Mcom">
  </div>
            <div class="form-group">
    <label for="formGroupExampleInput4">Medicine Cost</label>
    <input type="number" class="form-control" id="formGroupExampleInput4" placeholder="Medicine Cost" name="Mcos">
  </div>
            <div class="form-group">
    <label for="formGroupExampleInput5">Medicine Quantity</label>
    <input type="number" class="form-control" id="formGroupExampleInput5" placeholder="Medicine Quantity" name="Mq">
  </div>
            <button type="submit" class="btn btn-success">Submit</button>
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