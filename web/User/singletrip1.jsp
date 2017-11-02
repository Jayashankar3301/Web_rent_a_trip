<%-- 
    Document   : singletrip
    Created on : Sep 25, 2017, 7:34:42 AM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String useri= session.getAttribute("userid").toString();
    if(useri==null){
        response.sendRedirect("log.jsp");
    }
    String s="select vehicle_reg from tbl_vehicle where user_id='"+useri+"';";
    ResultSet r=obj.select(s);
    if(!r.first()){
        response.sendRedirect("register_vehicle.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>trip</title>
        
        <%
            String sfrom="";
            String sto="";
            String date="";
            String time="";
            String vehicle="";
        if (request.getParameter("submit") != null) {
            sfrom= request.getParameter("sfrom");
            sto= request.getParameter("sto");
            date= request.getParameter("date");
            time= request.getParameter("time");
            vehicle=request.getParameter("veh");
             String loc1=request.getParameter("hidden1");
             String loc2=request.getParameter("hidden2");
             String loc3=request.getParameter("hidden3");
             String loc4=request.getParameter("hidden4");
             
             String st="insert into tbl_strip(vehicle_id,strip_from,strip_to,strip_date,strip_time,strip_from_lat,strip_from_lon,strip_to_lat,strip_to_lon)"
                        + " values('"+vehicle+"','"+sfrom+"','"+sto+"','"+date+"','"+time+"','"+loc1+"','"+loc2+"','"+loc3+"','"+loc4+"')";
             boolean c= obj.insert(st);
             
             if(c){
                 String sin="select MAX(`strip_id`) as trip_id from tbl_strip;";
                 ResultSet rs=obj.select(sin);
                 String trip_id="";
                 int prio=0;
                 if(rs.next()){
                 trip_id=rs.getString("trip_id");
                 }
                 String ins="insert into tbl_checkpoint(check_location,check_priority,trip_id,checkpoint_lat,checkpoint_lon) values('"+sfrom+"','"+prio+"','"+trip_id+"','"+loc1+"','"+loc2+"')";
                 boolean d = obj.insert(ins);
                 if(d) response.sendRedirect("checkpoint.jsp");
            }
            }
             %>
    </head>
    <body>
       
        
        <form name="trip">
    <center> <h1>single trip</h1>
        <br>
        <table><tr><td>Trip from</td><td>
        <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDZObWCbe5XsVd0Wudq-I24usXkQ7PWYXg"></script>
                    
        <script>
google.maps.event.addDomListener(window,'load',initialize);
function initialize() {
var input1 = document.getElementById('pac-input');
var input2 = document.getElementById('pac-input2');
var autocomplete = new google.maps.places.Autocomplete(input1);
var autocomplete2 = new google.maps.places.Autocomplete(input2);
autocomplete.addListener('place_changed', function () {
var place = autocomplete.getPlace();
// place variable will have all the information you are looking for.
console.log(place.geometry['location'].lat());
console.log(place.geometry['location'].lng());
var lat1=place.geometry['location'].lat();
var lng1=place.geometry['location'].lng();
document.trip.hidden1.value=lat1;
document.trip.hidden2.value=lng1;

});
autocomplete2.addListener('place_changed', function () {
var place = autocomplete2.getPlace();
// place variable will have all the information you are looking for.
console.log(place.geometry['location'].lat());
console.log(place.geometry['location'].lng());
var lat2=place.geometry['location'].lat();
var lng2=place.geometry['location'].lng();
document.trip.hidden3.value=lat2;
document.trip.hidden4.value=lng2;
});
}
</script>



<input id="pac-input" type="text" placeholder="trip from" name="sfrom" style="width: 200px;" required></td></tr>
            <tr><td>Trip to</td><td>
                    <input type="text" id="pac-input2" placeholder="trip to" name="sto" style="width: 200px;" required></td></tr>
            <tr><td>Date</td><td>
                    <input type="date" name="date" required></td></tr>
            <tr><td>Time</td><td>
                    <input type="time" name="time" required></td></tr>
            
                <tr>
                 <td>Select Vehicle</td><td><select name="veh">
                        <option>Select</option>
                        <%
                            String userid=session.getAttribute("userid").toString();
                            String str="select * from tbl_vehicle where user_id='"+userid+"';";
                            ResultSet rs=obj.select(str);
                            while(rs.next()){
                        %>
                            <option value="<%=rs.getString("vehicle_id")%>">
                                <%=rs.getString("vehicle_reg")%>
                            </option><%}%>
                        
                    </select></td></tr>
                <tr><td><input type="submit" name="submit" id="submit" value="Register"></td><td><input type="reset" value="clear"></td></tr>
            
            
            
        </table>
            <input type="hidden" name="hidden1" value="">
            <input type="hidden" name="hidden2" value="">
            <input type="hidden" name="hidden3" value="">
            <input type="hidden" name="hidden4" value="">
    </center></form>        
    </body>
</html>
