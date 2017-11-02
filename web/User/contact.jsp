<%-- 
    Document   : contact
    Created on : Oct 13, 2017, 7:35:14 AM
    Author     : Jayashankar
--%>

<!DOCTYPE html>
<!--[if IE 7]>                  <html class="ie7 no-js" lang="en">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 

    <%
if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
<html class="not-ie no-js" lang="en">  <!--<![endif]-->
    <head>

        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Rent A Trip - Contact page</title>
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
        String userid=session.getAttribute("userid").toString();

            if(request.getParameter("submes") != null){
            String mes=request.getParameter("message");
            String s="insert into tbl_comment(user_id,comment) values('"+userid+"','"+mes+"')";
            boolean m=obj.insert(s);
            if(m){
                %>
                <script>
                    alert("Message sent.!");
                    window.location= "contact.jsp";
                </script>
                <%
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
                                                <h1>My ride</h1>
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

                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="page-sub-title textcenter">
                            <h2>Contact</h2>
                            <div class="line"></div>
                        </div><!-- end .page-sub-title -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->

                    <div class="col-md-9 col-sm-12 col-xs-12">

                        <div class="page-content">

                            <form id="cantact-form" autocomplete="off" class="idealforms">

                                <div class="field">
                                    <input name="username" type="text" placeholder="Name" required="required" />
                                    <span class="error"></span>
                                </div>

                                <div class="field">
                                    <input name="email" type="email" placeholder="Email address" required="required" />
                                    <span class="error"></span>
                                </div>

                                <div class="full-fild">
                                    <textarea name="message" id="message" cols="5" placeholder="Message" maxlength="300" rows="5" required="required"></textarea>
                                </div>

                                <div class="field buttons">
                                    <input type="submit" value="Send" name="submes" class="btn btn-lg blue-color" />
                                </div>

                                <span id="invalid"></span>

                            </form>

                        </div><!-- end .page-content -->

                    </div><!-- end .col-md-9 -->

                    <div class="col-md-3 col-sm-12 col-xs-12">

                        <aside id="sidebar" class="main-sidebar">

                            <div class="search-widget sidebar-widget">

                                <h4 class="widget-title">Search</h4>

                                <div class="widget-content">
                                    <form class="idealforms search-form adaptive" autocomplete="off" novalidate="" action="">
                                        <div class="field idealforms-field idealforms-field-email">
                                            <input type="text" placeholder="Text" name="search">
                                        </div>
                                        <div class="field buttons">
                                            <button class="btn btn-lg blue-color" type="submit">Search</button>
                                        </div>
                                    </form>
                                </div><!-- end .widget-content -->

                            </div><!-- end .archives-widget -->

                            <div class="archives-widget sidebar-widget">

                                <h4 class="widget-title">Archives</h4>

                                <div class="widget-content">
                                    <ul>
                                        <li><a href="#">November 2013</a> <span>(2)</span></li>
                                        <li><a href="#">October 2013</a> <span>(5)</span></li>
                                        <li><a href="#">September 2013</a> <span>(10)</span></li>
                                        <li><a href="#">August 2013</a> <span>(9)</span></li>
                                        <li><a href="#">July 2013</a> <span>(10)</span></li>
                                        <li><a href="#">June 2013</a> <span>(11)</span></li>
                                    </ul>
                                </div><!-- end .widget-content -->

                            </div><!-- end .archives-widget -->

                            <div class="calendar sidebar-widget">

                                <h4 class="widget-title">Calendar</h4>

                                <div class="widget-content">
                                    <div id="calendar_wrap">

                                        <div class="calendar-nav">
                                            <div  class="calendar-prev">
                                                <a href="#"></a>
                                            </div>
                                            <div class="calendar-next">
                                                <a href="#"></a>
                                            </div>
                                        </div>

                                        <table id="wp-calendar">
                                            <caption>October 2017</caption>
                                            <thead>
                                                <tr>
                                                    <th scope="col" title="Monday">Sa</th>
                                                    <th scope="col" title="Tuesday">Su</th>
                                                    <th scope="col" title="Wednesday">Mo</th>
                                                    <th scope="col" title="Thursday">Tu</th>
                                                    <th scope="col" title="Friday">Wd</th>
                                                    <th scope="col" title="Saturday">Th</th>
                                                    <th scope="col" title="Sunday">Fr</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <td colspan="1" class="pad">&nbsp;</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td>
                                                </tr>
                                                <tr>
                                                    <td>7</td><td>8</td><td>9</td><td>10</td><td>11</td><td>12</td><td>13</td>
                                                </tr>
                                                <tr>
                                                    <td>14</td><td>15</td><td>16</td><td>17</td><td>18</td><td>19</td><td>20</td>
                                                </tr>
                                                <tr>
                                                    <td>21</td><td>22</td><td>23</td><td>24</td><td id="today"><a href="">25</a></td><td>26</td><td>27</td>
                                                </tr>
                                                <tr>
                                                    <td>28</td><td>29</td><td>30</td>
                                                    <td class="pad" colspan="4">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div><!-- end .calendar_wrap -->
                                </div><!-- end .widget-content -->

                            </div><!-- end .sidebar-widget -->

                        </aside><!-- end .main-sidebar -->

                    </div><!-- end .col-md-3 -->

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

