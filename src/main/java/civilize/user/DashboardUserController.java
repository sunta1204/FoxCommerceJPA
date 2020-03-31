package civilize.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashboardUserController {
	
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	@Autowired
	private SalePageRepo salePageRepo;
	
	@GetMapping("/salePage/{pageId}") // ใช้แสดงลูกค้า 1 คน ตามรหัส
	public String getSalePage(@PathVariable Integer pageId, Model model) {
		SalePage salePageDetail = salePageRepo.findByPageId(pageId);
		model.addAttribute("salePageDetail", salePageDetail);
		return "/User/salePageDetail";
	}

}
