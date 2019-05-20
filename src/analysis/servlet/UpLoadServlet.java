package analysis.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpLoad")
public class UpLoadServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		
		String saveDir = request.getServletContext().getRealPath("/pics");
		String encoding = "UTF-8";
		int maxSize = 1024*1024*100; //100MB
		
		//submit �� ��, enctype �ֱ� ������ �׳� request�� �ϸ� �� ��
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		//String name = m.getParameter("name");
		//String subject =m.getParameter("subject");
		//String file = m.getParameter("file");
		String fileSystemName = m.getFilesystemName("file");
		//String originalName = m.getOriginalFileName("file");
		
		/*System.out.println("name : " + name);
		System.out.println("subject : " + subject);
		System.out.println("fileSystemName : " + fileSystemName); //�Ȱ��� ������ �̸��� �ִٸ� ���ڸ� �ٿ���
		System.out.println("originalName : " + originalName);*/
		
		//��� �������� ���� �� �����͸� map�� �����ϱ�
		Map<String, Object> map = new HashMap<>();
		/*map.put("name", name);
		map.put("subject", subject);*/
		map.put("fileSystemName", fileSystemName);
		//map.put("originalName", originalName);
		map.put("fileSize", m.getFile("file").length());
		/**
		 * ���� �۴ٴ°� if������ alert�ϱ�
		 * */
		//map.put("saveDir", saveDir);
		map.put("fileNames", new File(saveDir).list());
		
		request.setAttribute("map", map);
	    request.getRequestDispatcher("edited.jsp").forward(request, response);
	}
}
