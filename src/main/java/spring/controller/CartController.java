package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {

    @PostMapping("/add-to-cart")
    public void addToCart(@RequestParam Map<String, String> params, HttpServletRequest request) {
        HttpSession session = request.getSession();
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }
        cart.add(params);
        session.setAttribute("cart", cart);

        // Update cart quantity
        int cartQuantity = cart.size();
        session.setAttribute("cartQuantity", cartQuantity);
    }
}

