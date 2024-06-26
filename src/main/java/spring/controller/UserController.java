package spring.controller;

import java.time.LocalDate;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.FeedbackBean;
import spring.model.LoginBean;
import spring.model.UserBean;
import spring.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository userrepo;
	
	ServletContext context;
	
	@GetMapping(value = "/index")
	public ModelAndView home() {
		return new ModelAndView("indexheader");
	}
	
	@ModelAttribute("registerbean")
	public UserBean getRegisterBean() {
		UserBean rbean = new UserBean();
		return rbean;
	}
	
	@ModelAttribute("loginbean")
	public LoginBean getLoginBean() {
		LoginBean lbean = new LoginBean();
		return lbean;
	}
	
	@GetMapping(value = "/get-login")
	public String getLogin(Model model) {
		return "home";
	}
	
	
	@PostMapping(value = "/register")
	public String Register(@ModelAttribute("registerbean") UserBean bean, RedirectAttributes redirectAttribute) {
		int result = userrepo.insertUser(bean);
		if (result > 0) {
			redirectAttribute.addFlashAttribute("success", "Register Successful");
			System.out.println("Register successful");
			redirectAttribute.addFlashAttribute("loginError", true);


		} else {
			redirectAttribute.addFlashAttribute("RegisterError", true);
			redirectAttribute.addFlashAttribute("error", "Register fail");
			System.out.println("Register fail");

		}
		return "redirect:/";

	}
	
	@PostMapping(value = "/login")
	public String checkuser(@ModelAttribute("loginbean") LoginBean bean, HttpSession session, Model m,
			RedirectAttributes redirectAttribute) {
		boolean isLogin = false;
		boolean checked = userrepo.selectEmail(bean.getEmail());
		if (!checked) {
			m.addAttribute("emailerror", "Please Register");
			System.out.println("Login fail");
			m.addAttribute("loginError", true);
			return "home";
		} 
		UserBean ubean = userrepo.selectUser(bean);
		if (ubean == null) {
			
			System.out.println("password fail");
			redirectAttribute.addFlashAttribute("passworderror1", true);
			redirectAttribute.addFlashAttribute("loginbean", bean);
			redirectAttribute.addFlashAttribute("passworderror", "Password incorrect");
			redirectAttribute.addFlashAttribute("loginError", true);
			redirectAttribute.addFlashAttribute("loginFail", "Login Fail!! Please Login Again.");
			
			return "redirect:get-login";

		} else {
			session.setAttribute("ubean", ubean);
			session.setAttribute("sessionEmail", ubean.getEmail());// for subscription
			session.setAttribute("sessionId", ubean.getUserId());
			isLogin = true;
			session.setAttribute("sessionimg",ubean.getFilePath());
			session.setAttribute("sessionLogin", isLogin);
			session.setAttribute("name", ubean.getName());
			session.setAttribute("role", ubean.getRole());
			if(ubean.getRole().equals("Customer")) {
				return "redirect:/";
			}
			
			else {
				return "redirect:/adminpage";
			}

		}
	}
	
	@ModelAttribute("give")
	public FeedbackBean getFeedbackBean() {
		FeedbackBean fbean = new FeedbackBean();
		return fbean;
	}
	
	@PostMapping(value = "/feedback")
	public String giveFeedback(@ModelAttribute("give") FeedbackBean fbean, Model m, HttpSession session) {

		int userId = (int) session.getAttribute("sessionId");
		fbean.setReviewDate(LocalDate.now());
		userrepo.insertFeedback(fbean, userId);
		if (userId == 0) {
			System.out.println("insert fail");
		} else {
			System.out.println("insert success");
			}
		return "redirect:/";

	}

}
