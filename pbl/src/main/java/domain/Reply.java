package domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Alias("reply")
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private Long rno; // 댓글 번호
	private String content; // 컨텐츠
	private String id; // 작성자
	private String regdate; // 작성일	
	private Long bno; // 게시글 번호
}
