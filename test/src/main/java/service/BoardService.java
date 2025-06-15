package service;

import org.apache.ibatis.session.SqlSession;

import domain.Board;

import lombok.extern.slf4j.Slf4j;
import mapper.BoardMapper;
import util.MybatisUtil;


@Slf4j
public class BoardService {
	public int register(Board board) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class); 
			return mapper.insert(board);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public Board findByNo(Long bno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class); 
			return mapper.selectOne(bno);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	
	public static void main(String[] args) {
		BoardService service = new BoardService();
		System.out.println(service.findByNo(1L));
		
	}
}
