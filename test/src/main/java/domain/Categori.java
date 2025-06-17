package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("categori")
public class Categori {
	private int cno;
	private String cname;
	private String regdate;


}
