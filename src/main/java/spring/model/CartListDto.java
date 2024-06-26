package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CartListDto {
	private Integer productId;
	private String productName;
	private double price;
	private String description;
	private MultipartFile file;
	private String filePath;
	private int quantity;
	

}
