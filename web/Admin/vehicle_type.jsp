<%-- 
    Document   : vehicle_type
    Created on : Sep 21, 2017, 11:59:07 AM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>vehicle type</title>
        
        
        <%
         String type="";
         String seats="";
         String cat_id="";
           if (request.getParameter("submit") != null) {
           
               type= request.getParameter("type");
               seats=request.getParameter("seats");
               cat_id=request.getParameter("cat");
               String str="insert into tbl_type(type_name,type_no_seats,category_id) values('"+type+"','"+seats+"','"+cat_id+"')";
               obj.insert(str);
           }
           %>
        
        
    </head>
    <body>
        <form action="#"><center>
        <h1>Enter vehicle type</h1>
        <table>
            <tr><td>Vehicle Type</td><td>
        <select name="type">
            <option>Select</option>
            <option>4 wheeler</option>
            <option>3 wheeler</option>
            <option>2 wheeler</option>
        </select></td></tr>
            <tr><td>Number of Seats</td><td>
                    <select name="seats">
                        <option>Select</option>
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                    </select>
                </td></tr>
            
            <tr>
                <td>category</td><td><select name="cat">
                        <option>select</option>
                        <%
                        String st="select * from tbl_category";
                        ResultSet rs=obj.select(st);
                        while(rs.next()){
                        %>
                        <option value="<%=rs.getString("category_id")%>"> 
                       <%=rs.getString("category")%> </option>
                       <%}%>
                    </select></td>
            </tr>
             <tr><td><input type="submit" name="submit" value="Submit"></td>
        </table>
            </center></form>
    </body>
</html>
