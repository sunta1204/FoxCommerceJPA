package civilize.user.pageedit;

import java.util.ArrayList;
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

import civilize.user.SalePageRepo;

@Controller
public class PageContentController {
	
	@Autowired
	private PageContentRepo pageContentRepo;
	@Autowired
	private SalePageRepo salePageRepo;

	@PostMapping("/createContent") // ใช้เพิ่มข้อมูลลูกค้า
	public String create(@ModelAttribute PageContent pageContent,@RequestParam("pageId") Integer pageId , Model model) {
		pageContentRepo.save(pageContent);
		return "redirect:/salePage/"+pageId;
	}
}
