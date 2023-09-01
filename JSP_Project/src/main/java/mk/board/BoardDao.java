package mk.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class BoardDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null ;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDao bdao;

	public static BoardDao getInstance() {
		if(bdao==null) {
			bdao = new BoardDao();
			System.out.println("객체 생성");
		}
		return bdao;
	}

	private BoardDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
			System.out.println(1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//

	public int getArticleCount(){

		int count = 0;
		String sql = "select count(*) as cnt from mk_board";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} try {
			if(ps != null)
				ps.close();
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("전체 레코드 갯수:" + count);
		return count;
	}//getArticleCount


	public ArrayList<BoardBean> getArticles(int start, int end){
		//1페이지 : 1,5
		//2페이지 : 6,10
		
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();

		//3.sql문 작성, 분석
		//String sql = "select * from board order by num desc";
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from mk_board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			if (ps != null)
				System.out.println("SQL문 분석 성공");
			else
				System.out.println("SQL문 분석 실패");

			//4.sql문 실행
			rs = ps.executeQuery();
			if (rs != null)
				System.out.println("select 실행 성공");
			else
				System.out.println("select 실행 실패");

			while(rs.next()){
				BoardBean bb = new BoardBean();

				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setRef(rs.getInt("ref"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));

				lists.add(bb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			//5.자원 반납
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return lists;
	}//getArticles

	//원글쓰기
	public int insertArticle(BoardBean bb) { // 5+2
		int cnt = -1;
		String sql = "insert into mk_board(num,writer,subject,email,content,passwd,reg_date,ref,re_step,re_level,ip) "
				+ "values(mk_board_seq.nextval,?,?,?,?,?,?,mk_board_seq.currval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getEmail());
			ps.setString(4, bb.getContent());
			ps.setString(5, bb.getPasswd());
			ps.setTimestamp(6, bb.getReg_date());
			ps.setInt(7, 0); // re_step
			ps.setInt(8, 0); // re_level
			ps.setString(9, bb.getIp());

			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;

	}//insertArticle
	
	public BoardBean getArticleByNum(String num) {

		String sql2 = "update mk_board set readcount = readcount+1 where num=?";


		BoardBean bb = new BoardBean();
		String sql = "select * from mk_board where num=?";
		try {

			ps = conn.prepareStatement(sql2);
			ps.setString(1, num);
			ps.executeUpdate();

			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setEmail(rs.getString("email"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				bb.setIp(rs.getString("ip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}//getArticleByNum
	
	public BoardBean getCoententByNum(String num) {
		BoardBean bb = new BoardBean();
		
		String sql = "select * from mk_board where num=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setEmail(rs.getString("email"));
				bb.setContent(rs.getString("content"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}
	
	public int updateArticle(BoardBean bb) {
		int cnt = -1;
		String sql = "select passwd from mk_board where num=?";
		String sql2 = "update mk_board set writer=?,subject=?,email=?,content=? where num=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();

			if (rs.next()) {
				String pw = rs.getString("passwd");
				if (pw.equals(bb.getPasswd())) {
					
					ps = conn.prepareStatement(sql2);
					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getSubject());
					ps.setString(3, bb.getEmail());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());
					
					cnt =ps.executeUpdate();
				}else {
					
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public int deleteArticle(String num, String passwd) {
		String sql = "select passwd from mk_board where num=?";
		String sql2 = "delete mk_board where num=?";
		int cnt = -1;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dbpw = rs.getString("passwd"); 
				if(dbpw.equals(passwd)) { // 입력한비번 == db비번
					ps = conn.prepareStatement(sql2);
					ps.setString(1, num);
					cnt = ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();

				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//deleteArticle
	
	public int replyArticle(BoardBean bb) {
		//7가지 정보 답글
		//3가지 정보 부모정보(ref,re_step,re_level)
		int cnt = -1;
		int re_step, re_level;
		String sql = "update mk_board set re_step=re_step+1 where ref=? and re_step>?";
		String sql2 = "insert into mk_board(num,writer,subject,email,content,passwd,reg_date,ref,re_step,re_level,ip) "
				+ "values(mk_board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			ps.executeUpdate();
			
			re_step=bb.getRe_step()+1;
			re_level=bb.getRe_level()+1;
			
			ps = conn.prepareStatement(sql2);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getEmail());
			ps.setString(4, bb.getContent());
			ps.setString(5, bb.getPasswd());
			ps.setTimestamp(6, bb.getReg_date());
			ps.setInt(7, bb.getRef()); // re_step
			ps.setInt(8, re_step); // re_step
			ps.setInt(9, re_level); // re_level
			ps.setString(10, bb.getIp());

			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();

				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
}
