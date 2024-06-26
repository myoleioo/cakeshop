package spring.controller;

import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.model.CartListDto;
import spring.model.FeedbackBean;
import spring.model.LoginBean;
import spring.model.ProductDto;
import spring.model.UserBean;
import spring.repository.ProductRepository;

@Controller
public class HomeController {
	@Autowired
	ProductRepository productrepo;
	

	@GetMapping(value="/")

	public String home(Model m) {
		List<ProductDto>productList= productrepo.selectAllProduct();
		 m.addAttribute("productlist",productList);
		return "home";
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
	
	@ModelAttribute("give")
	public FeedbackBean getFeedbackBean() {
		FeedbackBean fbean = new FeedbackBean();
		return fbean;
	}
	
	@GetMapping(value="about")

	public String about() {
		return "about";
	}
	
	@GetMapping(value="profile")

	public String profile() {
		return "profile";
	}
	
	@GetMapping(value="forgotPassword")

	public String forgotPassword() {
		return "forgotPassword";
	}
	
	@GetMapping(value="shop")

	public String shop(Model m) {
		 List<ProductDto>productList= productrepo.selectAllProduct();
		 m.addAttribute("productList",productList);
		return "shop";
	}
	
	@GetMapping(value="adminpage")

	public String showAllProduct(Model m) {
		List<ProductDto>showallproduct= productrepo.selectAllProduct();
		 m.addAttribute("showallproduct",showallproduct);
		return "showallproduct";
	}
	
	
	@GetMapping(value="showallorder")

	public String showOrder() {
		return "showallorder";
	}
	
	@GetMapping(value="checkout")

	public String checkout() {
		return "checkout";
	}
	
	
	@GetMapping(value="content")

	public String content() {
		return "content";
	}
	
	@GetMapping(value="shopdetails")

	public String shopDetails() {
		return "shopdetails";
	}
	
	
	@GetMapping(value = "shoppingcart/{productId}")
	public String shoppingCart(@PathVariable("productId") int cid, HttpSession session, Model model) {
	    @SuppressWarnings("unchecked")
	    List<CartListDto> cartBean = (List<CartListDto>) session.getAttribute("cartBean");

	    if (cartBean == null) {
	        cartBean = new ArrayList<>();
	    }

	    CartListDto newProduct = productrepo.getCartList(cid).get(0);
	    cartBean.add(newProduct);
	    session.setAttribute("cartBean", cartBean);

	    // Calculate the total price
	    double totalPrice = cartBean.stream().mapToDouble(CartListDto::getPrice).sum();

	    // Add the total price to the model
	    model.addAttribute("totalPrice", totalPrice);

	    System.out.println(cartBean);
	    return "shoppingcart";
	}

	

	
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//@GetMapping(value = "cartlist/{productId}}")
	//public String showPaymentForm(@PathVariable("productId") int cid,RedirectAttributes rda) {
	//	CartListDto cartBean =productrepo.getCartList(cid);
	//	rda.addFlashAttribute("cartBean", cartBean);
	//	return "redirect:/shop";
	//}
	
}
