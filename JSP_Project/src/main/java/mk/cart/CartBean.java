package mk.cart;

import java.util.Vector;

import mk.product.productBean;
import mk.product.productDao;

public class CartBean {
	private Vector<productBean> clist;

	public CartBean() {
		clist = new Vector<productBean>();
	}

	public void addProduct(String pnum,String oqty) { // 상품번호, 주문수량
		/*pnum : 14, oqty:2
		clist
		0: 11상품정보 1
		1: 14번상품정보 3
		이미 장바구니에 있으면
		장바구니에 없으면
		for(clist.size()) {
			clist.get(i).상품번호 == pnum
			clist.get(i).주문수량 += oqty
		}*/
		//이미 장바구니에 있으면
		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);
		for(int i=0;i<clist.size();i++) {
			if(clist.get(i).getPnum()==pnum_new) {
				int cpqty = clist.get(i).getPqty();
				clist.get(i).setPqty(cpqty + oqty_new);
				return;
			}
		}
		//장바구니에 없으면
		productDao pdao = productDao.getInstance();
		productBean pb = pdao.getProductByPnum(pnum);
		pb.setPqty(Integer.parseInt(oqty)); 
		clist.add(pb);
		
		System.out.println("장바구니의 상품 갯수:"+clist.size());
		for(int i=0;i<clist.size();i++) {
			System.out.println(clist.get(i).getPnum()+"/"+clist.get(i).getPqty());
		}
	}//addProduct

	public Vector<productBean> getAllProducts() {
		return clist;
	}//
	
	
	public void setEdit(String pnum, String oqty){
		
		for( productBean pb : clist) {
			if(pb.getPnum() == Integer.parseInt(pnum)) {
				if(Integer.parseInt(oqty) == 0) {
					clist.removeElement(pb);
					break;
				}else {
					pb.setPqty(Integer.parseInt(oqty));
					break;
				}
			}
		}//for
		
	}//setEdit

	public void removeProduct(String pnum){
		for( productBean pb : clist) {
			if(pb.getPnum() == Integer.parseInt(pnum)) {
				clist.removeElement(pb);
				break;
			}
		}
	}//removeProduct

	public void removeAllProduct() {
		productDao pdao = productDao.getInstance();
		pdao.stockProduct(clist);
		
		clist.removeAllElements();
	}//removeAllProduct
}
