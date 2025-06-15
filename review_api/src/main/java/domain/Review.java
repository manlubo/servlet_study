package domain;



import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Review {
 	private Long rno; // 리뷰번호
	private String content; // 내용
	private String regdate; // 작성일시
	private Integer rating; // 별점
	private String writer; // 작성자
	private Long pno; // 상품번호
}
