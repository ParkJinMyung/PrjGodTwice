package twentyOnce.sto.dto;

import java.sql.Date;

public class CartVo {
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	public int getCartNum() {
		return cartNum;
	}
	
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getGdsNum() {
		return gdsNum;
	}
	
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	
	public int getCartStock() {
		return cartStock;
	}
	
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	
	public Date getAddDate() {
		return addDate;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
}