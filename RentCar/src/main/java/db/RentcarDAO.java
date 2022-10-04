package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class RentcarDAO {

	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//커넥션 풀을 이용한 데이터베이스 연결
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//최신순 3대의 자동차를 리턴하는 메소드
	public Vector<CarListBean> getSelectCar(){
		//리턴타입 설정
		Vector<CarListBean> v = new Vector<>();
		getCon();	//커넥션이 연결되어 쿼리를 실행 가능
		
		try {
			//쿼리 준비
			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			pstmt = con.prepareStatement(sql);
			//쿼리 실행 후 결과를 Result 타입으로 리턴
			rs = pstmt.executeQuery();
			int count = 0;
			while(rs.next()) {
				CarListBean b = new CarListBean();
				b.setNo(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setCategory(rs.getInt(3));
				b.setPrice(rs.getInt(4));
				b.setUsepeople(rs.getInt(5));
				b.setCompany(rs.getString(6));
				b.setImg(rs.getString(7));
				b.setInfo(rs.getString(8));
				//벡터에 빈 클래스 저장
				v.add(b);
				count++;
				if(count > 2) break;	//반복문을 빠져나가시오
				//3개만 벡터에 저장
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//카테고리 별 자동차 리스트를 저장하는 메소드
	public Vector<CarListBean> getCategoryCar(int category){
		Vector<CarListBean> v = new Vector<>();
		
		getCon();
		try {
			//쿼리준비
			String sql = "SELECT * FROM rentcar WHERE category = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CarListBean b = new CarListBean();
				b.setNo(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setCategory(rs.getInt(3));
				b.setPrice(rs.getInt(4));
				b.setUsepeople(rs.getInt(5));
				b.setCompany(rs.getString(6));
				b.setImg(rs.getString(7));
				b.setInfo(rs.getString(8));
				
				//벡터에 빈 클래스 저장
				v.add(b);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	//모든 자동차의 리스트를 저장하는 메소드
	public Vector<CarListBean> getAllcar() {
		Vector<CarListBean> v = new Vector<>();
		getCon();
		try {
			//쿼리준비
			String sql = "SELECT * FROM rentcar";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CarListBean b = new CarListBean();
				b.setNo(rs.getInt(1));
				b.setName(rs.getString(2));
				b.setCategory(rs.getInt(3));
				b.setPrice(rs.getInt(4));
				b.setUsepeople(rs.getInt(5));
				b.setCompany(rs.getString(6));
				b.setImg(rs.getString(7));
				b.setInfo(rs.getString(8));
				
				//벡터에 빈 클래스 저장
				v.add(b);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
}
