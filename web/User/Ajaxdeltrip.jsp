<%-- 
    Document   : Ajaxdeltrip
    Created on : Oct 12, 2017, 8:25:12 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
    <head></head>
    <body>

      <%    
            String trid=request.getParameter("trid");
            String ss="delete from tbl_strip where strip_id='"+trid+"'";
            obj.insert(ss);
       %>
<div id="delete">       
      Cancelled
</div>
    </body></html>