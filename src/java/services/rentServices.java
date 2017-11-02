/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import DB.DBConnection;
import DB.LatLng;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Jayashankar
 */
@WebService(serviceName = "rentServices")
public class rentServices {
    DBConnection con=new DBConnection();
    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "login")
    public String login(@WebParam(name = "username") String username, @WebParam(name = "password") String password) {
        String st="false:0";
        String sel="select * from tbl_users where username='"+username+"' and password='"+password+"'";
        ResultSet rs=con.select(sel);
        try {
            if(rs.next())
            {
                st="true:"+rs.getString("user_id");
            }
                
                
                //TODO write your implementation code here:
                
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
        return st;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "triplist")
    public String triplist(@WebParam(name = "uid") String uid) {
        JSONArray arr=new JSONArray();
        //TODO write your implementation code here:
        String l="";
        String s1="select * from `tbl_request` r inner join `tbl_strip` s on r.trip_id=s.strip_id and s.strip_date>CURDATE() and r.status=1 and r.user_id='"+uid+"'";
        ResultSet r1=con.select(s1);
        try {
            r1.last();
            int i=0;
            
            JSONObject ob[]=new JSONObject[r1.getRow()];
            r1.beforeFirst();
            
            while(r1.next()){
                ob[i]=new JSONObject();
                ob[i].put("strip_id", r1.getString("s.strip_id"));
                ob[i].put("strip_from", r1.getString("s.strip_from"));
                ob[i].put("strip_to", r1.getString("s.strip_to"));
                ob[i].put("strip_date", r1.getString("s.strip_date"));
                ob[i].put("strip_time", r1.getString("s.strip_time"));
                arr.put(ob[i]);
                i++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "checkpoints")
    public String checkpoints(@WebParam(name = "trid") String trid) {
        JSONArray ar=new JSONArray();
        //TODO write your implementation code here:
        String s2="select * from tbl_checkpoint where trip_id='"+trid+"'";
        ResultSet r2=con.select(s2);
        try {
            r2.last();
            int i=0;
            
            JSONObject obj[]=new JSONObject[r2.getRow()];
            r2.beforeFirst();
            
            while(r2.next()){
            obj[i]=new JSONObject();
            obj[i].put("lat",r2.getString("checkpoint_lat"));
            obj[i].put("lng",r2.getString("checkpoint_lon"));
            ar.put(obj[i]);
            i++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return ar+"";
    }
    
    @WebMethod(operationName = "tripreg")
    public String tripreg(@WebParam(name = "tfrom") String tfrom, @WebParam(name = "tto") String tto, @WebParam(name = "tdate") String tdate,@WebParam(name = "ttime") String ttime, @WebParam(name = "vid") String vid) {
            LatLng lat=new LatLng();
           String from[]={},to[]={};
        try {
            from = lat.getLatLongPositions(tfrom);
            to = lat.getLatLongPositions(tto);
        } catch (Exception ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
            String sel="insert into tbl_strip(vehicle_id,strip_from,strip_to,strip_date,strip_time,strip_from_lat,strip_from_lon,strip_to_lat,strip_to_lon) values"
                    +"('"+vid+"','"+tfrom+"','"+tto+"','"+tdate+"','"+ttime+"','"+from[0]+"','"+from[1]+"','"+to[0]+"','"+to[1]+"')";
          boolean b=  con.insert(sel);
            String selq="select MAX(`strip_id`) as `strip_id`  from `tbl_strip`";
            ResultSet rsq=con.select(selq);
            String id="";
        try {
            if(rsq.next())
            {
                id=rsq.getString("strip_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
            
    return b+":"+id;
    }   
    
    
@WebMethod(operationName = "veh_select")
public String veh_select(@WebParam(name="userid") String uid){
    JSONArray arr=new JSONArray();
    String s="select * from tbl_vehicle where user_id='"+uid+"'";
    ResultSet rs=con.select(s);
        try {
            
            rs.last();
            int i=0;
            
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();
            
            while(rs.next()){
                
                obj[i]=new JSONObject();
                obj[i].put("regno",rs.getString("vehicle_reg"));
                obj[i].put("id",rs.getString("vehicle_id"));
                arr.put(obj[i]);
                i++;
            }   } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
    return arr+"";
}
    
    @WebMethod(operationName = "register")
    public String register(@WebParam(name = "fname") String fname,@WebParam(name = "lname") String lname,@WebParam(name = "username") String username,@WebParam(name = "password") String password,@WebParam(name = "email") String email,@WebParam(name = "phone") String phone){
        String s="insert into tbl_users(firstname,lastname,username,password,email,phone) values('"+fname+"','"+lname+"','"+username+"','"+password+"','"+email+"','"+phone+"')";
        String re="failed";
        boolean r=con.insert(s);
        if(r){
            re="Registered";
        }
        return re;
    }
    
    @WebMethod(operationName = "addvehicle")
    public String addvehicle(@WebParam(name = "vehicle_reg") String vehicle_reg, @WebParam(name = "license_number") String license_number,@WebParam(name = "userid") String userid,@WebParam(name = "typeid") String typeid,@WebParam(name = "color") String color){
        
        String in="insert into tbl_vehicle(vehicle_reg,user_id,type_id,vehicle_color) values('"+vehicle_reg+"','"+userid+"','"+typeid+"','"+color+"')";
                
        String inn="update  tbl_users set user_license='"+license_number+"' where user_id='"+userid+"'";
        String re="failed";
        boolean r=con.insert(in);
       
        if(r){
            if( con.insert(inn))
            re="Registered";
        }
        return re;   
    }
 
    @WebMethod(operationName = "searchtrip")
    public String searchtrip(@WebParam(name = "from") String from,@WebParam(name = "to") String to,@WebParam(name = "date") String date){
        JSONArray array=new JSONArray();
        
        String st1="select * from tbl_checkpoint chek inner join tbl_strip st on st.strip_id=chek.trip_id and st.strip_date='"+date+"'   where check_location='"+from+"' ";
        ResultSet rsq=con.select(st1);
        try {
            JSONObject ob[]=new JSONObject[100];
             int i=0;
            while(rsq.next())
            {boolean st=false;
                String selq="select * from tbl_checkpoint where trip_id='"+rsq.getString("strip_id")+"' and check_priority>'"+rsq.getInt("check_priority")+"' and check_location='"+to+"'";
            ResultSet rsqq=con.select(selq);
            rsqq.last();
           
            
            
            rsqq.beforeFirst();
            if(rsqq.next())
            {
               st=true;
            }
            if(st){
             ob[i]=new JSONObject();
                    try {
                        ob[i].put("tripid",rsqq.getString("trip_id"));
                        ob[i].put("strip_from",rsq.getString("strip_from"));
                        ob[i].put("strip_to",rsq.getString("strip_to"));
                        ob[i].put("strip_time",rsq.getString("strip_time"));
                        
                    } catch (JSONException ex) {
                        Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                    }
                
                array.put(ob[i]);
                i++;
            }
            }
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
            
           
        return array+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "AllcheckPoints")
    public String AllcheckPoints(@WebParam(name = "tripId") String tripId) {
        JSONArray arr=new JSONArray();
        String sel="select * from tbl_checkpoint where trip_id='"+tripId+"' ORDER by(check_priority) ASC";
        ResultSet rs=con.select(sel);
        try {
             rs.last();
            int i=0;
            
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();    
            while(rs.next())
            {
                
                obj[i]=new JSONObject();
                 try {
                     obj[i].put("check_location",rs.getString("check_location"));
                     //obj[i].put("id",rs.getString("vehicle_id"));
                 } catch (JSONException ex) {
                     Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                 }

                arr.put(obj[i]);
                i++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "select_category")
    public String select_category() {
        JSONArray arr=new JSONArray();
        String ss="select * from tbl_category";
        ResultSet rs=con.select(ss);
        try {
            rs.last();
            int i=0;
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();
            
            while(rs.next()){
                obj[i]=new JSONObject();
                try {
                    obj[i].put("categoryName",rs.getString("category"));
                     obj[i].put("categoryID",rs.getString("category_id"));
                } catch (JSONException ex) {
                    Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                }
                arr.put(obj[i]);
                i++;
            }
               
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
         return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "select_type")
    public String select_type(@WebParam(name = "category_id") String category_id) {
        JSONArray arr=new JSONArray();
        String ss="select * from tbl_type where category_id='"+category_id+"' ";
        ResultSet rs=con.select(ss);
        try {
            rs.last();
            int i=0;
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();
            
            while(rs.next()){
                obj[i]=new JSONObject();
                try {
                    obj[i].put("type_name",rs.getString("type_name"));
                    obj[i].put("type_no_seats",rs.getString("type_no_seats"));
                    obj[i].put("type_id",rs.getString("type_id"));
                } catch (JSONException ex) {
                    Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                }
                arr.put(obj[i]);
                i++;
            }
               
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
         return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "trip_request")
    public String trip_request(@WebParam(name = "trip_id") String trip_id, @WebParam(name = "user_id") String user_id, @WebParam(name = "noofseats") String noofseats, @WebParam(name = "tripfrom") String tripfrom, @WebParam(name = "tripto") String tripto) {
        String ss="insert into tbl_request (trip_id,user_id,no_of_seats,trip_from,trip_to) values('"+trip_id+"','"+user_id+"','"+noofseats+"','"+tripfrom+"','"+tripto+"')";
        String re="false: request failed";
        boolean r=con.insert(ss);
        if(r){
            re="true:request sent";
        }
        return re;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "deleterequest")
    public String deleterequest(@WebParam(name = "request_id") String request_id) {
        String ss="delete from tbl_request where request_id='"+request_id+"'";
        boolean b=con.insert(ss);
        String r="request not deleted";
        if(b)
            r="Request deleted";
        return r;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "approverequest")
    public String approverequest(@WebParam(name = "request_id") String request_id,@WebParam(name = "status") String status) {
         String ss="update tbl_request set status='"+status+"' where request_id='"+request_id+"'";
         boolean b= con.insert(ss);
        
        return b+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "DriverViewRequest")
    public String DriverViewRequest(@WebParam(name = "userId") String userId) {
        JSONArray arr=new JSONArray();
        String se="select * from  tbl_strip s inner join tbl_vehicle v on s.vehicle_id=v.vehicle_id inner join tbl_request r on r.trip_id=s.strip_id inner join tbl_users u on u.user_id=r.user_id where v.user_id='"+userId+"'";
        ResultSet rs=con.select(se);
            try {
            rs.last();
            int i=0;
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();
            
            while(rs.next()){
                obj[i]=new JSONObject();
                try {
                    obj[i].put("from", rs.getString("strip_from"));
                    obj[i].put("to", rs.getString("strip_to"));
                    obj[i].put("tfrom",rs.getString("trip_from"));
                    obj[i].put("tto",rs.getString("trip_to"));
                    obj[i].put("seats",rs.getString("no_of_seats"));
                    obj[i].put("tdate",rs.getString("strip_date"));
                    obj[i].put("user",rs.getString("firstname")+" "+rs.getString("lastname"));   
                    obj[i].put("reqId",rs.getString("request_id"));
                    obj[i].put("phone",rs.getString("phone"));
                } catch (JSONException ex) {
                    Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                }
                arr.put(obj[i]);
                i++;
            }
               
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
         return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "myrequests")
    public String myrequests(@WebParam(name = "userId") String userId) {
    JSONArray arr=new JSONArray();
   String sel="select * from tbl_request r,tbl_strip s,tbl_vehicle v,tbl_users u where r.trip_id=s.strip_id and v.vehicle_id=s.vehicle_id and u.user_id=v.user_id and  s.strip_date>CURDATE() and r.user_id='"+userId+"'";
        ResultSet rs=con.select(sel);
            try {
            rs.last();
            int i=0;
            JSONObject obj[]=new JSONObject[rs.getRow()];
            rs.beforeFirst();
            
            while(rs.next()){
                obj[i]=new JSONObject();
                try {
                    obj[i].put("tfrom",rs.getString("r.trip_from"));
                    obj[i].put("tto",rs.getString("r.trip_to"));
                    obj[i].put("seats",rs.getString("r.no_of_seats"));
                    obj[i].put("tdate",rs.getString("s.strip_date"));
                    obj[i].put("fname",rs.getString("u.firstname")+" "+rs.getString("u.lastname"));
                    obj[i].put("reqid",rs.getString("r.request_id"));
                    
                } catch (JSONException ex) {
                    Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
                }
                arr.put(obj[i]);
                i++;
            }
               
        } catch (SQLException ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }
         return arr+"";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "addCheckpoint")
    public String addCheckpoint(@WebParam(name = "check_location") String check_location, @WebParam(name = "check_priority") String check_priority, @WebParam(name = "trip_id") String trip_id) {
      LatLng lat=new LatLng();
           String from[]={},to[]={};
        try {
            from = lat.getLatLongPositions(check_location);
         System.out.println(from[0]);
        } catch (Exception ex) {
            Logger.getLogger(rentServices.class.getName()).log(Level.SEVERE, null, ex);
        }

String sel="insert into `tbl_checkpoint` (`check_location`,`check_priority`,`trip_id`,`checkpoint_lat`,`checkpoint_lon`) values('"+check_location+"','"+check_priority+"','"+trip_id+"','"+from[0]+"','"+from[1]+"')";   
boolean b=con.insert(sel);
return b+"";
    }


    
    
}
