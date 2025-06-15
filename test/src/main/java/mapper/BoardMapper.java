package mapper;

import java.util.List;

import domain.Board;

public interface BoardMapper {
// 선택 메서드	
	List<Board> list(); // 리스트 불러오기
	Board selectOne(Long bno); // 게시글 선택
	
//	추가 메서드
	int insert(Board board);

//	삭제 메서드
	int delete(Long bno);
	
//	수정 메서드
	int update(Board board);
	
}
