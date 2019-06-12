package analysis.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Insert")
public class InsertServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		//넘어오는 모든 값을 받아서 DTO를 저장한다.
		String dir = request.getParameter("src");
		String emotion = request.getParameter("emotion");
		String feedback = request.getParameter("feedback");
		
		String saveDir = request.getServletContext().getRealPath("/pics");
		dir = dir.split("pics/")[1];
		String lastTwoDir[] = dir.split("/");
		
		saveDir += "\\";
		saveDir += lastTwoDir[0];
		//saveDir += "3_tmp.jpg";
		
		if(lastTwoDir.length != 1)
		{
			saveDir += "\\";
			saveDir += lastTwoDir[1];
		}
		
		String str = null;
		List<String> list = new ArrayList<>();
		try
		{
			String pyDir = request.getServletContext().getRealPath("/python");
			String[] cmdArray = new String[7];
			cmdArray[0] = "python";
			cmdArray[1] = pyDir +"\\classify_retrain.py";
			cmdArray[2] = saveDir;
			cmdArray[3] = feedback;
			cmdArray[4] = emotion;
			cmdArray[5] = pyDir;
			cmdArray[6] = "";
			
			if(lastTwoDir.length == 1)
			{
				cmdArray[6] = "no";
			}
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
		
		/**
		 * 파이썬에 저장할 정보들 전달
		 * */
		
		PrintWriter out = response.getWriter();
		out.println("success");
	}
}
