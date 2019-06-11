package analysis.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Emotion")
public class EmotionServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		String saveDir = request.getServletContext().getRealPath("/pics");
		String dir = request.getParameter("dir");
		dir = dir.split("pics/")[1];
		String lastTwoDir[] = dir.split("/");
		
		saveDir += "\\";
		//saveDir += lastTwoDir[0];
		saveDir += "3_tmp.jpg";
		
		if(lastTwoDir.length != 1)
		{
			saveDir += "\\";
			saveDir += lastTwoDir[1];
		}
		
		System.out.println(saveDir);
		String str = null;
		
		List<String> list = new ArrayList<>();
		try
		{
			String pyDir = request.getServletContext().getRealPath("/python");
			String[] cmdArray = { "python", pyDir +"\\classify_retrain.py", saveDir, pyDir};
			ProcessBuilder pb = new ProcessBuilder();
		    pb.redirectErrorStream(true);
		    pb.command(cmdArray);
			Process process = pb.start();

			BufferedReader stdOut = new BufferedReader(new InputStreamReader(process.getInputStream()));
			
			process.waitFor();
	        while((str = stdOut.readLine()) != null) {
	           list.add(str);
	           System.out.println(str);
	        }
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		// 결과 뷰쪽으로 전돨 될 데이터를 map에 저장하기
		/*Map<String, Object> map = new HashMap<>();
		map.put("emotion", str);

		request.setAttribute("map", map);

		request.getRequestDispatcher("photoPage.jsp").forward(request, response);*/
		
		/*System.out.println(list);
		for (int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i));
		}*/
		String emotion = list.get(list.size()-1);
		
		PrintWriter out = response.getWriter();
		out.println(emotion);
	}
	

}
