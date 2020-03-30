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

@Controller
public class DashboardUserController {
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	private SalePageRepo salePageRepo;
	
	@RequestMapping("/pleaseLogin")
    public String plLogin(Model model) {
		model.addAttribute("pleaseLogin", "pleaseLogin");
		return "/index";
    }

	@GetMapping("/user/dashboard") // ใช้แสดงข้อมูลลูกค้าทั้งหมด
	public String getSalePageList(Model model) {
		List<SalePage> salePageList = salePageRepo.findAll();
		model.addAttribute("salePageList", salePageList);
		return "/list";
	}
	

	@GetMapping("/salepage/{pageId}") // ใช้แสดงลูกค้า 1 คน ตามรหัส
	public String getSalePage(@PathVariable Integer pageId, Model model) {
		SalePage salePage = salePageRepo.findById(pageId);
		model.addAttribute("salePage", salePage);
		return "/User/salePageDetail";
	}

	@PostMapping("/salepage/create") // ใช้เพิ่มข้อมูลลูกค้า
	public String salePageCreate(@ModelAttribute SalePage salePage, Model model) {
		salePageRepo.save(salePage);
		return "redirect:/user/dashboard";
	}

	@GetMapping("/user/editSalePage/{pageId}") // ใช้โหลดข้อมูลลูกค้า 1 คน ตามรหัส แล้วส่งไปแสดงในฟอร์ม
	public String load(@PathVariable Integer pageId, Model model) {
		SalePage salePage = salePageRepo.findById(pageId);
		model.addAttribute("salePage", salePage);
		return "/edit-form";// ส่งไปแสดงผลในฟอร์มแก้ไข
	}

	@PostMapping("/customer/edit") // ใช้แก้ไขข้อมูลลูกค้า
	public String update(@ModelAttribute SalePage editSalePage, Model model) {
		SalePage oldSalePage = salePageRepo.findById(editSalePage.getPageId());
		oldSalePage.setPageName(editSalePage.getPageName());
		salePageRepo.save(oldSalePage);
		return "redirect:/user/dashboard";// ส่งไปยัง path แสดงข้อมูลลูกค้าทั้งหมด
	}

	@GetMapping("/user/delete/{pageId}") // ใช้ลบข้อมูลลูกค้าตามรหัส
	public String delete(@PathVariable Integer pageId) {
		salePageRepo.delete(pageId);
		return "redirect:/user/dashboard";// ส่งไปยัง path แสดงข้อมูลลูกค้าทั้งหมด
	}
}
