package mk.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import mk.product.productBean;


public class OrdersDao {
	private Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static OrdersDao odao;
	public static OrdersDao getInstance() {
		if(odao == null) {
			odao = new OrdersDao();
		}
		return odao;
	}

	private OrdersDao(){
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
	}//생성자

	public int insertOrder(int sno,Vector<productBean> clist) throws SQLException{
		int cnt = -1;
		for(int i=0;i<clist.size();i++) {

			String sql = "insert into mk_orders values(mk_orderseq.nextval,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, sno);
			ps.setInt(2,clist.get(i).getPnum());
			ps.setInt(3,clist.get(i).getPqty());
			ps.setInt(4,clist.get(i).getPqty() * clist.get(i).getPrice());
			cnt += ps.executeUpdate();
		}
		return cnt;
	}//insertOrder
	
	
	public Vector<OrdersBean> getOrderList(String memid) throws SQLException{

		Vector<OrdersBean> lists = new Vector<OrdersBean>();
		
		String sql = "select m.name as mname ,m.id mid , p.pname, o.qty, o.amount "
				+ "from (mk_member m inner join mk_orders o on m.no = o.memno) inner join mk_product p on o.pnum = p.pnum "
				+ "where id = ?";

		ps = conn.prepareStatement(sql);
		ps.setString(1, memid);
		rs = ps.executeQuery();
		while(rs.next()) {
			String mname = rs.getString("mname");
			String mid = rs.getString("mid");
			String pname = rs.getString("pname");
			String qty = rs.getString("qty");
			String amount = rs.getString("amount");
			OrdersBean ob = new OrdersBean();
			ob.setMname(mname);
			ob.setMid(mid);
			ob.setPname(pname);
			ob.setQty(Integer.parseInt(qty));
			ob.setAmount(Integer.parseInt(amount));
			lists.add(ob);
		}
		System.out.println("lists.size():" + lists.size());
		return lists;
	}//getOrderList

}
