<%-- 
    Document   : checkpoint
    Created on : Sep 25, 2017, 10:52:16 AM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Checkpoints</title>
        
        <%
            String loc="";
            String priority="";
            String lat="";
            String lng="";
            if (request.getParameter("submit") != null) {
            loc= request.getParameter("input");
            priority= request.getParameter("prio");
            lat=request.getParameter("hidden1");
            lng=request.getParameter("hidden2");
            String st1="select MAX(`strip_id`) as trip_id from tbl_strip;";
             ResultSet rs=obj.select(st1);
             String trip_id="";
             if(rs.first()){
                 trip_id=rs.getString("trip_id");
             }
                String st="insert into tbl_checkpoint(check_location,check_priority,trip_id,checkpoint_lat,checkpoint_lon) values('"+loc+"','"+priority+"','"+trip_id+"','"+lat+"','"+lng+"')";
                Boolean c= obj.insert(st);
            if(c){
            %>
                <script>
                    alert("Checkpoint Successfully added..!");
                </script>
            <%
                 response.sendRedirect("checkpoint.jsp");
            }
            }
             %>
                    
    </head>
    <body>
        <form name="checkpoint">
            <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDZObWCbe5XsVd0Wudq-I24usXkQ7PWYXg"></script>
                    
        <script>
google.maps.event.addDomListener(window,'load',initialize);
function initialize() {
var input = document.getElementById('input');
var autocomplete = new google.maps.places.Autocomplete(input);
autocomplete.addListener('place_changed', function () {
var place = autocomplete.getPlace();
// place variable will have all the information you are looking for.
console.log(place.geometry['location'].lat());
console.log(place.geometry['location'].lng());
var lat=place.geometry['location'].lat();
var lng=place.geometry['location'].lng();
document.checkpoint.hidden1.value=lat;
document.checkpoint.hidden2.value=lng;
});
}
</script>
    <center> <h1>Add Checkpoint</h1>
        <br>
        <table>         
             <tr><td>Checkpoint</td><td>
                     <input type="text" placeholder="checkpoint" name="input" id="input" required></td></tr>
             <tr><td>Checkpoint Priority</td><td>
                     <input type="text" placeholder="priority" name="prio" required></td></tr>
             
                <tr><td><input type="submit" name="submit" value="Add"></td><td><input type="reset" value="clear"></td></tr>
            
        </table>
        <input type="hidden" name="hidden1" value="">
        <input type="hidden" name="hidden2" value="">
        <br><br><a href="home.jsp">Home</a>
    </center>
        </form>
    </body>
</html>
