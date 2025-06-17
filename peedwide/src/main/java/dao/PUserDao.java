package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import domain.PUser;
import util.DBUtil;

public class PUserDao {
	// insert
	public void insert(PUser puser) {
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("insert into puser(id, pw, name) values (?,?,?)");
			pstmt.setString(1, puser.getId());
			pstmt.setString(2, puser.getPw());
			pstmt.setString(3, puser.getName());
			
			pstmt.executeQuery();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public PUser selectUser(String id) {
		Connection conn = DBUtil.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement("");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
