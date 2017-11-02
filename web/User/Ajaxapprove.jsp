<%-- 
    Document   : AjaxReq
    Created on : Oct 11, 2017, 1:32:39 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html>
    <head></head>
    <body>

      <%    
            String appid=request.getParameter("app");
            String ss="update tbl_request set status=1 where request_id='"+appid+"'";
            obj.insert(ss);
       %>
<div id="show">       
      Approved
</div>
    </body></html>