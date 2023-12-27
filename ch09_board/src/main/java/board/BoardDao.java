package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 글쓰기 등록
	public boolean insertBoard(Board board) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into board values(seq_board.nextval,?,?,?,0,seq_board.currval,0,sysdate,?,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	
	// 조회수 증가
	public void upCount(int num) {
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num ="+num;
			con.createStatement().executeUpdate(sql);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);
		}
	}
	
	// 게시물 1개 상세보기
	public Board getBoard(int num) {
		Board board = null;
		try {
			con = pool.getConnection();
			sql = "select * from board where num =" + num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				// board.setNum(rs.getInt(1));
				board = new Board(rs.getInt(1)
								, rs.getString(2)
								, rs.getString(3)
								, rs.getString(4)
								, rs.getInt(5)
								, rs.getInt(6)
								, rs.getInt(7)
								, rs.getString(8)
								, rs.getString(9)
								, rs.getString(10)
								, rs.getInt(11));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return board;
	}
		
	// 게시물 삭제
	public boolean deleteBoard(int num) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select count(*) from board where ref=" + num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				if(rs.getInt(1) == 1) {
					sql = "delete from board where num=" + num;
					if(con.createStatement().executeUpdate(sql) == 1)
						flag = true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	// 
	public boolean Board(Board board) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
}













