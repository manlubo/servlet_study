package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import domain.Member;
import lombok.extern.slf4j.Slf4j;
import mapper.MemberMapper;
import util.MybatisUtil;
import util.PasswordEncoder;

@Slf4j
public class MemberService {
	
	public int register(Member member) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			member.setPw(PasswordEncoder.encode(member.getPw())); 
			return mapper.insert(member);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public Member findById(String id) {
		try(SqlSession session = MybatisUtil.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.findById(id);
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean login(String id, String pw) {
		Member member = findById(id);
		if(member == null) {
			return false;
		}
		return PasswordEncoder.matches(pw, member.getPw());	
	}
	
	
	public static void main(String[] args) {
		MemberService memberService = new MemberService();
//		log.info("{}", memberService.findById("qwer"));
//		memberService.register(Member.builder().id("qwer").pw("1234").name("qwer").build());
		
		
		log.info("{}", memberService.login("qwer", "1234"));
		log.error("{}", memberService.login("qwer", "12345"));
	}
}
