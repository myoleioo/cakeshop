package spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserBean {
	private Integer userId;
	private String name;
	private String email;
	private String password;
	private String conpassword;
	private String role;
	private MultipartFile file;
	private String filePath;
	

}
