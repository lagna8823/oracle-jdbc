package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private MemberDao memberDao;
	
	// 회원수정 ModifyMemberController
	public int modifyMember(Member modifyMember) {
		int resultRow=0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			resultRow = memberDao.modifyMember(conn, modifyMember);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return resultRow;	
	}
		
	// 회원탈퇴 RemoveMemberController
	public int removeMember(String memberId, String memberPw) {
		int resultRow = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			resultRow = memberDao.removeMember(conn, memberId, memberPw);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return resultRow;	
	}
		
	// 로그인 LoginController
	public Member login(Member member) {
		this.memberDao = new MemberDao();
		Member returnMember= new Member();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			returnMember = memberDao.selectMemberByAndPw(conn, member);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return returnMember;	
		}
	
	// 회원가입 AddMemberController
	public int addMember(String memberId, String memberPw, String memberName) {
		int resultRow = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			memberDao= new MemberDao();
			resultRow = memberDao.addMember(conn, memberId, memberPw, memberName);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return resultRow;	
	}
}
