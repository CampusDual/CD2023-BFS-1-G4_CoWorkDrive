package com.campusdual.coworkdrive.model.core.service;

import com.campusdual.coworkdrive.model.core.dao.BookingDao;
import com.campusdual.coworkdrive.model.core.dao.UserDao;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

@Lazy
public class MailServiceApi {
    @Autowired
    private static BookingDao bookingDao;
    @Autowired
    private static UserDao userDao;
    @Autowired
    private static DefaultOntimizeDaoHelper daoHelper;

    public static void sendWithGMail(String destinatario, String asunto, String cuerpo) {
        //La dirección de correo de envío
        String remitente = "genioscoruna@gmail.com";
        //La clave de aplicación obtenida según se explica en este artículo:
        String claveemail = "eeybcdywsrmxqcmp";

        Properties props = System.getProperties();
        props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
        props.put("mail.smtp.user", remitente);
        props.put("mail.smtp.clave", claveemail);    //La clave de la cuenta
        props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
        props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
        props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(remitente));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));   //Se podrían añadir varios de la misma manera
            message.setSubject(asunto);
            message.setText(cuerpo);
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", remitente, claveemail);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (MessagingException me) {
            me.printStackTrace();
        }
    }

    public static void sendMailDriverTrip(String emailDriver,String titleMailDriver,String bodyMailDriver){
        MailServiceApi.sendWithGMail(emailDriver,titleMailDriver, bodyMailDriver);
    }

    public static void sendMailPassengerTrip(String emailPassenger,String titleMailPassenger,String bodyMailPassenger){
        MailServiceApi.sendWithGMail(emailPassenger,titleMailPassenger, bodyMailPassenger);
    }
    public static void sendMails(ArrayList<String> emailData){
        String titleMailDriver, bodyMailDriver, titleMailPassenger, bodyMailPassenger;
        String emailDriver = emailData.get(0);
        String emailPassenger = emailData.get(1);
        String namePassenger =  emailData.get(2);
        String dateTrip = emailData.get(3);
        String originTitle = emailData.get(4);
        String destinationTitle = emailData.get(5);
        String action = emailData.get(6);

        switch(action){
            case "insertBooking":
                titleMailDriver = "¡Han hecho una nueva reserva!";
                bodyMailDriver = namePassenger + " ha hecho una reserva para el viaje con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;
                titleMailPassenger = "¡Has confirmado tu reserva!";
                bodyMailPassenger = namePassenger + " has hecho una reserva para el viaje con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;

                MailServiceApi.sendMailDriverTrip(emailDriver, titleMailDriver, bodyMailDriver);
                MailServiceApi.sendMailPassengerTrip(emailPassenger, titleMailPassenger, bodyMailPassenger);
                break;
            case "modifyTrip":
                titleMailPassenger = "¡Han hecho una modificación!";
                bodyMailPassenger = namePassenger + ", han modificado tu reserva para el viaje con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;

                MailServiceApi.sendMailPassengerTrip(emailPassenger, titleMailPassenger, bodyMailPassenger);
                break;
            case "deleteBooking":
                titleMailDriver = "¡Un pasajero se ha dado de baja!";
                bodyMailDriver = namePassenger + " ha cancelado la reserva para el viaje con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;
                titleMailPassenger = "¡Has cancelado tu reserva!";
                bodyMailPassenger = namePassenger + " has cancelado la reserva para el viaje con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;

                MailServiceApi.sendMailDriverTrip(emailDriver, titleMailDriver, bodyMailDriver);
                MailServiceApi.sendMailPassengerTrip(emailPassenger, titleMailPassenger, bodyMailPassenger);
                break;
            case "deleteTrip":
                titleMailPassenger = "¡Han eliminado un viaje!";
                bodyMailPassenger = namePassenger + ", han eliminado el viaje en el que tenías una reserva con fecha " + dateTrip + " desde " + originTitle + " hasta " + destinationTitle;

                MailServiceApi.sendMailPassengerTrip(emailPassenger, titleMailPassenger, bodyMailPassenger);
                break;
        }
    }
}
