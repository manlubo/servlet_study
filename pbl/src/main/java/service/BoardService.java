package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import mapper.AttachMapper;
import mapper.BoardMapper;
import mapper.ReplyMapper;
import util.MybatisUtil;
@Slf4j
public class BoardService {
	public List<Board> list(Criteria cri){
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			List<Board> list = mapper.list(cri);
			return list; // 1page 10개씩
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public Board findByNo(Long bno) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.increseCnt(bno);
			Board board = mapper.selectOne(bno);
			return board;
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public void write(Board board) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			Long bno = board.getBno();
			if(bno == null) { // 신규 글
				mapper.insert(board);
				mapper.updateGrpMyself(board);
			}
			else { // 답글
				// 1. 부모글 조회
				Board parent = mapper.selectOne(bno);
				
				// 내 위치에 작성하기위한 update
				
				// 2. maxSeq취득
				// select
				int maxSeq = mapper.selectMaxSeq(parent);
				board.setSeq(maxSeq + 1); //수정 
				
				// 3. 해당 조건의 게시글들의 seq 밀어내기
				board.setGrp(parent.getGrp());
				board.setDepth(parent.getDepth() + 1);
				mapper.updateSeqIncrease(board); // 수정


				// insert
				mapper.insertChild(board);
			}
			
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			board.getAttachs().forEach(a -> {
				a.setBno(board.getBno());
				attachMapper.insert(a);
			});
			session.commit();
			
		}
		catch (Exception e){
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	
	
	public long getCount(Criteria cri) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			return mapper.getCount(cri);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public static void main(String[] args) {
		new BoardService().list(new Criteria()).forEach(b -> log.info("{}", b.getTitle()));
	}

	public void modify(Board board) {

		SqlSession session = MybatisUtil.getSqlSession(false);
		try{

			BoardMapper mapper = session.getMapper(BoardMapper.class);
			mapper.update(board);
			
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);

			// 기존 첨부파일메타데이터 제거
			attachMapper.deleteByBno(board.getBno());
			
			// 새로 첨부파일 메타데이터 등록

			board.getAttachs().forEach(a -> {
				a.setBno(board.getBno());
				attachMapper.insert(a);
			});
			session.commit();
		}
		catch (Exception e){
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	
	public void remove(Long bno) {
		SqlSession session = MybatisUtil.getSqlSession(false);
		try{
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			AttachMapper attachMapper = session.getMapper(AttachMapper.class);
			ReplyMapper replyMapper = session.getMapper(ReplyMapper.class);
			
			replyMapper.deleteByBno(bno);
			attachMapper.deleteByBno(bno);
			mapper.delete(bno);
			
			session.commit();
		}
		catch (Exception e){
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
}
