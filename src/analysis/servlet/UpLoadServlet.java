package analysis.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.sf.json.JSONArray;

@WebServlet("/UpLoad")
public class UpLoadServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		/*
		 * 파일 작다면 if문으로 alert하기
		 */
		response.setContentType("text/html;charset=UTF-8");
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
			String pyDir = request.getServletContext().getRealPath("/python");
			String[] cmdArray = { "python", pyDir +"\\face.py", saveDir +"\\"+ fileSystemName};
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
		
		Map<String, Object> map = new HashMap<>();
		map.put("resizedFileList", resizedFileList);
		map.put("original", "pics\\"+ fileSystemName);

		/*request.setAttribute("map", map);

		request.getRequestDispatcher("photoPage.jsp").forward(request, response);*/
		
		//map을 json의 형태로 변환해서 보낸다.
		JSONArray jsonArr = JSONArray.fromObject(map);
		
		PrintWriter out = response.getWriter();
		out.println(jsonArr);
		
	}
}
