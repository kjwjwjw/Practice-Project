package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


// static import : 특정 클래스의 static 메서드를 클래스명 없이 접근하기 위한 import 문
// < 기본 문법> import static 패키지명.클래스명.메서드명;

import static DB.JdbcUtil.*;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	
	public int insertBoard(BoardBean board) {
		int insertCount = 0;
		int num= 1;
		
		try {
			con = getConnection();
			String sql = "SELECT MAX(num) FROM board";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 등록된 게시물이 하나라도 전재할 경우
				num =rs.getInt(1)+ 1;
			}
			
			sql = "INSERT INTO board VALUES(?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1,num);
			pstmt2.setString(2,board.getName());
			pstmt2.setString(3,board.getPass());
			pstmt2.setString(4,board.getSubject());
			pstmt2.setString(5,board.getContent());
			
			
			insertCount = pstmt2.executeUpdate();
//			System.out.println("새 글 번호 :" + num);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류");
		} finally {
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		
		
		return insertCount;
	}

	public ArrayList<BoardBean> selectBoardList(int pageNum, int listLimit) {
		ArrayList<BoardBean> boardList = null;
		try {
			con = getConnection();
			
			int startRow = (pageNum - 1) * listLimit;
			
			// SELECT 컬럼명 FROM 테이블명 ORDER BY 정렬할컬럼명 정렬방식
			String sql = "SELECT * FROM board  ORDER BY num DESC LIMIT ?,?";
			// => 목록갯수는 파라미터로 전달받은 listLimit 값 사용
			// => 시작행번호는 (페이지번호 -1) * 목록갯수 값 사용
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, listLimit);
			
			rs = pstmt.executeQuery();
			
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				
				BoardBean board = new BoardBean();
				// BoardBean 객체에 조회된 1개 레코드 정보를 모두 저장
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
				
				// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 BoardBean 객체 추가
				boardList.add(board);
				}
			System.out.println(boardList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return boardList;
		
		
	}
	
	public int  selectListcount() {
		int listCount = 0;
		
		con=getConnection();
		try {
			String sql = "SELECT COUNT(num) FROM board ";
			pstmt=con.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		return listCount;
	}
	
	
	public BoardBean selectBoard(int num) {
		BoardBean board = null;
			
		try {
			con=getConnection();
			
			String sql = "SELECT * FROM board WHERE num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();
			
			
				board = new BoardBean();
				
				if(rs.next()) {
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		return board;
	}
	
	public void updateReadcount(int num) {
			// 조회수 올리는 방법
			try {
			
			con = getConnection();
			
			String sql = "UPDATE board SET readcount=readcount+1 WHERE num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
	}
	
	public int updateBoard(BoardBean board) {
		int updateCount = 0;
		
		try {
			con=getConnection();
			if(board.getPass().equals("SELECT *FROM WHERE pass=?")) {
			String sql = "UPDATE board SET name=?, subject=?, content=? WHERE num=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getNum());
		
			
			} else {
				String sql = "UPDATE board SET name=?, pass=?, subject=?, content=? WHERE num=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, board.getName());
				pstmt.setString(2, board.getPass());
				pstmt.setString(3, board.getSubject());
				pstmt.setString(4, board.getContent());
				pstmt.setInt(5, board.getNum());
			}
		
	
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(con);
		}
		
		return updateCount;
	
	}
	
	public int deleteBoard(int num, String pass) {
		int deleteCount = 0;
		
		try {
			con = getConnection();
			
			// 글번호와 패스워드가 모두 일치하는 게시물 조회
			String sql = "SELECT * FROM board WHERE num=? AND pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 조회 결과가 있을 경우(= 패스워드까지 일치할 경우)에만 삭제 작업 수행
				sql = "DELETE FROM board WHERE num=?";
				pstmt2 = con.prepareStatement(sql);
				pstmt2.setInt(1, num);
				deleteCount = pstmt2.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL 구문 오류 - deleteBoard()");
		} finally {
			close(pstmt);
			close(pstmt2);
			close(con);   
		}
		
		return deleteCount;
		
		
		
	}
	
	public ArrayList<BoardBean> selectRecentBoardList() {
		ArrayList<BoardBean> boardList = null;
		
		try {
			con=getConnection();
			
			String sql = "SELECT * FROM board ORDER BY num DESC limit ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 5);
			rs =  pstmt.executeQuery();
			
			boardList = new ArrayList<BoardBean>();
			
			while(rs.next()) {
				BoardBean board = new BoardBean();
			
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setPass(rs.getString("pass"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
			
				boardList.add(board); 
			}
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
			
		return boardList ;
	}
	
	
	// ---------------------- 검색 기능 ----------------------
		// 검색어에 해당하는 게시물 목록 갯수를 조회하는 selectSearchListCount()
		// => 파라미터 : 검색어(search), 검색타입(searchType)    리턴타입 : int(listCount)
		public int selectSearchListCount(String search, String searchType) {
			int listCount = 0;
			
			try {
				con = getConnection();
				
				String sql = "SELECT COUNT(num) FROM board WHERE " + searchType + " LIKE ?";
				pstmt = con.prepareStatement(sql);
				// 검색어 생성을 위해서는 검색 키워드 앞뒤로 "%" 문자열 결합 필요
				pstmt.setString(1, "%" + search + "%");
				rs = pstmt.executeQuery();
				
				// 조회된 결과값의 첫번째 값(1번 인덱스)을 listCount 변수에 저장
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectListCount()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			
			return listCount;
		}
		
		
		// 검색어에 해당하는 게시물 목록 조회작업을 수행하는 selectSearchBoardList()
		// => 파라미터 : 현재 페이지 번호(pageNum), 표시할 목록 갯수(listLimit), 검색어(search), 검색타입(searchType)
		//  리턴타입 : java.util.ArrayList<BoardBean>(boardList)
		public ArrayList<BoardBean> selectSearchBoardList(
				int pageNum, int listLimit, String search, String searchType) {
			ArrayList<BoardBean> boardList = null;
			
			try {
				// 1 & 2단계
				con = getConnection();
				
				// 현재 페이지에서 불러올 목록(레코드)의 첫번째(시작) 행번호 계산
				int startRow = (pageNum - 1) * listLimit;
				
				// 3단계. SQL 구문 작성 및 전달
				// 검색어에 해당하는 board 테이블의 모든 레코드 조회(글번호(num) 기준으로 내림차순 정렬)
				String sql = "SELECT * FROM board "
						+ "WHERE " + searchType + " LIKE ? "
						+ "ORDER BY num DESC LIMIT ?,?";
				// => 목록갯수는 파라미터로 전달받은 listLimit 값 사용
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, listLimit);
				
				// 4단계. SQL 구문 실행 및 결과 처리
				rs = pstmt.executeQuery();
				
				// 전체 레코드를 저장할 ArrayList<BoardBean> 객체 생성
				// => 주의! 반복문 시작 전에 미리 생성해야함
				boardList = new ArrayList<BoardBean>();
				
				// 다음레코드가 존재할 동안 반복하면서
				// 1개 레코드 정보를 BoardBean 객체에 저장 후
				// 다시 BoardBean 객체를 전체 레코드 저장하는 ArrayList<BoardBean> 객체에 추가
				while(rs.next()) {
					// 1개 레코드를 저장할 BoardBean 객체 생성
					BoardBean board = new BoardBean();
					// BoardBean 객체에 조회된 1개 레코드 정보를 모두 저장
					board.setNum(rs.getInt("num"));
					board.setName(rs.getString("name"));
					board.setPass(rs.getString("pass"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setDate(rs.getDate("date"));
					board.setReadcount(rs.getInt("readcount"));
					
					// 전체 레코드를 저장하는 ArrayList 객체에 1개 레코드가 저장된 BoardBean 객체 추가
					boardList.add(board);
				}
				
//					System.out.println(boardList);
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("SQL 구문 오류 - selectBoardList()");
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			
			return boardList;
		}
		
	}