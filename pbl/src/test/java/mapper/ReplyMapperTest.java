package mapper;


import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


import domain.Reply;

import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class ReplyMapperTest { // 서비스와 매퍼는 테스트코드 쓰는것이 좋음
	
	private ReplyMapper replyMapper = MybatisUtil.getSqlSession().getMapper(ReplyMapper.class);
	
	@Test
	@DisplayName("댓글 작성")
	public void testInsert() {
		// given
		Long bno = 300L;
		String id = "qwer";
		String content = "수정 테스트입니다.";
		
		// when
		
		Reply reply = Reply.builder().bno(bno).id(id).content(content).build(); 
		replyMapper.insert(reply);
		
		// then ~ actual, expect
		assertNotNull(reply);
		
		log.info("{}", reply);
	}
	
	@Test
	@DisplayName("댓글 수정 테스트")
	public void testUpdate() {
		Long rno = 7L;
		String content = "수정 하자 하자 테스트 성공 기원!";
		
		Reply reply = replyMapper.selectOne(rno);
		reply.setContent(content);
		replyMapper.update(reply);		
	}

	@Test
	@DisplayName("보드 상세에서 댓글 목록 조회")
	public void testList() {
		// given
		Long bno = 300L;
		Long lastRno = 35L;
		// when
		List<Reply> list = replyMapper.list(bno, lastRno);
		list.forEach(b -> log.info("{}", b.getContent()));
	}

	@Test
	@DisplayName("리스트 Rno널값일 때")
	public void testListRnoNull() {
		// given
		Long bno = 300L;
		Long lastRno = null;
		// when
		List<Reply> list = replyMapper.list(bno, lastRno);
		list.forEach(b -> log.info("{}", b.getContent()));
	}

	@Test
	@DisplayName("댓글 한개 선택 테스트")
	public void testSelectOne() {
		// given
		Long rno = 6L;
		
		Reply reply = replyMapper.selectOne(rno);
		log.info("{}", reply);
	}

	@Test
	@DisplayName("댓글 한개 삭제 테스트")
	public void testDelete() {
		Long rno = 6L;
		
		replyMapper.delete(rno);
	}
	
	
	
	
	
}
