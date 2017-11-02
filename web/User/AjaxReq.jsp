<%-- 
    Document   : AjaxReq
    Created on : Oct 11, 2017, 1:32:39 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>

      <%
       String id=request.getParameter("id");
       String st=request.getParameter("st");
       String from=request.getParameter("from");
       String to=request.getParameter("to");
       String userid=session.getAttribute("userid").toString();

            String a="select * from tbl_request where trip_id='"+id+"' and user_id='"+userid+"'";
            ResultSet rs=obj.select(a);
            if(!rs.next()){
            String s="insert into tbl_request (trip_id,user_id,no_of_seats,trip_from,trip_to) values('"+id+"','"+userid+"','"+st+"','"+from+"','"+to+"');";
            boolean b=  obj.insert(s);
            out.print(b);
            }
            %>
        
