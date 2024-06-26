package spring.repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import spring.model.CartListDto;
import spring.model.ProductBean;
import spring.model.ProductDto;

public class ProductRepository {
	
	public int insertProduct(ProductBean pbean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		if (!checkDescription(pbean.getDescription())) {
			try {
				PreparedStatement ps = con
						.prepareStatement("insert into product(productName,price,description,photo) value(?,?,?,?);");
				ps.setString(1, pbean.getProductName());
				ps.setDouble(2, pbean.getPrice());
				ps.setString(3, pbean.getDescription());
				String filePath = fileStorage(pbean.getFile());
				pbean.setFilePath(filePath);
				ps.setString(4, pbean.getFilePath());
				result = ps.executeUpdate();

			} catch (SQLException e) {
				System.out.println("product insert :" + e.getMessage());

			}

		} else {
			System.out.println("Do already exist!!");
		}
		return result;
	}
	
	public boolean checkDescription(String description) {
		boolean status = false;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select description from product where description=?");
			ps.setString(1, description);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = true;
			}

		} catch (SQLException e) {
			System.out.println("check description :" + e.getMessage());
		}
		return status;
	}
	
	public String fileStorage(MultipartFile file) {
		
		String uploadDir = "./images/productphoto";
		Path fileStorageLocation = Paths.get(uploadDir ).toAbsolutePath().normalize();
        try {
            if (!Files.exists(fileStorageLocation)) {
                Files.createDirectories(fileStorageLocation);
            }
        } catch (Exception ex) {
            throw new RuntimeException("Could not create the directory where the uploaded files will be stored.", ex);
        }
        
        // Normalize file name
        String fileName = file.getOriginalFilename();

        try {
            if (fileName.contains("..")) {
                throw new RuntimeException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = fileStorageLocation.resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            
            System.out.println("File stored at: " + targetLocation.toString());
            
            return uploadDir+"/"+fileName;
            
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + fileName + ". Please try again!", ex);
        }
		
	}
	
	public List<ProductDto> selectAllProduct() {
		List<ProductDto> productlst = new ArrayList<ProductDto>();
		ProductDto product= null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from product");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				product = new ProductDto();
				product.setProductId(rs.getInt("productId"));
				product.setProductName(rs.getString("productName"));
				product.setPrice(rs.getDouble("price"));
				product.setDescription(rs.getString("description"));
				product.setFilePath(rs.getString("photo"));
				productlst.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Product Select : " + e.getMessage());
		}
		return productlst;
	}

	public List<CartListDto> getCartList(int cid) {
		List<CartListDto> cartlst = new ArrayList<CartListDto>();
		CartListDto bean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from product where productId= ?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				bean = new CartListDto();
				bean.setProductId(rs.getInt("productId"));
				bean.setProductName(rs.getString("productName"));
				bean.setPrice(rs.getDouble("price"));
				bean.setDescription(rs.getString("description"));
				bean.setFilePath(rs.getString("photo"));
				cartlst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("Product Select : " + e.getMessage());
		}
		return cartlst;
	}

}
