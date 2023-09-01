package mk.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class MemberDao {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static MemberDao mdao;
	
	private MemberDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static MemberDao getInstance() {
		if(mdao==null)
			mdao = new MemberDao();
		return mdao;
	}
	
public MemberBean getMemberInfo(String id, String password) {
		
		MemberBean member = null;
		String sql = "select * from mk_member where id=? and password=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				member = getMember(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}

	public MemberBean findId(MemberBean mb) {
		String sql = "select * from mk_member where name=? and tel=?";
		MemberBean member = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getTel());
			
			rs = ps.executeQuery();
			
			if(rs.next()) { 
				member = getMember(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public MemberBean findPw(MemberBean mb) {
		String sql = "select * from mk_member where id=? and tel=?";
		MemberBean member = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getId());
			ps.setString(2, mb.getTel());
			
			rs = ps.executeQuery();
			
			if(rs.next()) { 
				member = getMember(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public boolean searchId(String userid) {
		boolean result = false;
		String sql = "select * from mk_member where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int insertMember(MemberBean mb) {
			
			int cnt = -1;
			String sql = "insert into mk_member values(mk_memseq.nextval,?,?,?,?,?,?)";
			
			try {
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, mb.getName());
				ps.setString(2, mb.getId());
				ps.setString(3, mb.getPassword());
				ps.setInt(4, mb.getBirth());
				ps.setString(5, mb.getEmail());
				ps.setString(6, mb.getTel());
				
				cnt = ps.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(ps != null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return cnt;
		}
	
	public ArrayList<MemberBean> searchName(String name) {
		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		String sql = "select * from mk_member where name=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberBean member = new MemberBean();
				
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setBirth(rs.getInt("birth"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				
				lists.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}
	
	public ArrayList<MemberBean> getAllMember() {
		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		String sql = "select * from mk_member order by no";
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MemberBean member = new MemberBean();
				
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setBirth(rs.getInt("birth"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				
				lists.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}
	
	public MemberBean memberinfo(String id) {
		MemberBean member = new MemberBean();
		String sql = "select * from mk_member where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				member.setNo(rs.getInt("no"));
				member.setName(rs.getString("name"));
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setBirth(rs.getInt("birth"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return member;
	}
	
	public int updatemember(MemberBean mb , String id){
		String sql = "update mk_member set name=?, birth=?, email=?, tel=? where id=?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mb.getName());
			ps.setInt(2, mb.getBirth());
			ps.setString(3, mb.getEmail());
			ps.setString(4, mb.getTel());
			ps.setString(5, mb.getId());

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	private MemberBean getMember(ResultSet rs2) throws SQLException {
		
		MemberBean member = new MemberBean();
		member.setNo(rs2.getInt("no"));
		member.setName(rs2.getString("name"));
		member.setId(rs2.getString("id"));
		member.setPassword(rs2.getString("password"));
		member.setBirth(rs2.getInt("birth"));
		member.setEmail(rs2.getString("email"));
		member.setTel(rs2.getString("tel"));
		
		return member;
	}

}
