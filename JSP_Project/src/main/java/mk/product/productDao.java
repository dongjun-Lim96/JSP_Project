package mk.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;




public class productDao {
	private Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static productDao pdao;
	
	public static productDao getInstance() {
		if(pdao == null) {
			pdao = new productDao();
		}
		return pdao;
	}

	private productDao(){
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertProduct(MultipartRequest mr){

		int cnt = -1;
		String sql = "insert into mk_product(pnum, pname, codename, pcompany, pimage, pqty, price, pspec, pcontents, pinputdate) "
				+ "values(mk_prod.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));

			String codename = mr.getParameter("codename");
			codename += mr.getParameter("pcode");

			ps.setString(2, codename);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6,  Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			//년-월-일
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(d);
			ps.setString(9,today);

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
	}//insertProduct

	public ArrayList<productBean> getAllProduct() {
		ArrayList<productBean> lists = new ArrayList<productBean>();
		String sql = "select * from mk_product order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				productBean pb = new productBean();

				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));

				lists.add(pb);
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
	}//getAllProduct

	public productBean getProductByPnum(String pnum){
		productBean pb = new productBean();

		String sql = "select * from mk_product where pnum="+pnum;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if(rs.next()) {
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}				
		return pb;
	}//getProductByPnum

	public int deleteProduct(String pnum) {
		int cnt=-1;
		String sql ="delete from mk_product where pnum=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, pnum);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//deleteProduct

	public int updateProduct(MultipartRequest mr,String img){
		String sql = "update mk_product set pname=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=? where pnum=?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			ps.setString(3, img);
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setString(8, mr.getParameter("pnum"));

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

	}//updateProduct

	public ArrayList<productBean> getProductByPspec(String pspec) {
		ArrayList<productBean> list = new ArrayList<productBean>();
		String sql = "select * from mk_product where pspec=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pspec);
			rs = ps.executeQuery();
			while (rs.next()) {
				productBean pb = new productBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}//getProductByPspec

	public ArrayList<productBean> getProductByCategory(String codename){ 
		productBean pb = null;
		ArrayList<productBean> lists = new ArrayList<productBean>();
		String sql = "select * from mk_product where codename like ?"; 
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+codename+"%"); // man%, child%
			rs = ps.executeQuery();
			while(rs.next()) {
				pb = new productBean();

				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));

				lists.add(pb);
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
		return lists;
	}
	
	public ArrayList<productBean> getProdArticles(int start, int end){
		
		ArrayList<productBean> lists = new ArrayList<productBean>();

		String sql = "select pnum, pname, codename, pcompany, pimage, pqty, price, pspec, pcontents, pinputdate " ;		        
		sql += "from (select rownum as rank, pnum, pname, codename, pcompany, pimage, pqty, price, pspec, pcontents, pinputdate ";
		sql += "from (select pnum, pname, codename, pcompany, pimage, pqty, price, pspec, pcontents, pinputdate ";
		sql += "from mk_product  ";
		sql += "order by price desc)) ";
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
				productBean pb = new productBean();

				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));

				lists.add(pb);
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
	}//getprodArticles
	
	
	public void stockProduct(Vector<productBean> clist){
		String sql = "update mk_product set pqty=pqty-? where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			
			for (productBean pb : clist) {
				ps.setInt(1, pb.getPqty());
				ps.setInt(2, pb.getPnum());
				
				ps.executeUpdate();
			}

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
	}//stockProduct
	
	public ArrayList<productBean> searchProduct(String pname) {
		ArrayList<productBean> list = new ArrayList<productBean>();
		String sql = "select * from mk_product where pname like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+pname+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				productBean pb = new productBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setCodename(rs.getString("codename"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPinputdate(rs.getString("pinputdate"));
				
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
