package model;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

public class MailSenderBean implements Runnable {
	private String email;
	private byte[] activatedCode;
	private String id;

	@Override
	public void run() {
		sendEmail();
	}

	public MailSenderBean(String email, byte[] activatedCode, String id) {
		this.email = email;
		this.activatedCode = activatedCode;
		this.id = id;
	}

	public void sendEmail() {
		StringBuilder hashCode = new StringBuilder(); // 建立一個StringBuilder
		
		for(byte b : activatedCode)
        {
            String temp = Integer.toHexString(b & 0xff);
            if(temp.length() == 1)
            {
                temp = "0" + temp;
            }
            hashCode.append(temp);
        }
		
//		for (byte c : activatedCode) {
//			hashCode.append(Integer.toHexString(c));
//		}

//		String url = new StringBuilder("http://localhost:8080/FlipYouth/checkActivatedCode.controller?id=").append(id)
//				.append("&actCode=").append(hashCode.toString()).toString();

		String url = new StringBuilder("https://flipyouth.southeastasia.cloudapp.azure.com/FlipYouth/checkActivatedCode.controller?id=").append(id)
				.append("&actCode=").append(hashCode.toString()).toString();
		System.out.println(hashCode.toString());
		try {
			Properties props = new Properties();
			// Properties props = System.getProperties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.fallback", "false");

			Session mailSession = Session.getDefaultInstance(props, null);

			Message mailMessage = new MimeMessage(mailSession);
			

			mailMessage.setFrom(new InternetAddress("flipyoutheeit90@gmail.com"));
			mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(this.email));
			mailMessage.setContent("<h1>你好" + id + "!!</h1><br><h3>歡迎您成為FlipYouth的會員。謝謝您的加入，祝翻桌愉快~</h3> <br><a href='" + url + "'>請點擊以激活帳號</a> ",
					"text/html;charset=UTF-8");
			try {
				mailMessage.setSubject( MimeUtility.encodeText( "wellcome to FlipYouth "));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Transport transport = mailSession.getTransport("smtp");

			transport.connect("smtp.gmail.com", "FlipYouthEEIT90", "iiieeit90");

			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());

		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		// **************************************************
		// 文字部份，注意 img src 部份要用 cid:接下面附檔的header
		// MimeBodyPart textPart = new MimeBodyPart();
		// StringBuffer html = new StringBuffer();
		// html.append("<h2>這是第一行</h2><br>");
		// html.append("<h3>這是第二行，下面會是圖</h3><br>");
		// html.append("<img src='cid:image'/><br>");
		// textPart.setContent(html.toString(), "text/html; charset=UTF-8");
		//
		// // 圖檔部份，注意 html 用 cid:image，則header要設<image>
		// MimeBodyPart picturePart = new MimeBodyPart();
		// FileDataSource fds = new FileDataSource("YourPictureFile.jpg");
		// picturePart.setDataHandler(new DataHandler(fds));
		// picturePart.setFileName(fds.getName());
		// picturePart.setHeader("Content-ID", "<image>");
		//
		// Multipart email = new MimeMultipart();
		// email.addBodyPart(textPart);
		// email.addBodyPart(picturePart);
		//
		// message.setContent(email);
		// message.addRecipient(Message.RecipientType.TO, new InternetAddress(
		// "youremail@address"));
		// transport.connect();
		// transport.sendMessage(message,
		// message.getRecipients(Message.RecipientType.TO))
		// ;
		// transport.close();

	}

}
