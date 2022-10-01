package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//데이터 베이스의 커넥션풀을 사용하도록 설정하는 메소드
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("pool");
			//datasource
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertBoard(BoardBean bean) {
		
		getCon();
		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야함.
		int ref = 0;	//글 그룹을 의미 = 쿼리를 실행시켜서 가장 큰 ref값을 가져온 후 + 1을 더해주면 됨
		int re_step = 1; 	//새 글 이기에 = 부모글이기에
		int re_level = 1;
		
		try {
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql = "SELECT MAX(ref) FROM board";
			//쿼리 실행 객체
			pstmt = con.prepareStatement(refsql);
			//쿼리실행 후 결과를 리턴
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1) + 1; //최대값에 +1을 더해서 글 그룹을 설정
			}
			//실제로 게시글 전체값을 테이블에 저장
			String sql = "INSERT INTO board VALUES(board_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, ?, ?, 0, ?)";
			//?에 값을 맵핑
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//쿼리를 실행하시오
			pstmt.executeUpdate();
			//자원 반납
			con.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//모든 게시글을 리턴해주는 메소드 작성
	public Vector<BoardBean> getAllBoard(int start, int end) {
		
		//리턴할 객체 선언
		Vector<BoardBean> v = new Vector<>();
		getCon();
		
		try {
			//쿼리준비
			String sql = "SELECT * FROM (SELECT A.*,Rownum Rnum FROM (SELECT * FROM board ORDER BY ref DESC , re_step ASC)A)"
						+ "WHERE Rnum >= ? and Rnum <= ?";
			//쿼리를 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			//쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				//패키징한 데이터를 벡터에 저장
				v.add(bean);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//Board Info에 하나의 게시글을 리턴하는 메소드
	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		
		try {
			//조회수 증가 쿼리
			String readsql= "UPDATE board SET readcount = readcount + 1 WHERE num = ?" ;
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			//쿼리 준비
			String sql = "SELECT * FROM board WHERE num = ?";
			//쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public void reWriteBoard(BoardBean bean) {
		//부모 글 그룹과 글 레벨 글 스텝을 읽어들임
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		
		try {
		////////////////// 핵심 코드 //////////////////
			//부모글보다 큰 re_level의 값을 전부 1씩 증가시켜줌
			String levelsql = "UPDATE board SET re_level = re_level + 1 WHERE ref = ? AND re_level > ?";
			//쿼리 실행 객체 선언
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			//쿼리 실행
			pstmt.executeUpdate();
			//답병글 데이터를 저장
			String sql = "INSERT INTO board VALUES(board_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE, ?, ?, ?, 0, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref); //부모의 ref값을 넣어줌
			pstmt.setInt(6, re_step + 1); //답글 이기에 부모 글 re_step에 1을 더해 줌
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//board update, delete시 하나의 게시글을 리턴
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		getCon();
		
		try {
			
			//쿼리 준비
			String sql = "SELECT * FROM board WHERE num = ?";
			//쿼리 실행 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//쿼리 실행 후 결과 저장
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	
	//update와 delete시 필요한 패스워드값을 리턴해주는 메소드
	public String getPass(int num) {
		//리턴할 변수 객체 선언
		String pass ="";
		getCon();
		
		try {
			//쿼리준비
			String sql = "SELECT password FROM board WHERE num = ?";
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
			//자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(BoardBean bean) {
		
		getCon();
		
		try {
			
			//쿼리 준비
			String sql = "UPDATE board SET subject = ?, content = ? WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			//?값을 대입
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteBoard(int num) {
		getCon();
		
		try {
			//쿼리준비
			String sql = "DELETE FROM board WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			//?값 맵핑
			pstmt.setInt(1, num);
			//쿼리 실행
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//전체 글의 갯수를 리턴하는 메소드
	public int getAllCount() {
		//게시글의 전체수를 저장하는 변수
		int count = 0;
		getCon();
		
		try {
			//쿼리 준비
			String sql = "SELECT COUNT(*) FROM board";
			//쿼리를 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);	//전체 게시글 수 리턴
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
