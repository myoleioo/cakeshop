package spring.model;

import java.time.LocalDate;

import lombok.Data;

@Data
public class FeedbackBean {
	
	private Integer reviewId;
	private LocalDate reviewDate;
	private Integer rating;
	private String comment;
	

}
