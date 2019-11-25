package twentyOnce.sto.dao;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import twentyOnce.sto.dto.CartListVo;
import twentyOnce.sto.dto.OrderDetailVO;
import twentyOnce.sto.dto.OrderListVO;
import twentyOnce.sto.dto.OrderVO;
import twentyOnce.sto.dto.ProductDto;

public interface IDao {
	public ArrayList<ProductDto> list(String sto_name,  String sto_price,  String sto_date, String sto_code,
			String country, String sto_quantity, String sto_imageurl);
	public ArrayList<CartListVo> cartList(String userId);
	public ArrayList<OrderVO> orderList(String userId);
	public ArrayList<OrderListVO> orderView (String orderId, String userId);
	public void write(String sto_code,  String sto_name,  String sto_price, String sto_country, String sto_imageurl, String sto_date, String sto_contant, String sto_detailimageurl1, String sto_quantity, String sto_detailimageurl2, String sto_detailimageurl3);
	public void modify(String sto_code, String sto_name, 
			String sto_price, String sto_country, String sto_quantity, String sto_contant);
	public void delete( String sto_code);
	public ProductDto contentView(String sto_code);
	public ProductDto modifyview(String sto_code);
	public void replyShape( String strGroup, String strStep);
	public ProductDto order_view(String sto_code);
	public void addcart (int cartNum, String userId, int gdsNum, int cartStock, Date addDate);
	public void deleteCart(int cartNum, String userId);
	public void order(OrderVO order, OrderDetailVO orderDetail);
	public void orderInfo(String orderRec, String userAddr1, String userAddr2, String userAddr3, String orderPhone, String orderId, String userId, String amount, String orderDate);
	public void orderInfo_Details(String orderDetailsNum);
	public void cartAllDelete(String userId);
	public void delivery(String delivery, String orderId);
	public void addcart(String userId, String gdsNum, String cartStock);
}