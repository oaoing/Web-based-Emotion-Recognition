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
		String rstStrImg = strParts[1]; // ,�� �����Ͽ� �� �κ� �̹��� �����͸� �ӽ�����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String fileSystemName = sdf.format(new Date()).toString() + "_tmp.jpg";

		BASE64Decoder decoder = new BASE64Decoder();
		byte byteImg[] = decoder.decodeBuffer(rstStrImg); // base64 ���ڴ��� �̿��Ͽ� byte �ڵ�� ��ȯ
		ByteArrayInputStream bis = new ByteArrayInputStream(byteImg);
		BufferedImage image = ImageIO.read(bis); // BufferedImage�������� ��ȯ�� ����
		bis.close();
		
		image = resizeImage(image, 64, 64);

		String fullpath = saveDir + "\\" + fileSystemName;
		File folderObj = new File(saveDir);
		if (!folderObj.isDirectory())
			folderObj.mkdir();

		File outputFile = new File(fullpath); // ���ϰ�ü ����

		if (outputFile.exists())
			outputFile.delete();

		ImageIO.write(image, "jpg", outputFile); // ������ ���Ϸ� ����
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