package controller.reply;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Member;
import domain.Reply;
import lombok.extern.slf4j.Slf4j;
import service.ReplyService;
import service.ReviewService;

@Slf4j
@WebServlet ("/reply/*")
public class ReviewServlet extends HttpServlet{
	public static final String ID = "/reply/";
	
	private String getURI(HttpServletRequest req) {
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf(ID) + ID.length());
		return uri;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = getURI(req);
		ReplyService service = new ReplyService();
		Gson gson = new Gson(); 
		String ret = "";
		if(uri.startsWith("list") || uri.equals("*")) { // 목록조회
			log.info("{}", uri);
			String tmp = "list/";
			if(uri.contains(tmp)) {
				String[] tmps = uri.split("/");
				// list/1234/1234
				Long bno = null;
				Long lastRno = null;
				if(tmps.length > 1) {
					bno = Long.valueOf((tmps[1]));
					if(tmps.length > 2) {
						lastRno = Long.valueOf(tmps[2]);
					}
					ret = gson.toJson(service.list(bno, lastRno));
				}
			}
		}
		else { // 단일조회
			ret = gson.toJson(service.findBy(Long.parseLong(uri)));
		}
		System.out.println(ret);
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(ret);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = getURI(req);
		Long rno = Long.valueOf(uri);
		
		new ReplyService().remove(rno);
		
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(new Gson().toJson(Map.of("result", true)));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String ret = String.join("",req.getReader().lines().toList());
		Reply reply = new Gson().fromJson(ret, Reply.class);
		
		// rno > null
		new ReplyService().register(reply);
		// rno > not null
		
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(new Gson().toJson(Map.of("result", true, "reply", reply)));
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ret = String.join("",req.getReader().lines().toList());
		Reply reply = new Gson().fromJson(ret, Reply.class);
		new ReplyService().modify(reply); 
		
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(new Gson().toJson(Map.of("result", true)));
	}
	
	
}
