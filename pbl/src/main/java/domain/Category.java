package domain;

import org.apache.ibatis.type.Alias;

import domain.en.CategoryStatus;
import domain.en.CategoryViewType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@Alias("category")
@AllArgsConstructor
@NoArgsConstructor
public class Category {
	private Long cno;
	private String cname;
	private String regdate;
	private CategoryViewType cViewType;
	private int odr;
	private CategoryStatus status;
}
