package model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import model.dao.MemberDao;
import model.dao.OrderDao;
import model.dao.ShopDao;

@Service(value = "shopServices")
@Transactional
public class ShopServices {
	@Autowired
	@Resource(name = "shopDao")
	ShopDao shopDao;

	@Autowired
	@Resource(name = "memberDao")
	MemberDao memberDao;

	@Autowired
	@Resource(name = "OrderDao")
	OrderDao orderDao;

	public OrderBean newOrderAndDetail(OrderBean orderBean, String mbrSN, String orderAmount,
			Map<String, OrderDetailBean> car) throws ParseException {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSX");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, +3);

		System.err.println("mbrSN =  " + mbrSN);
		orderBean.setMbrSN(Integer.parseInt(mbrSN));
		orderBean.setOrderAmount(Integer.parseInt(orderAmount));
		orderBean.setOrderDate(new java.util.Date(System.currentTimeMillis()));
		orderBean.setOrderState("未付款");
		orderBean.setPaymentMethod("超商取貨付款");
		orderBean.setFreight(100);
		orderBean.setProductDelivery(df.parse(df.format(cal.getTime())).toString());
		orderBean.setShippedDate(df.parse(df.format(cal.getTime())));
		return orderDao.save(orderBean, car);
	}

	public ShopBean select(int id) {
		return shopDao.select(id);
	}

	public MemberBean checkMember(String user, String pass) {
		MemberBean memberBean = memberDao.select(user);
		if (memberBean == null) {
			return null;
		}
		if (pass.trim().equals(memberBean.getMbrPassword().trim())) {
			return memberBean;
		} else {
			return null;
		}
	}

	public List<ShopBean> selectAll(String id) {// 進行比對
		switch (id) {
		case "1":
			id = "";
			return shopDao.select(id);
		case "2":
			id = "where Gameclass like '%自有商品%'";
			return shopDao.select(id);
		case "3":
			id = "where Gameclass like '%派對遊戲%'";
			return shopDao.select(id);
		case "4":
			id = "where Gameclass like '%親子桌遊%'";
			return shopDao.select(id);
		case "5":
			id = "where Gameclass like '%輕度策略%'";
			return shopDao.select(id);
		case "6":
			id = "where Gameclass like '%重度策略%'";
			return shopDao.select(id);
		case "7":
			id = "where Gameclass like '%台灣原創%'";
			return shopDao.select(id);
		case "8":
			id = "where Gameclass like '%麥卡貝推%'";
			return shopDao.select(id);
		case "9":
			id = "where Gameclass like '%卡套%'";
			return shopDao.select(id);
		}
		return shopDao.select("1");
	}


	public void sendMain(String name, String image, String OrderEmail) throws MessagingException, IOException {
		int port = 587;
		final String username = "flipyoutheeit90@gmail.com";
		final String password = "iiieeit90";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", port);
		MimeBodyPart textPart = new MimeBodyPart();
		StringBuffer html = new StringBuffer();
		MimeBodyPart picturePart = new MimeBodyPart();
		addMsg(image,name,html, picturePart);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		textPart.setContent(html.toString(), "text/html; charset=UTF-8");
		Message message = new MimeMessage(session);
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("flipyoutheeit90@gmail.com"));
		message.setSubject("測試寄信.");
		Multipart email = new MimeMultipart();
		email.addBodyPart(textPart);
		email.addBodyPart(picturePart);
		message.setContent(email);

		Transport transport = session.getTransport("smtp");
		transport.connect("smtp.gmail.com", port, username, password);
		Transport.send(message);
		System.out.println("寄送email結束.");
	}

	public static void addMsg(String image,String name,StringBuffer html, MimeBodyPart picturePart) throws MessagingException, IOException {
		html.append("<h4>親愛的 " + name + "您好：</h4>");
		html.append("<h4>期望您有美好的購物經驗，欲查詢出貨進度，請使用訂單查詢功能</h4>");
		html.append("<h4>如有其他問題，歡迎來電客服，我們有專人為您服務。</h4>");
		html.append("<img style='width:500px' src='cid:image'/><br>");
		FileDataSource fds = new FileDataSource("C:\\1.jpg");
		//image
		
		byte[] bytearray = Base64.decode(image);
		
		BufferedImage imag = ImageIO.read(new ByteArrayInputStream(bytearray));
		ImageIO.write(imag, "PNG", new File("C:\\mailImage.jpg"));

		picturePart.setDataHandler(new DataHandler(new FileDataSource("C:\\mailImage.jpg")));
		picturePart.setFileName(fds.getName());
		picturePart.setHeader("Content-ID", "<image>");

	}
}
