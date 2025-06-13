package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("board")
public class Board {
	private Long bno; // 게시글번호
	private String title; // 제목
	private String content; // 컨텐츠
	private String id; // 작성자
	private String regdate; // 작성일	
	private String moddate; // 수정일
	private Integer cnt; // 조회수
	private Integer cno; // 카테고리 넘버
}
