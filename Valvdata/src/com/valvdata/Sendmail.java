package com.valvdata;


import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

public class Sendmail {
	
	public void sendemailevent(final String from, String to, String cc, String bcc, String subjet, String body,
			String fname) {

		// final String s=from;
		// Get system properties
		Properties properties = System.getProperties();
		// Setup mail server
	//	properties.setProperty("mail.smtp.host", "email.ktree.us");

		// Get the default Session object.
		// Session session = Session.getDefaultInstance(properties);
		Session session = Session
				.getInstance(properties , new javax.mail.Authenticator() {
										  protected PasswordAuthentication
										  getPasswordAuthentication() { return
										  new PasswordAuthentication( from,"balajibollam14@"); } }
										 );
		// properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp.gmail.com?
		properties.put("mail.smtp.starttls.enable", "true");
		System.out.println("Tring to connect to Port:"+587+"\n");
		properties.put("mail.smtp.port",587);
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			String tomail[] = to.split(";");
			for (int i = 0; i < tomail.length; i++)
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(tomail[i]));

			String bccmail[] = bcc.split(";");
			for (int k = 0; k < bccmail.length; k++)
			message.addRecipient(RecipientType.BCC, new InternetAddress(bccmail[k]));

			String ccmail[] = cc.split(";");
			for (int j = 0; j < ccmail.length; j++)
				message.addRecipient(RecipientType.CC, new InternetAddress(ccmail[j]));

			// Set Subject: header field
			message.setSubject(subjet);

			// Now set the actual message
			BodyPart messageBodyPart = new MimeBodyPart();

			// messageBodyPart.setText(body);
			messageBodyPart.setContent(body, "text/html; charset=utf-8");

			// Create a multipar message
			Multipart multipart = new MimeMultipart();
			// Set text message part

			multipart.addBodyPart(messageBodyPart);

			/*messageBodyPart = new MimeBodyPart();
			String filename = fname;
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(new File(filename).getName());

			multipart.addBodyPart(messageBodyPart);*/

			// Send the complete message parts
			message.setContent(multipart);

			// Send message
			Transport.send(message);
			// Send message
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
	/*
	 * public static void main(String arg[]){ sendemail st=new sendemail();
	 * System.out.println("object is:::"+st.hashCode());
	 * st.sendemailevent("bollam.balaji@ktree.us",
	 * "bollam.balaji@ktree.us","test","test"); }
	 */

}
