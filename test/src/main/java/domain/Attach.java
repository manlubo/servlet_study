package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("attach")
public class Attach {
	private String uuid;
	private String pate;
	private Boolean image;
	private String origin;
	private Long bno;
	private Long rno;
}
