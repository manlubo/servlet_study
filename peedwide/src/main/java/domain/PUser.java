package domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PUser {
	private int no;
	private String id;
	private String pw;
	private String name;
}
