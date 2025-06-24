package domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
	
	@Builder.Default
	private List<Attach> attachs = new ArrayList<Attach>();

	public Board(Long bno, String title, String content, String id, String regdate, String moddate, Integer cnt,
			Integer cno) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
		this.moddate = moddate;
		this.cnt = cnt;
		this.cno = cno;
	}
	
	
}
