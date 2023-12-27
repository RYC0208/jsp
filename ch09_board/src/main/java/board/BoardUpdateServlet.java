package board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Board upBoard = new Board();
		upBoard.setSubject(request.getParameter("subject"));
		upBoard.setContent(request.getParameter("content"));
		upBoard.setName(num);
		String inputPass = request.getParameter("Pass");
		
		HttpSession session = request.getSession();
		Board dbBoard = (Board)session.getAttribute("bean");
		
		if(inputPass.equals(dbBoard.getPass())) {
			new BoardDao().updateBoard(upBoard);
			response.sendRedirect("read.jsp?num="+num);
		}
	}

}
