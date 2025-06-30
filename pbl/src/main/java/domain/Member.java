package domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Alias("member")
@AllArgsConstructor
@NoArgsConstructor
public class Member {
 	private Long mno; // 멤버번호
	private String id; // 아이디
	private String pw; // 비밀번호
	private String name; // 이름
	private String email; // 이메일
	private String regdate; // 생성일
}
