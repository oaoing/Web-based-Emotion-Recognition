package analysis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import analysis.dto.FileDTO;

@WebServlet("/Emotion")
public class EmotionServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String dir = request.getParameter("dir");
		// 결과 뷰쪽으로 전돨 될 데이터를 map에 저장하기
		Map<String, Object> map = new HashMap<>();
		map.put("dir", dir);

		request.setAttribute("map", map);

		request.getRequestDispatcher("result.jsp").forward(request, response);
	}
}
