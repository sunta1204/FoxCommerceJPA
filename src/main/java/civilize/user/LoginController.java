package civilize.user;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {
	
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	@Autowired
	private SalePageRepo salePageRepo;
	
	//index
	@GetMapping("/")
    public String intdex(Model model) {
		return "/index";
    }
	
	//login
		@RequestMapping(value = "/userLogin" , method = RequestMethod.POST )
		public String Login(Model model, HttpSession session , @RequestParam("username") String username 
				, @RequestParam("password") String password) {
			try {
				User user =  userRepo.findByUsernamePassword(username, password);
				if(user == null) {
					//Login Failed User pass invalid
					model.addAttribute("Error" , "Login Failed !!");
					return "/index";
				} else {
						// Admin
						if(user.getType().equals("D")) {
							session.setAttribute("uId", user.getuId());
							session.setAttribute("username", user.getUsername());
							session.setAttribute("type", user.getType());
							return "redirect:/User/dashboard";
													
						//User	
						}
					}
				} catch (Exception e) {
					model.addAttribute(e);
					return "index";
				}
			return "redirect:/";
			}
		
		

		//dashboard User
		@GetMapping("/User/dashboard")
		public String dashboardUser(Model model ,HttpSession session){
	        Integer uId = (Integer)session.getAttribute("uId");
			String username = (String)session.getAttribute("username");
			String userType = (String)session.getAttribute("type");
			
			
			if(username != null && userType.equals("D")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ A 
				User user = userRepo.findByUsername(username);
				model.addAttribute("userProfile" , user);
				
				List<SalePage> salePage = salePageRepo.findByuId(uId);
				System.out.println(uId);
				model.addAttribute("salePageList", salePage);
				
				return "/User/dashboard";
			}else {
				return "redirect:/pleaseLogin";
			}	
		}   

}
