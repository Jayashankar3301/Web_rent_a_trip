<%-- 
    Document   : registration
    Created on : Sep 25, 2017, 3:08:35 PM
    Author     : Jayashankar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
<head>
  <meta charset="UTF-8">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      <link rel="stylesheet" href="css/stylereg.css">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up Form</title>
      <!--  <link rel="stylesheet" href="css/normalize.css">-->
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
     <!--   <link rel="stylesheet" href="css/main.css">-->
        <%
        
            String username="";
            String password="";
            String firstname="";
            String lastname="";
            String age="";
            String phone="";
            String gender="";
            String address="";
            String email="";
            String dist_id="";
            
            if (request.getParameter("submit") != null) {
                username = request.getParameter("username");
                password = request.getParameter("password");
                firstname=request.getParameter("fname");
                lastname=request.getParameter("lname");
                address=request.getParameter("address");
                email=request.getParameter("email");
                age=request.getParameter("age");
                gender = request.getParameter("gender");
                phone=request.getParameter("phone");
                dist_id=request.getParameter("dist");
                String pass=request.getParameter("pass");
                
                
           
            String str = "insert into tbl_users(firstname,lastname,username,"
                    + "password,age,gender,address,dist_id,phone,email) values('"+firstname+"','"+ lastname +
                    "','" + username + "','" + password + "','" + age + "','"+gender+"','"+address+"','"+dist_id+"','"+phone+"','"+email+"')";
            boolean b = obj.insert(str);
            if(b)
            {
                if(pass.equals("0"))
                response.sendRedirect("log.jsp");
                else
                response.sendRedirect("register_vehicle.jsp"); 
            }
            else
            {
                response.sendRedirect("registration.jsp");
            }
             }
             %>
             
             <script src="js/jquery.min.js"></script>
             <script>
                 function ajaxCheck(un){
                     $.ajax({url: "AjaxCheck.jsp?id1="+un, success: function(result){
            $("#show").html(result);
        }});
                 }
                 function check(){
                     console.log("calling");
                     var p1=document.getElementById("password").value;
                     var p2=document.getElementById("repassword").value;
                     if(p1!==p2){
                         $("span").css("color","red");
                         document.getElementById("status").innerHTML="PASSWORDS AREN'T SAME";
                     }
                     else{
                         $("span").css("color","green");
                         document.getElementById("status").innerHTML="PASSWORDS MATCH";
                     }
                 }
             </script>
        
    </head>
    <body>

      <form name="reg" method="post">
      
        <h1>Sign Up</h1>
        
        <fieldset>
          <!--<legend><span class="number">1</span>Your basic info</legend>-->
          <label for="name">First Name:</label>
          <input type="text" id="name" name="fname" maxlength="20" title="Maximum length is 20" required>
          
          <label for="name">Last Name:</label>
          <input type="text" id="name" name="lname" maxlength="20" title="Maximum length is 20" required>
          
          <label for="mail">Email:</label>
          <input type="email" id="mail" name="email" required>
          <label for="name">User Name:</label>
          <input type="text" id="name" name="username" onkeyup="ajaxCheck(this.value)" pattern=".{5,15}" required title="5 to 15 characters"><div id="show"></div>
          
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" pattern=".{5,10}" required title="5 to 10 characters">
          
          <label for="password">Re-type Password:</label>
          <input type="password" id="repassword" onkeyup="check()" name="repassword" required><span id="status"></span>
          
          <label>Gender:</label>
          <input type="radio" id="under_13" value="male" name="gender" required><label for="under_13" class="light">Male</label><br>
          <input type="radio" id="over_13" value="female" name="gender"><label for="over_13" class="light">Female</label>
          
          <label>User Type:</label>
          <input type="radio" id="under_13" value="0" name="pass" required><label for="under_13" class="light">Passenger</label><br>
          <input type="radio" id="over_13" value="1" name="pass"><label for="over_13" class="light">Driver</label>

          <label for="name">Age:</label>
          <input type="text" id="name" name="age" maxlength="3" required>
          
          <label for="name">Phone Number:</label>
          <input type="text" id="name" name="phone" pattern="[789][0-9]{9}" required>
        </fieldset>
        
        <fieldset>
         <!-- <legend><span class="number">2</span>Your profile</legend>-->
          <label for="bio">Address:</label>
          <textarea id="bio" name="address" required></textarea>
        </fieldset>
        
        <select id="job" name="dist" required>
          <optgroup label="Districts">
                <%
                        String st="select * from tbl_district";
                        ResultSet rs=obj.select(st);
                        while(rs.next()){
                    %>
                    <option value="<%=rs.getString("dist_id")%>"> 
                       <%=rs.getString("dist_name")%>
                    </option>
                    <%}%> 
          </optgroup>
        </select>
        
         
          <button type="submit" name="submit" value="Sign Up">Sign Up</button>
      </form>
      
    </body>
</html>
