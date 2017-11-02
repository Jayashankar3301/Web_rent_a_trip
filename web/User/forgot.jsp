<%-- 
    Document   : forgot
    Created on : Oct 13, 2017, 11:24:36 AM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<jsp:useBean id="mail" class="DB.mailconnection"></jsp:useBean>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="css/stylereg.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
      <!--  <link rel="stylesheet" href="css/normalize.css">-->
  <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
     <!--   <link rel="stylesheet" href="css/main.css">-->
    <%
            if (request.getParameter("submit") != null) {
                String input=request.getParameter("input");
                String s="select * from tbl_users where username='"+input+"' or email='"+input+"' or phone='"+input+"'";
                ResultSet rs=obj.select(s);
                if(rs.first()){
                    String email=rs.getString("email");
                    String pass=rs.getString("password");   
               String to[]={email};
               String subject="Rent A Trip - PASSWORD RECOVERY";
               String text="Hi, Your Rent A Trip Password is : '"+pass+"'";
               try{
                                     System.out.println("try to mail");
                                    boolean b=mail.sendMail(to, subject, text);
                                    if(b)
                                    {
                                       %><script>alert("SUCCESS : Password is Sent to your Registered mail");</script><%
                                    }
                                    else
                                    {
                                       %><script>alert("UNSUCCESS : Enter correct input");</script><%
                                    }
                                }
                                catch(Exception e){
                                        System.out.println("Exxx "+e);
                                }
                }
            }
             %>   
  </head>
    <body>
      <form name="forgot" method="post">
        <h1>Forgot Password</h1>
        <fieldset>
          <!--<legend><span class="number">1</span>Your basic info</legend>-->
          <label for="name">Enter :</label>
          <input type="text" id="input" name="input" placeholder="Username / Email / Phone" title="Username or email or phone number" required>
        </fieldset>
          <button type="submit" name="submit" value="Submit">Submit</button>
      </form>
    </body>
</html>


