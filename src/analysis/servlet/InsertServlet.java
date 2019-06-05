package analysis.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.dto.FileDTO;

@WebServlet("/insert")
public class InsertServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//넘어오는 모든 값을 받아서 DTO를 저장한다.
		String fName = request.getParameter("fName");
		String emotion = request.getParameter("emotion");
		String fee = request.getParameter("feedback");
		
		boolean feedback = false;
		
		if(fee.equals("true"))
			feedback = true;
		
		//넘어온 값들에 대한 유효성을 체크한다.	
		FileDTO fileDTO = new FileDTO(fName, emotion, feedback);
		
		/**
		 * 파이썬에 저장할 정보들 전달
		 * */
		
		response.sendRedirect("index.jsp");
	}
}
