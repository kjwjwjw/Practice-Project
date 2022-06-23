package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Execute;

import DB.JdbcUtil;

public class MemberDAO {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
	
	public int insertMember(MemberBean member) {
		int insertCount = 0;
		
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "INSERT INTO member VALUES(?,?,?,?,now(),?,?,?,?)";
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPostcode());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getMobile());

			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		
		
		return insertCount;
	}

	
	public boolean checkUser(String id, String pass) {
		boolean isLoginSuccess = false;
		con = JdbcUtil.getConnection();
		
		try {
			String sql = "SELECT * from member where id=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			// 조회 결과가 존재할 경우
			if(rs.next()) {
				isLoginSuccess = true;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
			
		}
		
	return isLoginSuccess;
 }
	
	// 회원 상세정보 조회
	
	public MemberBean selectMemberInfo(String id) {
		MemberBean member = null;
		
		try {
			con = JdbcUtil.getConnection();
			String sql = "SELECT *FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberBean();
				
				member.setId(id);
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("Name"));
				member.setEmail(rs.getString("Email"));
				member.setDate(rs.getDate("Date"));
				member.setPostcode(rs.getString("Postcode"));
				member.setAddress(rs.getString("Address"));
				member.setPhone(rs.getString("Phone"));
				member.setMobile(rs.getString("Mobile"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return member;
		
	}
	
	public int updateMember(MemberBean member) {
		int updateCount = 0;
		
		
		try {
			// 단, pass 값이 입력되어 있을 경우 패스워드도 수정하고
			// 아니면 => 이름,이메일,주소,전화번호, 폰번호만 수정
			con = JdbcUtil.getConnection();
			
			if(member.getPass().equals("")) {
			String sql = "UPDATE member SET pass=?, name=?,email=?, postcode=? ,address=?,phone=?,mobile=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPostcode());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMobile());
			pstmt.setString(8, member.getId());
			} else {
				
				String sql = "UPDATE member SET name=?,email=?, postcode=?, address=?,phone=?,mobile=? WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getPostcode());
				pstmt.setString(4, member.getAddress());
				pstmt.setString(5, member.getPhone());
				pstmt.setString(6, member.getMobile());
				pstmt.setString(7, member.getId());	
				
			}
			
			// 4단계. SQL 구문 실행 및 결과 처리
			updateCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
			
		}
		
		return updateCount;
	}
	
	
	public boolean checkId(String id) {
		boolean isDuplicate = false;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT *FROM member Where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
			isDuplicate = true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		return isDuplicate;
	}
}

