    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DB;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

/**
 *
 * @author ANOOP
 */
public class mailconnection {
public synchronized static boolean sendMail(String to[],String subject,String text){
            
System.out.println("mail  "+to+" "+subject+" "+text);
String host="smtp.gmail.com";
String port="465";
String starttls="true";
String auth="true";
boolean debug=true;
String socketFactoryClass="javax.net.ssl.SSLSocketFactory";
String fallback="false";
String userName="airlinetickets16@gmail.com";
String passWord="airline2017";
     
        Properties props = new Properties();
                //Properties props=System.getProperties();
        props.put("mail.smtp.user", userName);
        props.put("mail.smtp.host", host);
                if(!"".equals(port))
        props.put("mail.smtp.port", port);
                if(!"".equals(starttls))
        props.put("mail.smtp.starttls.enable",starttls);
        props.put("mail.smtp.auth", auth);
                if(debug){
                props.put("mail.smtp.debug", "true");
                }else{
                props.put("mail.smtp.debug", "false");
                }
                if(!"".equals(port))
        props.put("mail.smtp.socketFactory.port", port);
                if(!"".equals(socketFactoryClass))
        props.put("mail.smtp.socketFactory.class",socketFactoryClass);
                if(!"".equals(fallback))
        props.put("mail.smtp.socketFactory.fallback", fallback);

        try
        {
            Session session = Session.getDefaultInstance(props, null);
            session.setDebug(debug);
            MimeMessage msg = new MimeMessage(session);
            msg.setText(text);
            msg.setSubject(subject);
       
                      for(int i=0;i<to.length;i++){
                          System.out.println("mail id : "+to[i]);
                          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));
                        }
System.out.println("mailing");
            msg.saveChanges();
                        Transport transport = session.getTransport("smtp");
                        transport.connect(host, userName, passWord);
                        transport.sendMessage(msg, msg.getAllRecipients());
                        transport.close();
                        System.out.println("mail sent");
                        return true;
        }
        catch (Exception mex)
        {
            mex.printStackTrace();
                        return false;
        }
        }

}

    

