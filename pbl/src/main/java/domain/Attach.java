package domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Attach {
	private String uuid; // 첨부파일 아이디
	private String path; // 첨부파일 경로
	private boolean image; // 이미지 여부
	private String origin; // 파일의 고유 스트링
	private Long bno; // 게시글 번호
	private Long rno; // 댓글 번호
	private int odr; // 댓글 번호
}
