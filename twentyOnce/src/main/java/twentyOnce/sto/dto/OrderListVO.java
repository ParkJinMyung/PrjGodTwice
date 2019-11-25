package twentyOnce.sto.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderListVO {
	 	private String orderId; 
	    private String userId; 
	    private String orderRec; 
	    private String userAddr1;
	    private String userAddr2; 
	    private String userAddr3; 
	    private String orderPhone; 
	    private int amount; 
	    private Date orderDate;
	    private String delivery;
	    
	    private int orderDetailsNum; 
	    private int gdsNum; 
	    private int cartStock;
	    
	    private String sto_name;
		private int sto_price; 
		private String sto_imageurl;
		
		public String getOrderId() {
			return orderId;
		}
		
		public void setOrderId(String orderId) {
			this.orderId = orderId;
		}
		
		public String getUserId() {
			return userId;
		}
		
		public void setUserId(String userId) {
			this.userId = userId;
		}
		
		public String getOrderRec() {
			return orderRec;
		}
		
		public void setOrderRec(String orderRec) {
			this.orderRec = orderRec;
		}
		
		public String getUserAddr1() {
			return userAddr1;
		}
		
		public void setUserAddr1(String userAddr1) {
			this.userAddr1 = userAddr1;
		}
		
		public String getUserAddr2() {
			return userAddr2;
		}
		
		public void setUserAddr2(String userAddr2) {
			this.userAddr2 = userAddr2;
		}
		
		public String getUserAddr3() {
			return userAddr3;
		}
		
		public void setUserAddr3(String userAddr3) {
			this.userAddr3 = userAddr3;
		}
		
		public String getOrderPhone() {
			return orderPhone;
		}
		
		public void setOrderPhone(String orderPhone) {
			this.orderPhone = orderPhone;
		}
		
		public int getAmount() {
			return amount;
		}
		
		public void setAmount(int amount) {
			this.amount = amount;
		}
		
		public Date getOrderDate() {
			return orderDate;
		}
		
		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
		}
		
		public int getOrderDetailsNum() {
			return orderDetailsNum;
		}
		
		public void setOrderDetailsNum(int orderDetailsNum) {
			this.orderDetailsNum = orderDetailsNum;
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
		
		public String getDelivery() {
			return delivery;
		}

		public void setDelivery(String delivery) {
			this.delivery = delivery;
		}

		public void setCartStock(int cartStock) {
			this.cartStock = cartStock;
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