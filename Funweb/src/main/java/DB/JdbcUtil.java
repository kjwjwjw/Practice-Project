package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

// JDBC 활용 시 데이터 접근 관련 작업을 수행하는 용도의 클래스 정의
public class JdbcUtil {
		// 1. DB 접속을 수행하는 getConnection() 메서드 정의
		// => 파라미터 : 없음, 리턴타입 : java.sql.Connection
		// =>DB 접속을 수행하여 접속 성공 시 접속 정보를 객체로 관리하는 Connection 타입 객체를 외부로 리턴
		// => 외부에서 인스턴스 생성없이도 메서드 호출이 가능하도록 static 메서드로 선언
		// (클래스명. 메서드명() 형태로 호출 가능 => ex. JdbcUtil
	public static Connection getConnection() {
			String driver = "com.mysql.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/funWeb";
			String user = "root";
			String password = "1234";
			
			Connection con = null;
			
			try {
					// 1단계. jdbc 드라이버 클래스 로드
					Class.forName(driver); // 드라이버 클래스 위치가 잘못되었을 경우 ClassNotFoundException 예외 발생할 수 있음
					// => 따라서, try ~catch 블록을 사용 catch 블록에서 ClassNotFoundException 발생에 대한 대비책을 세워야함
					// => 현재 예외가 발생하는 위치 아래쪽의 코드 실행이 중지되고  } catch (ClassNotFoundException e) {} 부분으로 흐름이 이동함
					
					// 2단계 DB 접속
					con = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				
					e.printStackTrace();
					System.out.println("드라이버 로드 실패!");
			} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
				
				// Connection 객체 리턴
			return con;
			
		
		}
	
	// 2. DB 자원을 반환하는 close() 메서드 정의
	// => 반환해야하는 대상 객체 : Connection, PreparedStatement, ResultSet
	// => 메서드 이름은 동일하고, 파라미터를 다르게 하는 메서드 오버로딩 를 활용하여 메서드 정의
	public static void close (Connection con) {
		if(con !=null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
			
	}
	public static void close (PreparedStatement pstmt) {
		if(pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
	}
	public static void close(ResultSet rs) {
		if(rs !=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
	}
	
	
}
