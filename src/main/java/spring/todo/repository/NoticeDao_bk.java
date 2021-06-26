package spring.todo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import spring.todo.vo.NoticeSch;
import spring.todo.vo.NoticeVo;

public class NoticeDao_bk {
	private Connection con=null;
	private java.sql.Statement stmt1,stmt2;
	private PreparedStatement pstmt1=null,pstmt2=null;
	private ResultSet rs1=null,rs2=null;
	/*
	public void setCon() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//String info="jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
		//con = DriverManager.getConnection(info, "test", "1111");
		p.setValidationQuery("select 1");
		
		String info="jdbc:mysql://localhost:3306/notice_test?serverTimezone=Asia/Seoul";
		con = DriverManager.getConnection(info, "root", "park0260!!");
		con.setHoldability(900000000);
	}
	*/ 
	
		//커넥션 풀 방식 이용해서 connection을 직접 관리해주면서 쓰레드 관리가 됨
		public Connection setCon(Connection con){	
				try {
					
					try {
						Context init = new InitialContext();
						DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/test");
						con=ds.getConnection();
						System.out.println("연결성공");
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} catch (NamingException e) {
					e.printStackTrace();
				}
				return con;
		}
	

	public int getTotalCnt(){
		
		int totCnt=0;
		con= setCon(con);
		try {
				String sql="select count(no) as cnt from notice";
				stmt1 = con.createStatement();
				rs1= stmt1.executeQuery(sql);
				if(stmt1.getResultSet()!=null){
					if (rs1.next()) {
						totCnt = rs1.getInt("cnt");
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(rs1!=null){
				try {
					rs1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt1!=null){
				try {
					stmt1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return totCnt;
	}
	
	public ArrayList<NoticeVo> getList(NoticeSch sch){
		ArrayList<NoticeVo> arr=new ArrayList<NoticeVo>();
		con= setCon(con);
		try {
			
			String sql=	"select *from" 
						+"( select @rownum:=@rownum+1 as rownum,n1.*"
						+" from notice n1,(select @rownum:=0) r ) n"
						+" order by n.rownum desc,n.dday desc"
						+" limit "+sch.getStart()+","+sch.getPageSize();
			
			stmt2 = con.createStatement();
			rs2= stmt2.executeQuery(sql);			
			NoticeVo notice=null;
			
			while (rs2.next()) {
						notice = new NoticeVo();
						notice.setNo(rs2.getInt(2));
						notice.setTitle(rs2.getString(3));
						notice.setWriter(rs2.getString(4));
						notice.setDday(rs2.getDate(5));
						arr.add(notice);
					}				
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		finally {
			if(rs2!=null){
				try {
					rs2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt2!=null){
				try {
					stmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
		return arr; 
	}
	
}
