<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Rent A Trip - Admin Login</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  
    <%   

            String username="";
            String password="";
           
            if (request.getParameter("login") != null) {
            username = request.getParameter("username");
            password = request.getParameter("password");
            
            String str = "select * from tbl_admin where username='"+username+"' and password='"+password+"'";
                                            ResultSet rs = obj.select(str);
                                            if(rs.next()) 
                                            {                                                
                                                session.setAttribute("admin", rs.getString("admin_id"));
                                                session.setMaxInactiveInterval(-1);
                                                response.sendRedirect("dashboard.jsp");
                                            }
                                            else
                                            {%>
                                                <script>
                                                    alert("login failed: Wrong UserName or Password");
                                                </script>
                                           <% }
             }
             %>
    
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

	  <div id="login-page">
	  	<div class="container">
	  	
		      <form class="form-login" >
		        <h2 class="form-login-heading">sign in now</h2>
		        <div class="login-wrap">
                            <input type="text" name="username" class="form-control" placeholder="User ID" autofocus required>
		            <br>
                            <input type="password" name="password" class="form-control" placeholder="Password" required>
		            <label class="checkbox">
		                <span class="pull-right">
		                 <!--   <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>-->
		
		                </span>
		            </label>
                            <input type="submit" name="login" class="btn btn-theme btn-block" value="SIGN IN">
		            
		            
		            <!--
					<hr>
		            <div class="login-social-link centered">
		            <p>or you can sign in via your social network</p>
		                <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
		                <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
		            </div>
		            <div class="registration">
		                Don't have an account yet?<br/>
		                <a class="" href="#">
		                    Create an account
		                </a>
		            </div>-->
		
		        </div>
		
		          <!-- Modal -->
		          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
		              <div class="modal-dialog">
		                  <div class="modal-content">
		                      <div class="modal-header">
		                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                          <!--<h4 class="modal-title">Forgot Password ?</h4>-->
		                      </div>
		                      <div class="modal-body">
		                          <p>Enter your e-mail address below to reset your password.</p>
		                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
		
		                      </div>
		                      <div class="modal-footer">
		                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
		                          <button class="btn btn-theme" type="button">Submit</button>
		                      </div>
		                  </div>
		              </div>
		          </div>
		          <!-- modal -->
		
		      </form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("assets/img/login-bg.jpg", {speed: 500});
    </script>


  </body>
</html>
