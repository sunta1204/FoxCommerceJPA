package civilize.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	
	@RequestMapping("/pleaseLogin")
    public String plLogin(Model model) {
		model.addAttribute("pleaseLogin", "pleaseLogin");
		return "/index";
    }
	
	//login
		@RequestMapping(value = "/userLogin" , method = RequestMethod.POST )
		public String Login(Model model, HttpSession session , @RequestParam("username") String username 
				, @RequestParam("password") String password){
			try {
				User user =  userRepo.findByUsernamePassword(username, password);
				if(user == null) {
					//Login Failed User pass invalid
					model.addAttribute("Error" , "Login Failed !!");
					return "/index";
				} else {
						// Admin
						if(user.getType().equals("S")) {
							session.setAttribute("uId", user.getuId());
							session.setAttribute("username", user.getUsername());
							
							Integer u_id = (Integer) session.getAttribute("uId");
							
							User userProfile = userRepo.findById(u_id);
							model.addAttribute("userProfile" , userProfile);
							return "redirect:/User/dashboard";
													
						//User	
						}else if (user.getType().equals("G")) {
							session.setAttribute("uId", user.getuId());
							session.setAttribute("username", user.getUsername());
							
							Integer u_id = (Integer) session.getAttribute("uId");
							
							User userProfile = userRepo.findById(u_id);
							model.addAttribute("userProfile" , userProfile);
							return "redirect:/User/dashboard";
						
	                    }else if (user.getType().equals("P")) {
	                    	session.setAttribute("uId", user.getuId());
							session.setAttribute("username", user.getUsername());
							
							Integer u_id = (Integer) session.getAttribute("uId");
							
							User userProfile = userRepo.findById(u_id);
							model.addAttribute("userProfile" , userProfile);
							return "redirect:/User/dashboard";
						
	                    }else if (user.getType().equals("D")) {
	                    	session.setAttribute("uId", user.getuId());
							session.setAttribute("username", user.getUsername());
							
							Integer u_id = (Integer) session.getAttribute("uId");
							
							User userProfile = userRepo.findById(u_id);
							model.addAttribute("userProfile" , userProfile);
							return "redirect:/User/dashboard";
						
	                    }
	                    //Error
					}
				} catch (Exception e) {
					model.addAttribute(e);
					return "/index";
	            }
	            return "/index";
	            
	        }
		
}
