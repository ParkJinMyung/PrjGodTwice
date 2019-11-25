package twentyOnce.sto.dao;

import java.sql.Date;
import java.util.ArrayList;
import javax.sql.DataSource;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.jdbc.core.JdbcTemplate;

import twentyOnce.sto.dto.CartListVo;
import twentyOnce.sto.dto.OrderDetailVO;
import twentyOnce.sto.dto.OrderListVO;
import twentyOnce.sto.dto.OrderVO;
import twentyOnce.sto.dto.ProductDto;

public class BoardDao implements IDao {
	
	DataSource dataSource;
	JdbcTemplate template=null;
	
	public BoardDao() {
		
	}
	
	@Override
	public ArrayList<ProductDto> list(String sto_name,  String sto_price,  String sto_date, String sto_code,
			String country, String sto_quantity, String sto_imageurl) {
		ArrayList<ProductDto> list=null;
		
		return list;
	}

	@Override
	public ArrayList<CartListVo> cartList(String userId) {
		ArrayList<CartListVo> cartList=null;
		
		return cartList;
	}
	
	public void write1(String sto_code,  String sto_name,  String sto_price, String sto_country) {
		
	}

	public ProductDto contentView(String sto_code) {
		hitUp(sto_code);
		ProductDto dto=null;
		
		return dto;
	}
	
	public ProductDto modifyview(String sto_code) {
		hitUp(sto_code);
		ProductDto dto=null;

		return dto;
	}
	

	public void hitUp(String sto_code) {
		
	}

	public void reply(String bid, final String bname,
			final String btitle, final String bcontent,
			final String bgroup, final String bstep,
			final String bindent) {
		replyShape(bgroup,bstep);
	}

	public void replyShape(final String strGroup, final String strStep) {

	}
	
	@Override
	public ProductDto order_view(String sto_code) {
		ProductDto dto=null;
		
		return dto;
	}
	
	@Override
	public void delete(String sto_code) {
		
	}

	@Override
	public void addcart(int cartNum, String userId, int gdsNum, int cartStock, Date addDate) {
		
	}

	@Override
	public void deleteCart(int cartnum, String userId) {
		
	}

	@Override
	public void order(OrderVO order, OrderDetailVO orderDetail) {
		
	}

	@Override
	public void orderInfo(String orderRec, String userAddr1, String userAddr2, String userAddr3, String orderPhone,
			String orderId, String userId, String amount, String orderDate) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cartAllDelete(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<OrderVO> orderList(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<OrderListVO> orderView(String userId, String orderId) {
		ArrayList<OrderListVO> orderView=null;
		
		return orderView;
	}

	@Override
	public void delivery(String delivery, String orderId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void orderInfo_Details(String orderDetailsNum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addcart(String userId, String gdsNum, String cartStock) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void write(String sto_code, String sto_name, String sto_price, String sto_country, String sto_imageurl,
			String sto_date, String sto_contant, String sto_detailimageurl1, String sto_quantity,
			String sto_detailimageurl2, String sto_detailimageurl3) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(String sto_code, String sto_name, String sto_price, String sto_country, String sto_quantity,
			String sto_contant) {
		// TODO Auto-generated method stub
		
	}
}