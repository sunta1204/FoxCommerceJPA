package civilize.user.pageedit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageVideoController {
	
	@Autowired
	private PageVideoRepo pageVideoRepo;
	
	@PostMapping("/addVideo") // ใช้เพิ่มข้อมูลลูกค้า
	public String create(@ModelAttribute PageVideo pageVideo,@RequestParam("pageId") Integer pageId , Model model) {
		pageVideoRepo.save(pageVideo);
		return "redirect:/salePage/"+pageId;
	}

}
