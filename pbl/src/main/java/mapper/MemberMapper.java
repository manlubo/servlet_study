package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import domain.Member;



public interface MemberMapper {
	@Select("select * from tbl_review")
	List<Member> select();
	
	Member findByNo(Long mno);
	Member findById(String id);
	
	
	int insert(Member member);
	
	int delete(Long rno);
	
	int update(Member member);
	
	
}