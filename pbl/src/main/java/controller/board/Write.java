package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Board;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.AlertUtil;


@Slf4j
@WebServlet("/board/write")
public class Write extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?url=", req, resp, true);
			return;
		}
		else {
			req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);
		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션체크		
		if(req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?url=", req, resp, true);
		}
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getParameter("id");
		Integer cno = Integer.valueOf(req.getParameter("cno"));
		
		log.info(title);
		log.info(content);
		log.info(id);
		log.info(req.getParameter("cno"));
		
		BoardService boardService = new BoardService();
		Board board = Board.builder().title(title).content(content).id(id).cno(cno).build();
		
		boardService.write(board);
		AlertUtil.alert("글이 등록되었습니다.", "/board/list?cno=2", req, resp);
	}
	
	
}
