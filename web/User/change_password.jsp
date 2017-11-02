<%-- 
    Document   : change_password
    Created on : Oct 22, 2017, 6:33:31 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RAT-Cahange Password</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/stylereg.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        
        <%
            String curpassword="";
            String newpassword="";
             if (request.getParameter("submit") != null) {
                curpassword = request.getParameter("input1");
                newpassword = request.getParameter("input2");
                String useri=session.getAttribute("userid").toString();
                String s="select * from tbl_users where user_id='"+useri+"' and password='"+curpassword+"';";
                ResultSet r=obj.select(s);
                if(r.first()){
                    String ss="update tbl_users set password='"+newpassword+"' where user_id='"+useri+"';";
                    boolean b = obj.insert(ss);
                    if(b){
                    %>
                    <script>
                        alert("Password Successfully Changed.!");
                    </script>
                    <% }
                    }
                else{
                %>
                <script>
                    alert("Entered Current password is Wrong.!");
                </script>
                <%
                }
             }
        %>
        
         <script src="js/jquery.min.js"></script>
             <script>
                 function check(){
                     console.log("calling");
                     var p1=document.getElementById("input2").value;
                     var p2=document.getElementById("input3").value;
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
        <form name="forgot" method="post">
        <h1>Change Password</h1>
        <fieldset>
          <!--<legend><span class="number">1</span>Your basic info</legend>-->
          <!--<label for="name">Current Password</label>-->
          <input type="text" id="input1" name="input1" placeholder="Current Password" title="Current Password" required>
          <!--<label for="name">New Password</label>-->
          <input type="text" id="input2" name="input2" placeholder="New Password"  pattern=".{5,10}" required title="5 to 10 characters">
          <!--<label for="name">Re-Enter New Password</label>-->
          <input type="text" id="input3" name="input3" onkeyup="check()" placeholder="Re-Enter New Password" title="5 to 10 characters" pattern=".{5,10}" required>
          <span id="status"></span>
        </fieldset>
          <button type="submit" name="submit" value="Submit">Submit</button>
          <br>
          <center> <a href="home.jsp">Home</a></center>
      </form>
    </body>
</html>
