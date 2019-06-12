package analysis.servlet;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

@WebServlet("/Paint")
public class PaintServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		String strImg = request.getParameter("strImg");
		String saveDir = request.getServletContext().getRealPath("/pics");
		String[] strParts = strImg.split(",");
		String rstStrImg = strParts[1]; // ,로 구분하여 뒷 부분 이미지 데이터를 임시저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String fileSystemName = sdf.format(new Date()).toString() + "_tmp.jpg";

		BASE64Decoder decoder = new BASE64Decoder();
		byte byteImg[] = decoder.decodeBuffer(rstStrImg); // base64 디코더를 이용하여 byte 코드로 변환
		ByteArrayInputStream bis = new ByteArrayInputStream(byteImg);
		BufferedImage image = ImageIO.read(bis); // BufferedImage형식으로 변환후 저장
		bis.close();
		
		image = resizeImage(image, 64, 64);

		String fullpath = saveDir + "\\" + fileSystemName;
		File folderObj = new File(saveDir);
		if (!folderObj.isDirectory())
			folderObj.mkdir();

		File outputFile = new File(fullpath); // 파일객체 생성

		if (outputFile.exists())
			outputFile.delete();

		ImageIO.write(image, "jpg", outputFile); // 서버에 파일로 저장
		PrintWriter out = response.getWriter();
		out.println("pics\\" + fileSystemName);

	}

	private BufferedImage resizeImage(BufferedImage img, int width, int height)
	{
		int type = img.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : img.getType();

		Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
		BufferedImage resized = new BufferedImage(width, height, type);
		Graphics2D g2d = resized.createGraphics();
		g2d.drawImage(tmp, 0, 0, null);
		g2d.dispose();
		return resized;
	}

}