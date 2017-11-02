<%-- 
    Document   : AjaxPass
    Created on : Sep 25, 2017, 3:53:58 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String id=request.getParameter("id1");%>
        <div id="show">
            <%
            String s="select pass from tbl_users where username='"+id+"';";
            ResultSet rst=obj.select(s);
            if(rst.first()){
                %>Username Already Exists<%}
            else{
            %>Username Available<%
            }%>
        </div>
    </body>
</html>