<%-- 
    Document   : unexists
    Created on : Sep 25, 2017, 12:05:42 PM
    Author     : Jayashankar
--%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ajax un check</title>
<%        
        try{
            String s="SELECT * FROM tbl_users WHERE"+"username=?";
            ResultSet res = obj.select(s);
            if(res.first()){
                out.print("User already exists");
            }else{
                out.print("User name is valid");
            }
        }catch (Exception e){
            System.out.println(e);  
        }
%>
    </head>
    <body>
        
    </body>
</html>
