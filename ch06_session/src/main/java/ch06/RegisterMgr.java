package ch06;

import java.sql.*;

public class RegisterMgr {
	private DBConnectionMgr pool = null;
	
	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	// 내가 필요한 select, insert, delete, update등을 메소드로 정의
	public boolean login(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginFlag = false;
		try {
			con = pool.getConnection();			
			String query = "select count(*) from member where mem_id=? and mem_pw=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();
			if(rs.next() && rs.getInt(1) > 0)
				loginFlag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return loginFlag;
	}
	
	
}