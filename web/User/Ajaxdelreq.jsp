<%-- 
    Document   : Ajaxdelreq
    Created on : Oct 13, 2017, 7:00:50 AM
    Author     : Jayashankar
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
    <head></head>
    <body>
<div id="delete">       
      Deleted
</div>
      <%    
            String rid=request.getParameter("rid");
            String ss="delete from tbl_request where request_id='"+rid+"'";
            obj.insert(ss);
       %>

    </body></html>