package domain.dto;

import lombok.Data;

import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j

public class PageDto {
	private Criteria cri;
	private long total;
	
	private int start;
	private int end;
	private int realEnd;
	
	private boolean left;
	private boolean right;
	
	private boolean doubleLeft;
	private boolean doubleRight;
	
	
	public PageDto(Criteria cri, long total) {
		this.cri = cri;
		this.total = total;
		realEnd = (int)((total + cri.getAmount() - 1) / cri.getAmount());

		end = (cri.getPage() + 9) / 10 * 10;
		start = end - 9;
		
		if(end > realEnd) {
			end = realEnd;
		}
		
		left = start > 1;
		right = end < realEnd;
		
		
		doubleLeft = cri.getPage() > 1;
		doubleRight = cri.getPage() < realEnd;
	}
	
}
