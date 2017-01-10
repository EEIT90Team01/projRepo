package model.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		this.rootPath = (System.getProperty("catalina.base") + "/webapps" + context.getContextPath()).replace("/",
				File.separator);
	}

	public String getTempImg(byte[] image) throws IOException {
		String ext = "";
		if (Arrays.equals(GIF89AMAGNUM, Arrays.copyOfRange(image, 0, 6))
				|| Arrays.equals(GIF87AMAGNUM, Arrays.copyOfRange(image, 0, 6))) {
			ext = ".gif";
		} else if (Arrays.equals(PNGMAGNUM, Arrays.copyOfRange(image, 0, 8))) {
			ext = ".png";
		} else if (Arrays.equals(JPEGMAGNUM, Arrays.copyOfRange(image, 0, 2))) {
			ext = ".jpeg";
		}
		String relPath = "/image/" + DigestUtils.md5DigestAsHex(image) + ext;
		String filePath = getRootPath() + relPath;
		File imgFile = new File(filePath.replace("/", File.separator));

		if (!imgFile.exists()) {
			imgFile.createNewFile();
			FileOutputStream fos = new FileOutputStream(imgFile);
			ByteArrayInputStream bis = new ByteArrayInputStream(image);
			IOUtils.copy(bis, fos);
			IOUtils.closeQuietly(bis);
			IOUtils.closeQuietly(fos);
		}

		return "<img width='150px' src='/FlipYouth" + relPath + "' />";
	}
}
