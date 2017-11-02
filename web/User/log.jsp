<%-- 
    Document   : log
    Created on : Sep 25, 2017, 8:02:46 PM
    Author     : Jayashankar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	<!-- General meta information -->
	<title>Login</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="robots" content="index, follow" />
	<meta charset="utf-8" />
	<!-- // General meta information -->
	
	
	<!-- Load Javascript -->
	<script type="text/javascript" src="./js/jqueryl.js"></script>
	<script type="text/javascript" src="./js/jquery.queryl-2.1.7.js"></script>
	<script type="text/javascript" src="./js/rainbows.js"></script>
	<!-- // Load Javascipt -->

	<!-- Load stylesheets -->
	<link type="text/css" rel="stylesheet" href="css/stylelog.css" media="screen" />
	<!-- // Load stylesheets -->
	
<script>


	$(document).ready(function(){
 
	$("#submit1").hover(
	function() {
	$(this).animate({"opacity": "0"}, "slow");
	},
	function() {
	$(this).animate({"opacity": "1"}, "slow");
	});
 	});
        
        function submit(){
            window.location.replace("http://localhost:8084/Rent_A_Trip/Admin/home.jsp");
        }

</script>
        <%   
            String username="";
            String password="";
           
             if (request.getParameter("submit") != null) {
            username = request.getParameter("username");
            password = request.getParameter("password");
            
            String str = "select * from tbl_users where username='"+username+"' and password='"+password+"'";
                                            ResultSet rs = obj.select(str);
                                            if(rs.next()) 
                                            {
                                                session.setAttribute("user", rs.getString("firstname"));
                                                session.setAttribute("userid", rs.getString("user_id"));
                                                session.setMaxInactiveInterval(-1);
                                                response.sendRedirect("home.jsp");
                                           
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
<body><form>

	<div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle">

			<h2>Login</h2>

			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
				
					<input type="text" name="username" id="url" placeholder="Username" pattern=".{5,15}" required title="5 to 15 characters">
					<img id="url_user" src="./img/mailicon.png" alt="">
				
				</div>

				<div id="username_inputright"></div>

			</div>

			<div id="password_input">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">
				
                                    <input type="password" name="password" id="url" placeholder="password" pattern=".{5,10}" required title="5 to 10 characters">
					<img id="url_password" src="./img/passicon.png" alt="">
				
				</div>

				<div id="password_inputright"></div>

			</div>

			<div id="submit">
				
                            <input type="submit" name="submit" id="search-submit" value=""
    style="background-image: url(img/submit.png); border: solid 0px #fff; width: 300px; height: 40px;" />
				</form>
			</div>


			<div id="links_left">

			<a href="forgot.jsp">Forgot your Password?</a>

			</div>

			<div id="links_right"><a href="registration.jsp">Not a Member Yet?</a></div>

		</div>

                <div id="wrapperbottom"></div>
	</div>

</body>
</html>