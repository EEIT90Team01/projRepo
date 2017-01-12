package model.service;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.util.DigestUtils;

@Service(value = "tempService")
public class TempService {

	private static final byte[] GIF89AMAGNUM = DatatypeConverter.parseHexBinary("474946383961");
	private static final byte[] GIF87AMAGNUM = DatatypeConverter.parseHexBinary("474946383761");
	private static final byte[] PNGMAGNUM = DatatypeConverter.parseHexBinary("89504E470D0A1A0A");
	private static final byte[] JPEGMAGNUM = DatatypeConverter.parseHexBinary("FFD8");

	@Autowired
	private ServletContext context;

	private String rootPath;

	public String getRootPath() {
		return rootPath;
	}

	@PostConstruct
	public void init() {
		this.rootPath = context.getRealPath(File.separator);
	}

	public String byteArrayToTempImgOnlySrc(byte[] image, int width, int height) throws IOException {
		String ext = "";
		if (Arrays.equals(GIF89AMAGNUM, Arrays.copyOfRange(image, 0, 6))
				|| Arrays.equals(GIF87AMAGNUM, Arrays.copyOfRange(image, 0, 6))) {
			ext = ".gif";
		} else if (Arrays.equals(PNGMAGNUM, Arrays.copyOfRange(image, 0, 8))) {
			ext = ".png";
		} else if (Arrays.equals(JPEGMAGNUM, Arrays.copyOfRange(image, 0, 2))) {
			ext = ".jpg";
		}
		String relPath = "/image/" + DigestUtils.md5DigestAsHex(image) + ext;
		String filePath = getRootPath() + relPath;
		File imgFile = new File(filePath.replace("/", File.separator));

		if (!imgFile.exists()) {
			imgFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(imgFile);
			if (!(width == 0 && height == 0)) {
				image = scale(image, width, height);
			}
			ByteArrayInputStream bis = new ByteArrayInputStream(image);
			IOUtils.copy(bis, fos);
			IOUtils.closeQuietly(bis);
			IOUtils.closeQuietly(fos);
		}

		return "/FlipYouth" + relPath ;
	}

	public String byteArrayToTempImg(byte[] image, int width, int height) throws IOException {
		return "<img width='"+width+"px' src='"+byteArrayToTempImgOnlySrc(image, width, height)+"' />";
	}
	
	public String base64ToTempImgOnlySrc(String base64Str, int width, int height) throws IOException {

		return byteArrayToTempImgOnlySrc(Base64Utils.decodeFromString(base64Str), width, height);
	}

	public String base64ToTempImg(String base64Str, int width, int height) throws IOException {

		return "<img width='"+width+"px' src='"+base64ToTempImgOnlySrc(base64Str, width, height)+"' />";
	}
	
	public byte[] scale(byte[] fileData, int width, int height) {
		byte[] scaledBytes = null;
		ByteArrayInputStream in = new ByteArrayInputStream(fileData);
		try {
			BufferedImage img = ImageIO.read(in);
			if (height == 0) {
				height = (width * img.getHeight()) / img.getWidth();
			}
			if (width == 0) {
				width = (height * img.getWidth()) / img.getHeight();
			}
			Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
			BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0, 0, 0), null);

			ByteArrayOutputStream buffer = new ByteArrayOutputStream();

			ImageIO.write(imageBuff, "jpg", buffer);

			scaledBytes = buffer.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return scaledBytes;
	}

}
