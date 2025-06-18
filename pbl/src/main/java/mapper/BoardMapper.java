package mapper;

import java.util.List;


import domain.Board;
import domain.dto.Criteria;


public interface BoardMapper {
	List<Board> list(Criteria cri);
	
	Board selectOne(Long bno);
	
	long getCount(Criteria cri);
	
	int insert(Board board);
	
	int delete(Long bno);
	
	int update(Board board);
}
