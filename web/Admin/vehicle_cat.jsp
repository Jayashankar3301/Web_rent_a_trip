<%-- 
    Document   : vehicle_cat
    Created on : Sep 21, 2017, 11:49:48 AM
    Author     : Jayashankar
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>vehicle category</title>
        <%
         String category="";
           if (request.getParameter("submit") != null) {
           
               category= request.getParameter("cat");
               String str="insert into tbl_category(category) values('"+category+"')";
               obj.insert(str);
           }
           %>
    </head>
    <body>
        <form action="#">
            <center>
        <h1>Vehicle Category</h1>
        <table>
            <tr>
                <td>category</td><td><select name="cat">
                        <option>Select</option>
                        <option>A/C</option>
                        <option>Non_AC</option>
                    </select></td></tr>
            <tr><td><input type="submit" name="submit" value="Save"></td>
        </table>
            </center>
        </form>
    </body>
</html>
