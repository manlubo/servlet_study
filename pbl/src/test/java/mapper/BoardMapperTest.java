package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class BoardMapperTest { // 서비스와 매퍼는 테스트코드 쓰는것이 좋음
	
	private BoardMapper boardMapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
	
	
	
	
//	@Test
//	public void addTest() {
//		int result = 1 + 1;
//		assertEquals(3, result);
//	}
	
	@Test
	public void testSelectOne() {
		// given
		Long bno = 1L;
		
		// when
		Board board = boardMapper.selectOne(bno);
		
		// then ~ actual, expect
		assertNotNull(board);
		
		log.info("{}", board);
	}
	
	@Test
	@DisplayName("목록 조회 3페이지 10개씩 2번 카테고리")
	public void testList() {
		// given
		Criteria cri = new Criteria(3, 10, 2);
		
		// when
		List<Board> boards = boardMapper.list(cri);
		
		// then ~ actual, expect
		boards.forEach(b -> log.info("{}", b.getTitle()));
	}
		
	@Test
	@DisplayName("목록 조회 검색어 테스트")
	public void testList2() {
		// given
		Criteria cri = new Criteria(3, 10, 2, "TI", "html");
		log.info(Arrays.toString(cri.getTypes()));
		
		// when
		List<Board> boards = boardMapper.list(cri);
		
		// then ~ actual, expect
		boards.forEach(b -> log.info("{}", b.getTitle()));
	}
	
	@Test
	@DisplayName("글 수정 테스트")
	public void testUpdate() {
		Long bno = 1511L;
		Board board = boardMapper.selectOne(bno);
		board.setTitle("제목만 수정하기");
		
		boardMapper.update(board);
	}

	
}
