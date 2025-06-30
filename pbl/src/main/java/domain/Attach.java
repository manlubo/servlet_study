package domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@Alias("attach")
@NoArgsConstructor
@AllArgsConstructor
public class Attach {
	private String uuid; // 첨부파일 아이디
	private String path; // 첨부파일 경로
	private boolean image; // 이미지 여부
	private String origin; // 파일의 고유 스트링
	private Long bno; // 게시글 번호
	private Long rno; // 댓글 번호
	private int odr; // 댓글 번호
<<<<<<< HEAD
	private Long size;
	
	public Attach(String uuid, String path, boolean image, String origin, Long bno, int odr) {
=======
	private long size;
	public Attach(String uuid, String path, boolean image, String origin, Long bno, int odr, long size) {
>>>>>>> 9fe688e60911b312cdecbc05c6dd2d063c175f75
	
		this.uuid = uuid;
		this.path = path;
		this.image = image;
		this.origin = origin;
		this.bno = bno;
		this.odr = odr;
		this.size = size;
	}
	
	
	
}
