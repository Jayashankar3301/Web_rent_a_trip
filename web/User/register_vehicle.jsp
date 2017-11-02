<%-- 
    Document   : register_vehicle
    Created on : Sep 21, 2017, 10:19:44 AM
    Author     : Jayashankar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
    <%
if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
%>
<html>
    <head>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
      <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
      <link rel="stylesheet" href="css/stylereg.css">
        
        <script src="js/jquery.min.js"></script>
        
        <script>
            function getType(cid){
            $.ajax({url: "AjaxType.jsp?id="+cid, success: function(result){
            $("#seltype").html(result);
        }});
            } 
        </script>
 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Vehicle</title>
        <%
            String regno="";
            String licno="";
            String v_name="";
            String category="";
            String color="";
        if (request.getParameter("submit") != null) {
            regno= request.getParameter("regno");
            licno=request.getParameter("licno");
            v_name= request.getParameter("type");
            category= request.getParameter("cat");
            color= request.getParameter("vehicle_color");
            String userid="";
            String sell="select max(user_id) as user_id from tbl_users";
            ResultSet rs=obj.select(sell);
            if(rs.next()){
              userid=rs.getString("user_id");
            }
                Boolean c=false;
                String str3="insert into tbl_vehicle(vehicle_reg,type_id,vehicle_color,user_id) values('"+regno+"','"+v_name+"','"+color+"','"+userid+"')";
                String str4="insert into tbl_users(user_license) values('"+licno+"')";
                obj.insert(str4);
                c= obj.insert(str3);
            if(c){
            %>
                <script>
                    alert("Vehicle Successfully Registered..!");
                </script>
                <% String userd = session.getAttribute("userid").toString();
                if(userd==null)
                    response.sendRedirect("log.jsp");
                else
                    response.sendRedirect("home.jsp");
            }
            }
             %>
    </head>
    <body>
        <form>
    <center>
        <h2> Register your Vehicle</h2>
        <br>
        <table><tr><td>Registration Number</td><td>
                    <input type="text" placeholder="Registration Number" name="regno" required></td></tr>
            <tr><td>Driving License Number</td>
                <td><input type="text" placeholder="Licence Number" name="licno" required></td></tr>
             <tr>
                 <td>category</td><td><select name="cat" onchange="getType(this.value)">
                        <option>Select</option>
                        <%
                            String str="select *from tbl_category;";
                            ResultSet rs=obj.select(str);
                            while(rs.next()){
                        %>
                            <option value="<%=rs.getString("category_id")%>">
                                <%=rs.getString("category")%>
                            </option><%}%>
                        
                    </select></td></tr>
            <tr><td>Vehicle Type</td><td>
        <select name="type" id="seltype">
            <option>Select</option>
            <%
            String s="select type_id,type_name,type_no_seats from tbl_type;";
            ResultSet rst=obj.select(s);
            while(rst.next()){
            %>
            <option value="<%=rst.getString("type_id")%>"> 
            <%=rst.getString("type_name")%> &nbsp; <%=rst.getString("type_no_seats")%>seat(s)
            </option><%}%>
            </select></td></tr>          
            <tr><td>Color</td><td><input type="text" name="vehicle_color" required></td></tr>
            
            <tr><td><button type="submit" name="submit" value="Sign Up">Register</button></td><td><button type="reset" name="submit" value="Sign Up">clear</button></td></tr>
        </table>
               <br>
          <a href="home.jsp">Home</a>
    </center>
</form>
    </body>
</html>
