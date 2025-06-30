package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import service.MemberService;
import util.ParamUtils;

@Slf4j
@WebServlet("/member/register")
public class Register extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member member = ParamUtils.get(req, Member.class);
		
//		member 인스턴스 생성
//		service register(member)호출
		new MemberService().register(member);
//		index로 리디렉션
		resp.sendRedirect("../index");
		
	}
}
