<%-- 
    Document   : AjaxType
    Created on : Sep 21, 2017, 2:52:00 PM
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
       String id=request.getParameter("id");%>
        <select name="type" id="seltype">
            <option>Select</option>
            <%
            String s="select * from tbl_type where `category_id`='"+id+"'";
            ResultSet rst=obj.select(s);
            while(rst.next()){
            %>
            <option value="<%=rst.getString("type_id")%>"> 
            <%=rst.getString("type_name")%> &nbsp; <%=rst.getString("type_no_seats")%>seat(s)
            </option><%}%>
            </select>
       
       
    </body>
</html>
