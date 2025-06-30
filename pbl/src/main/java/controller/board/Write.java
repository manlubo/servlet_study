package controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import domain.Attach;
import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import service.BoardService;
import util.AlertUtil;
import util.ParamUtils;


@Slf4j
@WebServlet("/board/write")
public class Write extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria cri = Criteria.init(req);
		if(req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?" + cri.getQs2(), req, resp, true);
			return;
		}
		
		req.setAttribute("cri", cri);
		req.getRequestDispatcher("/WEB-INF/views/board/write.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션체크
		Criteria cri = Criteria.init(req);
		if(req.getSession().getAttribute("member") == null) {
			AlertUtil.alert("로그인 후 글 작성해주세요", "/member/login?url=", req, resp, true);
		}
		
		// 파라미터 수집
//		Board b = ParamUtils.get(req, Board.class);
//		
//		
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//		String id = req.getParameter("id");
//		Integer cno = Integer.valueOf(req.getParameter("cno"));
		
	
		
		// 첨부파일 내용 수집
		String encodedStr = req.getParameter("encodedStr");
		Type type = new TypeToken<List<Attach>>() {}.getType();
		List<Attach> list = new Gson().fromJson(encodedStr, type);
		log.info("{}", list);
		Board board = ParamUtils.get(req, Board.class);
		board.setAttachs(list);
		
		// board 인스턴스 생성
		BoardService boardService = new BoardService();
//		Board board = Board.builder().title(title).content(content).id(id).cno(cno).attachs(list).build();
		log.info("{}", board);
		
		boardService.write(board);
		AlertUtil.alert("글이 등록되었습니다.", "/board/list?cno=" + cri.getCno() + "&amount=" + cri.getAmount(), req, resp);
	}
	
	
}
