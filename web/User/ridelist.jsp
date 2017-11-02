<!DOCTYPE html>
<!--[if IE 7]>                 <html class="ie7 no-js" lang="en">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
    <%
if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
%>
<html class="not-ie no-js" lang="en">  <!--<![endif]-->
    <head>
        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Select your ride</title>
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
        
        if (request.getParameter("submit") != null) {
//            String userid = session.getAttribute("userid").toString();
//            int seats=Integer.parseInt(request.getParameter("no_seats"));
//            
//            String sn="select * from tbl_request where trip_id='"+trid+"' and user_id='"+userid+"'";
//            ResultSet rss=obj.select(sn);
//            if(rss.first()){
//                %><script>alert("You've already requested.!");</script><%
//            }
//            else{
//                String ins="insert into tbl_request (trip_id,user_id,no_of_seats,status) values()";
//                Boolean b=obj.insert(ins);
//                if(b){
//                %><script>alert("Request Sent..!");</script><%
//                }
//            }
        }
        
        %>
        <script src="js/jquery.min.js"></script>
             <script>
                 function req(trid,sts,tf,tt){
                     $.ajax({url: "AjaxReq.jsp?id="+trid+"&st="+sts+"&from="+tf+"&to="+tt, success: function(result){
                             
                             var res=$.trim(result);
                           if(res=="true")
                           {
                               alert("Request Successfully sent..!");
                               window.location.href("http://localhost:8084/Rent_A_Trip/Admin/home.jsp");
                           }
                          else{
                              alert("Request already sent..!");
                              window.location.href("http://localhost:8084/Rent_A_Trip/Admin/ridelist.jsp");
                          }
                     //$("#show").html(result);
                     }});
                }
        </script>
        

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
                                                <h1>Rent A Trip</h1>
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
                                                        <a href="contact-page.html">Contact</a>
                                                    </li>
                                                </ul>

                                            </nav><!-- end .main-navigation -->

                                        </div><!-- end .col-md-8 -->

                                    </div><!-- end .main-header-container -->

                                </div><!-- end .row -->

        <section class="main-content">

            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="page-sub-title textcenter">
                            <h2>Rides</h2>
                            <div class="line"></div>
                        </div><!-- end .page-sub-title -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->

                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="page-content">

                            <div class="rides-list">
        
                                <%
                                String from = session.getAttribute("from").toString();
                                System.out.println(from);
                                String to = session.getAttribute("to").toString();
                                System.out.println(to);
                                String date = session.getAttribute("date").toString();
                                //String seats = session.getAttribute("seats").toString();
                                
                                String st1="select * from tbl_checkpoint where check_location='"+from+"'";
                                
                                ResultSet rs1=obj.select(st1);
                                int pr=0;
                                String tid="";
                                String trid="";
                                
                                while(rs1.next()){
                                    String points="";
                                    pr=rs1.getInt("check_priority");
                                    tid=rs1.getString("trip_id");
                                    
                                    String st11="select * from tbl_checkpoint where trip_id='"+tid+"' and check_priority > '"+pr+"' and check_location='"+to+"'";
                                    
                                    
                                    ResultSet rs11=obj.select(st11);
                                    if(rs11.next()){
                                        trid=rs11.getString("trip_id");
                                
                                String s="select * from tbl_checkpoint where trip_id='"+trid+"' ";
                                ResultSet s1=obj.select(s);
                                while(s1.next()){
                                    points=points+" -- "+s1.getString("check_location");
                                }
                                String st="select * from tbl_strip where strip_id='"+trid+"' and strip_date = '"+date+"'";
                                
                                ResultSet rs=obj.select(st);
                                String vehid="";
                                String trfrom="";
                                String trto="";
                                String trtime="";
                                if(rs.next()){
                                vehid=rs.getString("vehicle_id");
                                trfrom=rs.getString("strip_from");
                                trto=rs.getString("strip_to");
                                trtime=rs.getString("strip_time");
                                }
                                String st2="select * from tbl_vehicle where vehicle_id='"+vehid+"'";
                                
                                ResultSet r=obj.select(st2);
                                String userid="";
                                String typeid="";
                                if(r.next()){
                                userid=r.getString("user_id");
                                typeid=r.getString("type_id");
                                }
                                String st3="select * from tbl_users where user_id='"+userid+"'";
                                ResultSet rst=obj.select(st3);
                                String fn="";
                                String ln="";
                                String ph="";
                                if(rst.next()){
                                fn=rst.getString("firstname");
                                ln=rst.getString("lastname");
                                ph=rst.getString("phone");
                                }
                                String st4="select * from tbl_type where type_id='"+typeid+"'";
                                ResultSet rsst=obj.select(st4);
                                String tn="";
                                int ns=0;
                                String catid="";
                                if(rsst.next()){
                                tn=rsst.getString("type_name");
                                ns=rsst.getInt("type_no_seats");
                                catid=rsst.getString("category_id");
                                }
                                String st5="select * from tbl_category where category_id='"+catid+"'";
                                ResultSet rs5=obj.select(st5);
                                String cat="";
                                if(rs5.next()){
                                cat=rs5.getString("category");
                                }
                                %>
                                <form>
                                <article class="ride-box clearfix">

                                    <div class="ride-content">                                        
                                        <h3><a href="#">From <%=trfrom%> to <%=trto%></a></h3>ride by <a href="#"><%
                                            String userid_user=session.getAttribute("userid").toString();
                                            if(userid_user==userid){
                                            %> You <%
                                            }
                                            else{%><%=fn%>
                                            <%
                                            }
                                            %> &nbsp; <%=ln%></a> &nbsp; Phone : <%=ph%>
                                        <br>CheckPoints : <%=points%><br>Type : <%=tn%> &nbsp; <%=cat%>
                                         
                                            <select required="required" name="no_seats" >
                                                <option value="0">Select Seats</option>
                                                    <%
                                                        for(int i=1;i<=ns;i++){
                                                            %><option value="<%=i%>"><%=i%></option><%
                                                        }
                                                        
                                                    %>
                                                </select>
                                                <select name="tfrom">
                                                    <option>Select from Location</option>
                                                    <%String s12="select * from tbl_checkpoint where trip_id='"+trid+"' ";
                                                        ResultSet s11=obj.select(s12);
                                                        while(s11.next()){
                                                             String point=s11.getString("check_location");
                                                    %>
                                                    <option><%=point%></option>
                                                    <%  }%>
                                                </select>
                                                <select name="tto">
                                                    <option>Select To Location</option>
                                                    <%String s13="select * from tbl_checkpoint where trip_id='"+trid+"' ";
                                                        ResultSet s14=obj.select(s13);
                                                        while(s14.next()){
                                                             String point=s14.getString("check_location");
                                                    %>
                                                    <option><%=point%></option>
                                                    <%  }%>
                                                </select>
                                         
                                    </div>
                                    
                                    <ul class="ride-meta">
                                                
                                        <li class="ride-date">
                                                
                                                <i class="fa fa-calendar"></i>
                                                
                                                <%=date%> &nbsp; <%=trtime%>
                                                
                                        </li><!-- end .ride-date --> 
                                        <li class="ride-people">
                                            <a href="#" class="tooltip-link" data-original-title="Number of seats" data-toggle="tooltip">
                                                <i class="fa fa-user"></i>
                                                <%=ns%>
                                            </a>
                                        </li><!-- end .ride-people -->

                                        <li>
                                            
                                            
                                            <input type="button" name="submit" onclick="req(<%=trid%>,no_seats.value,tfrom.value,tto.value)" value="Request">
                                           
                                        </li>

                                    </ul><!-- end .ride-meta -->
                                </article><!-- end .ride-box -->
                            </form>
<%    
                                }
                                }
                                        %>
                                        
                                <div class="clearfix"></div>

                                <div class="post-pagination pagination-margin clearfix">

                                    <div class="next pull-right">
                                        <a href="#">
                                            Next
                                            <i class="fa fa-chevron-right"></i>
                                        </a>
                                    </div>

                                </div><!-- end .post-pagination -->

                            </div><!-- end .events-list -->

                        </div><!-- end .page-content -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->

                </div><!-- end .row -->
            </div><!-- end .container -->

        </section><!-- end .main-content -->

        <footer id="footer">

            <div class="footer-copyright">

                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            Copyright by My ride
                        </div>

                    </div><!-- end .row -->
                </div><!-- end .container -->

            </div><!-- end .footer-copyright -->
          
        </footer><!-- end #footer -->

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div><!-- end .modal-header -->

                    <div class="modal-body">
                        <form action="" novalidate autocomplete="off" class="idealforms login">

                            <div class="log-header">
                                <span class="log-in">Log in</span>
                            </div>

                            <div class="field">
                                <input name="username" type="text" placeholder="Username">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input type="password" name="password" placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field buttons">
                                <button type="submit" class="submit btn green-color">Log in</button>
                            </div>

                            <a href="#" class="log-twitter twitter"><i class="fa fa-twitter"></i>Twitter</a>
                            <a href="#" class="log-facebook facebook"><i class="fa fa-facebook"></i>Facebook</a>

                            <div class="clearfix"></div>

                        </form><!-- end .login -->
                    </div><!-- end .modal-body -->

                </div><!-- end .modal-content -->
            </div><!-- end .modal-dialog -->
        </div><!-- end .modal -->

        <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <div class="modal-body">
                        <form action="" novalidate autocomplete="off" class="idealforms reg">

                            <div class="log-header">
                                <span class="log-in">Sign up</span>
                            </div>

                            <div class="field">
                                <input name="username" type="text" placeholder="Username">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input name="email" type="email"  placeholder="E-Mail">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input type="password" name="password" placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input name="confirmpass" type="password"  placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field buttons">
                                <button type="submit" class="submit btn green-color">Sign up</button>
                            </div>

                            <div class="clearfix"></div>

                        </form><!-- end .reg -->
                    </div><!-- end .modal-body -->

                </div><!-- end .modal-content -->
            </div><!-- end .modal-dialog -->
        </div><!-- end .modal -->

        <!-- Javascript -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Main jQuery -->
        <script type="text/javascript" src="js/jquery.main.js"></script>
        <!-- Form -->
        <script type="text/javascript" src="js/jquery.idealforms.min.js"></script>
        <script type="text/javascript" src="js/jquery.idealselect.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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
                            </section></div></div></div></div></header>
    </body>
</html>
