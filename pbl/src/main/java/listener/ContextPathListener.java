package listener;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.ibatis.session.SqlSession;

import mapper.CategoryMapper;
import util.MybatisUtil;

@WebListener
public class ContextPathListener implements ServletContextListener{ // 서버 실행시 딱 한번만 하는것

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("cp", sc.getContextPath());  // /pbl
		
		try(SqlSession session = MybatisUtil.getSqlSession()) { // 카테고리 불러오는 것
			CategoryMapper mapper = session.getMapper(CategoryMapper.class);
			sc.setAttribute("cate", mapper.list());
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	
}
