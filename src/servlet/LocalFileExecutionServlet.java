package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LocalFileExecutionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		String fileName = req.getParameter("fileName");
		System.out.println("fileName : " + fileName);
		
		if(fileName !=null && !fileName.isEmpty()){
			 
			//파라미터로 받은 이름을 조건으로 실행할 프로그램을 선택, 아무것도 입력하지 않을 경우 그림판이 실행 
			String directory = "C://Windows//System32//mspaint.exe";
			
			if(fileName.equals("그림판")){
				directory = "C://Windows//System32//mspaint.exe";
			}else if(fileName.equals("메모장")){
				directory = "C://Windows//System32//notepad.exe";
			}else if(fileName.equals("계산기")){
				directory = "C://Windows//System32//calc.exe";
			}
			
			// 실제로 파일을 실행하는 구간------------------------------------
			Runtime rt = Runtime.getRuntime();
			System.out.println("directory: " + directory);
			Process p;
			
			try {
				p = rt.exec(directory);
				p.waitFor();
			} catch (Exception e) {
				e.printStackTrace();
			}
			//실제로 파일을 실행하는 구간------------------------------------
			
		}
		
		
	}
	
}
