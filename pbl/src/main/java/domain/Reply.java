package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("reply")
public class Reply {
	private Long rno; // 댓글 번호
	private String content; // 컨텐츠
	private String id; // 작성자
	private String regdate; // 작성일	
	private Long bno; // 게시글 번호
}
