package analysis.servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

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
		/*
		 * 파일 작다면 if문으로 alert하기
		 */
		
		request.setCharacterEncoding("UTF-8");

		String saveDir = request.getServletContext().getRealPath("/pics");
		String encoding = "UTF-8";
		int maxSize = 1024 * 1024 * 100; // 100MB

		// submit 할 때, enctype 있기 때문에 그냥 request로 하면 안 됨
		MultipartRequest m = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());

		String fileSystemName = m.getFilesystemName("file"); //똑같은 파일의 이름이 있다면 숫자를 붙여줌

		
		String str = null;
		ArrayList<String> resizedFileList= new ArrayList<>();
		
		try
		{
			String[] cmdArray = { "python", "C:\\testt\\face.py",  saveDir +"\\"+ fileSystemName};
			Process process = new ProcessBuilder(cmdArray).start();
			BufferedReader stdOut = new BufferedReader(new InputStreamReader(process.getInputStream()));

			
			while ((str = stdOut.readLine()) != null)
			{
				resizedFileList.add(str);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		// 결과 뷰쪽으로 전돨 될 데이터를 map에 저장하기
		Map<String, Object> map = new HashMap<>();
		map.put("resizedFileList", resizedFileList);

		request.setAttribute("map", map);

		request.getRequestDispatcher("edited.jsp").forward(request, response);
	}
}
