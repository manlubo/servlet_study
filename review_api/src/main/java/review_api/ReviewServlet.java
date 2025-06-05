package review_api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import domain.Review;
import service.ReviewService;


@WebServlet ("/review/*")
public class ReviewServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("health check");
//		uri
//		/review/list
		
//		System.out.println(req.getContextPath());
//		System.out.println(req.getRequestURI());
		
		String uri = req.getRequestURI();
		uri = uri.substring(uri.indexOf("review/") + "review/".length());
		ReviewService service = new ReviewService();
		Gson gson = new Gson(); 
		String ret = "";
		if(uri.startsWith("list")) { // 목록조회
			ret = gson.toJson(service.list());
		}
		else { // 단일조회
			ret = gson.toJson(service.findBy(Long.parseLong(uri)));
		}
		System.out.println(ret);
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(ret);
		// json
		
		//		/review/1
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String ret = String.join("",req.getReader().lines().toList());
		Review review = new Gson().fromJson(ret, Review.class);
		new ReviewService().register(review);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
}
