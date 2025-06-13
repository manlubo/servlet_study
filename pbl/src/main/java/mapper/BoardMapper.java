package mapper;

import java.util.List;


import domain.Board;


public interface BoardMapper {
	List<Board> list();
	
	Board selectOne(Long bno);
	
	
	
	int insert(Board board);
	
	int delete(Long bno);
	
	int update(Board board);
}
