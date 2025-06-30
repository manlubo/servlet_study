package controller.member;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.ParamUtils;

@Slf4j
@WebServlet("/member/login")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = ParamUtils.get(req, Member.class);
		boolean ret = new MemberService().login(member.getId(), member.getPw());
		log.info("{}", ret);
		
		
		
		MemberService memberService = new MemberService();
		
		if(ret) { // 로그인 성공
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(60 * 10); // 세션 시간 10분
			session.setAttribute("member", memberService.findById(member.getId()));
			
			String url = req.getParameter("url");
			if(url == null) {
				resp.sendRedirect(req.getContextPath() + "/index");
			}
			else {
				String decodedUrl = URLDecoder.decode(url,"utf-8");
				Criteria cri = Criteria.init(req);
				
				resp.sendRedirect(decodedUrl + "?" + cri.getQs2());
			}
				
		}
		else { // 로그인 실패
			resp.sendRedirect("login?msg=fail");
		}
		
	}
	
}
