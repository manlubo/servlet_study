package mapper;

import java.util.List;

import domain.Member;

public interface MemberMapper {
// 선택 메서드	
	List<Member> list(); // 리스트 불러오기
	Member findByNo(Long no); // 멤버 번호로 찾기
	Member findById(String id); // 멤버 아이디로 찾기
	
//	추가 메서드
	int insert(Member member);

//	삭제 메서드
	int delete(Long no);
	
//	수정 메서드
	int update(Member member);
	
}
