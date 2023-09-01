package mk.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class categoryDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static categoryDao cdao;
	
	private categoryDao() {
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
	
	public static categoryDao getInstance() {
		if(cdao==null)
			cdao = new categoryDao();
		return cdao;
	}
	
	public int insertCategory(categoryBean cb) {
		int cnt = -1;
		String sql = "insert into mk_category values(mk_catseq.nextval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cb.getCode());
			ps.setString(2, cb.getCname());
			
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
	}
	
	
	public ArrayList<categoryBean> allCategory() {
		ArrayList<categoryBean> lists = new ArrayList<categoryBean>();
		String sql = "select * from mk_category order by cnum";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				categoryBean cb = new categoryBean();
				
				cb.setCnum(rs.getInt("cnum"));
				cb.setCode(rs.getString("code"));
				cb.setCname(rs.getString("cname"));
				
				lists.add(cb);
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
	
	public int deleteCategory(String cnum) {
		int cnt = -1;
		String sql = "delete from mk_category where cnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cnum);
			
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
	}
}
