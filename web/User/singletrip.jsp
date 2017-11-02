<%-- 
    Document   : singletrip2
    Created on : Oct 13, 2017, 1:41:53 PM
    Author     : Jayashankar
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<!DOCTYPE html>
<!--[if IE 7]>                  <html class="ie7 no-js" lang="en">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<%
    if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
    String useri=session.getAttribute("userid").toString();
    String s="select vehicle_reg from tbl_vehicle where user_id='"+useri+"';";
    ResultSet r=obj.select(s);
    if(!r.first()){
        response.sendRedirect("register_vehicle.jsp");
    }
%>
<html class="not-ie no-js" lang="en">  <!--<![endif]-->
    <head>

        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Rent A Trip - Add ride</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Styles -->

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Forms -->
        <link href="css/jquery.idealforms.css" rel="stylesheet">
        <!-- Select  -->
        <link href="css/jquery.idealselect.css" rel="stylesheet">
        <!-- Slicknav  -->
        <link href="css/slicknav.css" rel="stylesheet">
        <!-- Main style -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Modernizr -->
        <script src="js/modernizr.js"></script>

        <!-- Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

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

        <header class="header">

            <div class="top-menu">

                <section class="container">
                    <div class="row">

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="user-log">

                                 <%String user = session.getAttribute("user").toString();%>
                                Welcome <%=user%>
                            </div><!-- end .user-log -->
                        </div><!-- end .col-sm-4 -->

                        <div class="col-md-8 col-sm-8 col-xs-12">

                            <ul class="social-icons">
                                <li>
                                    <a class="facebook" href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="twitter" href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="google" href="#">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                            </ul>

                        </div><!-- end .col-sm-8 -->

                    </div><!-- end .row -->
                </section><!-- end .container -->

            </div><!-- end .top-menu -->

            <div class="main-baner">

                <div class="background parallax clearfix" style="background-image:url('img/tumblr_n7yhhvUQtx1st5lhmo1_1280.jpg');" data-img-width="1600" data-img-height="1064">

                    <div class="main-parallax-content">

                        <div class="second-parallax-content">

                            <section class="container">

                                <div class="row">

                                    <div class="main-header-container clearfix">

                                        <div class="col-md-4 col-sm-12 col-xs-12">

                                            <div class="logo">
                                                <h1>RENT A TRIP </h1>
                                            </div><!-- end .logo -->

                                        </div><!-- end .col-sm-4 -->

                                        <div class="col-md-8 col-sm-8 col-xs-12">

                                            <nav id="nav" class="main-navigation">

                                                <ul class="navigation">
                                                    <li>
                                                        <a href="home.jsp">Home</a>
                                                    </li>
                                                    <li>
                                                        <a href="rides.jsp">Rides</a>
                                                    </li>
                                                    <li>
                                                        <a href="singletrip.jsp">Submit</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Pages</a>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="myrides.jsp">My Rides</a>
                                                            </li>
                                                            <li>
                                                                <a href="myrequests.jsp">My Requests</a>
                                                            </li>
                                                            <li>
                                                                <a href="viewrequests.jsp">Requests to you</a>
                                                            </li>
                                                            <li>
                                                                <a href="register_vehicle.jsp">Add Vehicle</a>
                                                            </li>
                                                            <li>
                                                                <a href="change_password.jsp">Change Password</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li>
                                                        <a name="btnLogout" id="btnLogout" href="index.jsp">Logout</a>
                                                    </li>
                                                    <li>
                                                        <a href="contact.jsp">Contact</a>
                                                    </li>
                                                </ul>

                                            </nav><!-- end .main-navigation -->

                                        </div><!-- end .col-md-8 -->

                                    </div><!-- end .main-header-container -->


                                </div><!-- end .row -->

                            </section><!-- end .container -->

                        </div><!-- end .second-parallax-content -->

                    </div><!-- end .main-parallax-content -->

                </div><!-- end .background .parallax -->

            </div><!-- end .main-baner -->

        </header><!-- end .header -->

        <section class="main-content">

            <div class="container">
                <div class="row">

                    <div class="col-sm-12 col-md-12 col-xs-12">

                        <div class="page-sub-title textcenter">
                            <h2>Add new ride</h2>
                            <div class="line"></div>
                        </div><!-- end .page-sub-title -->

                    </div><!-- end .col-lg-12 -->

                    <div class="col-sm-12 col-md-12 col-xs-12">

                        <div class="page-content add-new-ride">

                            <form name="trip" action="" novalidate autocomplete="off" class="idealforms add-ride">

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

                                
                                
                                <div class="field">
                                    <input id="pac-input" name="sfrom" type="text" placeholder="From Location" >
                                </div>

                                <div class="field">
                                    <input id="pac-input2" name="sto" type="text" placeholder="To Location">
                                </div>
                                
                                <div class="field">
                                    <input name="date" type="date" required>
                                </div>
                                
                                <div class="field">
                                    <input name="time" type="time" required>
                                </div>

                                <div class="field">
                                    <select name="veh">
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
                        
                                    </select>
                                </div>

                                <div class="field buttons">
                                    <button type="submit" name="submit" class="btn btn-lg green-color">Submit</button>
                                </div>
                                <div class="field buttons">
                                    <button type="reset" class="btn btn-lg green-color">Clear</button>
                                </div>
            <input type="hidden" name="hidden1" value="">
            <input type="hidden" name="hidden2" value="">
            <input type="hidden" name="hidden3" value="">
            <input type="hidden" name="hidden4" value="">
                            </form>

                        </div><!-- end .page-content -->

                    </div><!-- end .col-sm-12 -->

                </div><!-- end .row -->
            </div><!-- end .container -->

        </section><!-- end .main-content -->

        <footer id="footer">

            <div class="footer-copyright">

                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            Copyright by Rent A Trip
                        </div>

                    </div><!-- end .row -->
                </div><!-- end .container -->

            </div><!-- end .footer-copyright -->

        </footer><!-- end #footer -->


        <!-- Javascript -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Main jQuery -->
        <script type="text/javascript" src="js/jquery.main.js"></script>
        <!-- Form -->
        <script type="text/javascript" src="js/jquery.idealforms.min.js"></script>
        <script type="text/javascript" src="js/jquery.idealselect.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
        <!-- Menu -->
        <script type="text/javascript" src="js/hoverIntent.js"></script>
        <script type="text/javascript" src="js/superfish.js"></script>
        <!-- Counter-Up  -->
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script type="text/javascript" src="js/jquery.counterup.min.js"></script>
        <!-- Rating  -->
        <script type="text/javascript" src="js/bootstrap-rating-input.min.js"></script>
        <!-- Slicknav  -->
        <script type="text/javascript" src="js/jquery.slicknav.min.js"></script>

    </body>
</html>

