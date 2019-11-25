package twentyOnce.sto.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class ProductDto {
	 private String sto_name;
	 private int sto_price; 
	 private String sto_date; 
	 private String sto_code; 
	 private String sto_country; 
	 private int sto_quantity;
	 private String sto_imageurl;
	 private String sto_contant;
	 private String sto_detailimageurl1;
	 private String sto_detailimageurl2;
	 private String sto_detailimageurl3;
	 
	 private int mem_price;
	 
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
	
	public String getSto_date() {
		return sto_date;
	}
	
	public void setSto_date(String sto_date) {
		this.sto_date = sto_date;
	}
	
	public String getSto_code() {
		return sto_code;
	}
	
	public void setSto_code(String sto_code) {
		this.sto_code = sto_code;
	}
	
	public String getSto_country() {
		return sto_country;
	}
	
	public void setSto_country(String sto_country) {
		this.sto_country = sto_country;
	}
	
	public int getSto_quantity() {
		return sto_quantity;
	}
	
	public void setSto_quantity(int sto_quantity) {
		this.sto_quantity = sto_quantity;
	}
	
	public String getSto_imageurl() {
		return sto_imageurl;
	}
	
	public void setSto_imageurl(String sto_imageurl) {
		this.sto_imageurl = sto_imageurl;
	}
	
	////////////////////

	public int getMem_price() {
		return mem_price;
	}

	public void setMem_price(int mem_price) {
		this.mem_price = mem_price;
	}

	public String getSto_contant() {
		return sto_contant;
	}

	public void setSto_contant(String sto_contant) {
		this.sto_contant = sto_contant;
	}

	public String getSto_detailimageurl1() {
		return sto_detailimageurl1;
	}

	public void setSto_detailimageurl1(String sto_detailimageurl1) {
		this.sto_detailimageurl1 = sto_detailimageurl1;
	}

	public String getSto_detailimageurl2() {
		return sto_detailimageurl2;
	}

	public void setSto_detailimageurl2(String sto_detailimageurl2) {
		this.sto_detailimageurl2 = sto_detailimageurl2;
	}

	public String getSto_detailimageurl3() {
		return sto_detailimageurl3;
	}

	public void setSto_detailimageurl3(String sto_detailimageurl3) {
		this.sto_detailimageurl3 = sto_detailimageurl3;
	}
}