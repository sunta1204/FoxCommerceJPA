package civilize.user;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class RegisterController {
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	
	@RequestMapping("/pleaseLogin")
    public String plLogin(Model model) {
		model.addAttribute("pleaseLogin", "pleaseLogin");
		return "/index";
    }
	
	//index
	@RequestMapping("/")
    public String intdex(Model model) {
		return "/index";
    }
	
	@PostMapping("/register") // ใช้เพิ่มข้อมูลลูกค้า
	public String create(@ModelAttribute User user, Model model, @RequestParam("username") String username , @RequestParam("password") String password) {
		System.out.println(username);
		System.out.println(password);
		if(username == "" || password == "") {
			model.addAttribute("errorRegis", "Register failed");
			return "redirect:/";
		}else {
			userRepo.save(user);
			return "redirect:/";
		}
	}
	
	
}
