package twentyOnce.sto.dto;

import java.sql.Date;

public class CartListVo {
	private int cartNum;
	private String userId;
	private int gdsNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String sto_name;
	private int sto_price;
	private String sto_imageurl;
	
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSto_name() {
		return sto_name;
	}

	public void setSto_name(String sto_name) {
		this.sto_name = sto_name;
	}

	public int getSto_price() {
		return sto_price;
	}

	public void setSto_price(int sto_price) {
		this.sto_price = sto_price;
	}

	public String getSto_imageurl() {
		return sto_imageurl;
	}

	public void setSto_imageurl(String sto_imageurl) {
		this.sto_imageurl = sto_imageurl;
	}
}