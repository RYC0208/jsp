package ch05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RegisterMgrPool6 {
	private DBConnectionMgr pool = null;
	
	public RegisterMgrPool6() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	// 내가 필요한 select, insert, delete, update등을 메소드로 정의
	public ArrayList<EmployeeBean5> getEmpList() {
		ArrayList<EmployeeBean5> alist = new ArrayList<EmployeeBean5>();
		try {
			Connection con = pool.getConnection();
			Statement st = con.createStatement();
			String query = "select * from employee";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				EmployeeBean5 bean = new EmployeeBean5();
				bean.setEmail(rs.getString("email"));
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setHire_date(rs.getString("hire_date"));
				bean.setSalary(rs.getInt("salary"));
				bean.setPhone(rs.getString("phone"));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return alist;
	}	
}