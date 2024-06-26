package spring.repository;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;

import spring.model.FeedbackBean;
import spring.model.LoginBean;
import spring.model.UserBean;

public class UserRepository {
	
	public int insertUser(UserBean bean) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		if (!checkEmail(bean.getEmail())) {
			try {
				PreparedStatement ps = con
						.prepareStatement("insert into customer(name,email,password) value(?,?,?);");
				ps.setString(1, bean.getName());
				ps.setString(2, bean.getEmail());
				ps.setString(3, bean.getPassword());
				result = ps.executeUpdate();

			} catch (SQLException e) {
				System.out.println("user insert :" + e.getMessage());

			}

		} else {
			System.out.println("Email already exist!!");
		}
		return result;
	}
	
	public boolean checkEmail(String UserEmail) {
		boolean status = false;

		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select email from customer where email=?");
			ps.setString(1, UserEmail);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = true;
			}

		} catch (SQLException e) {
			System.out.println("check email :" + e.getMessage());
		}
		return status;
	}
	
	public String fileStorage(MultipartFile file) {
		
		String uploadDir = "./images/profilephoto";
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

            return uploadDir+"/"+fileName;
            
        } catch (IOException ex) {
            throw new RuntimeException("Could not store file " + fileName + ". Please try again!", ex);
        }
		
	}

	public int insertPhoto(UserBean photo, int id) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement("UPDATE user SET img = ? WHERE id = ?");

			String filePath = fileStorage(photo.getFile());
			photo.setFilePath(filePath);
			ps.setString(1, photo.getFilePath());
			ps.setInt(2, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("photo insert :" + e.getMessage());
		}

		return result;
	}
	
	
	
	public UserBean selectUser(LoginBean bean) {
		UserBean ubean = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from customer where email=? and password=?");
			ps.setString(1, bean.getEmail());
			ps.setString(2, bean.getPassword());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ubean = new UserBean();
				ubean.setUserId(rs.getInt("CustomerId"));
				ubean.setName(rs.getString("name"));
				ubean.setEmail(rs.getString("email"));
				ubean.setPassword(rs.getString("password"));
				ubean.setRole(rs.getString("role"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return ubean;
	}

	public boolean selectEmail(String email) {
		boolean check = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from customer where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Select Email" + e.getMessage());
		}
		return check;
	}
	
	public int insertFeedback(FeedbackBean bean, int userId) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into review(reviewDate,rating,comment,customerId) values(?,?,?,?)");
			ps.setDate(1, Date.valueOf(bean.getReviewDate()));
			ps.setInt(2, bean.getRating());
			ps.setString(3, bean.getComment());
			ps.setInt(4, userId);
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Feedback : " + e.getMessage());
		}
		return result;
	}
	
	
}
