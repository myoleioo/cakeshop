package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.CartListDto;
import spring.model.ProductBean;

import spring.repository.ProductRepository;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductRepository productrepo;
	

	@GetMapping(value="/addproduct")
	public ModelAndView addproduct() {
		return new ModelAndView("addproduct","pbean",new ProductBean());
	}

	@PostMapping(value = "/createproduct")
	public String createProduct(@ModelAttribute("pbean")ProductBean bean,RedirectAttributes redirectAttributes) {
		int result=productrepo.insertProduct(bean);
		if(result>0) {
			redirectAttributes.addFlashAttribute("success","Adding Product sucessful");

		}else {
			redirectAttributes.addFlashAttribute("error","Adding Product Fail");
		}
		return "redirect:addproduct";
	}
	
	
//	@ModelAttribute("productlist")
//	public List<ProductDto> getRecentComments() {
//		List<ProductDto> productList = new ArrayList<ProductDto>();
//		productList = productrepo.selectAllProduct();
//		System.out.println(productList);
//		return productList;
//	}
	
	
	
}
