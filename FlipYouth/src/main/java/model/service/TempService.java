package model.service;

import java.io.File;
import java.util.Arrays;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;

@Service(value = "tempService")
public class TempService {

	private static final byte[] GIF89AMAGNUM = DatatypeConverter.parseHexBinary("474946383961");
	private static final byte[] GIF87AMAGNUM = DatatypeConverter.parseHexBinary("474946383761");
	private static final byte[] PNGMAGNUM = DatatypeConverter.parseHexBinary("89504E470D0A1A0A");
	private static final byte[] JPEGSTARTMAGNUM = DatatypeConverter.parseHexBinary("FFD8");
	private static final byte[] JPEGENDMAGNUM = DatatypeConverter.parseHexBinary("FFD9");

	@Autowired
	private ServletContext context;

	private String rootPath;

	public String getRootPath() {
		return rootPath;
	}

	@PostConstruct
	public void init() {
		this.rootPath = (System.getProperty("catalina.base") + "/wtpwebapps" + context.getContextPath()).replace("/",
				File.separator);
	}

	public String getBase64Src(byte[] image) {
		String ext = "";
		if (Arrays.equals(GIF89AMAGNUM, Arrays.copyOfRange(image, 0, 6))
				|| Arrays.equals(GIF87AMAGNUM, Arrays.copyOfRange(image, 0, 6))) {
			ext = "gif";
		} else if (Arrays.equals(PNGMAGNUM, Arrays.copyOfRange(image, 0, 8))) {
			ext = "png";
		} else if (Arrays.equals(JPEGSTARTMAGNUM, Arrays.copyOfRange(image, 0, 2))
				&& Arrays.equals(JPEGENDMAGNUM, Arrays.copyOfRange(image, image.length - 3, image.length - 1))) {
			ext = "jpeg";
		}
		return "<img width='150px' src='data:image/" + ext + ";base64, " + Base64Utils.encodeToString(image) + "' />";
	}
}
