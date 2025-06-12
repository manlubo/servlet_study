package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import mapper.ReviewMapper;
import util.MybatisUtil;

public class ReviewService {
	public Member findBy(Long rno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			return mapper.findBy(rno);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Member> list() {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			return mapper.select();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public int register(Member review) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			return mapper.insert(review);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public int modify(Member review) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			return mapper.update(review);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public int remove(Long rno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			return mapper.delete(rno);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
}
