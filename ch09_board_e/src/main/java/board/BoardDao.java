package board;

import java.sql.*;

public class BoardDao {

	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	/* 아래 변수 선언 안하게 하기 위해서 */
	
	public BoardDao() {
		try {
		pool = DBConnectionMgr.getInstance();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//글쓰기 등록
	public boolean insertBoard(Board board) {
		boolean flag = false;
		try {
			con = pool.getConnection();          //물음표 4개: num, name, subject, content// depth=0// sysdate=오늘날짜
			sql = "insert into board values(seq_board.nextval,?,?,?,0,seq_board.currval,0,sysdate,?,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			/* 1줄로 
			int result = pstmt.executeUpdate();
			if(result ==1)
				flag.true;
			*/
			//이것의 결과는 0 아니면 1 
			if(pstmt.executeUpdate()==1)
				flag = true;
			
			
		} catch(Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		return flag;
	}
	
	//조회수 증가
	public void upCount(int num) {
		try {
			con = pool.getConnection();          //물음표 4개: num, name, subject, content// depth=0// sysdate=오늘날짜
			sql = "update board set count = count+1 where num ="+num;
			con.createStatement().executeUpdate(sql);
		} catch(Exception e) {
				e.printStackTrace();
		} finally {
			pool.freeConnection(con,stmt);
		}
	}	
	//게시물 1개 상세 보기 
	public Board getBoard(int num) {
		Board board = null;
		try {
			con = pool.getConnection();          //물음표 4개: num, name, subject, content// depth=0// sysdate=오늘날짜
			sql = "select * from board where num=" + num;
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				/*board.setNum(rs.getInt(1));*/
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
			pool.freeConnection(con);
		}
		return board;
	}		
}

