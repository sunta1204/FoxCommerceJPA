package civilize.user.pageedit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import civilize.user.SalePage;
import civilize.user.SalePageRepo;
import civilize.user.UserRepo;
import civilize.user.pageedit.file.DBFile;
import civilize.user.pageedit.file.DBFileRepository;
import civilize.user.pageedit.file.DBFileStorageService;

@Controller
public class PageEditController {
	
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส
	@Autowired
	private SalePageRepo salePageRepo;
	@Autowired
	private PageContentRepo pageContentRepo;
	@Autowired
	private PageVideoRepo pageVideoRepo;
	@Autowired 
	private DBFileRepository dbFileRepository;
	
	@GetMapping("/salePage/{pageId}") // ใช้แสดงลูกค้า 1 คน ตามรหัส
	public String getSalePage(@PathVariable Integer pageId, Model model) {
		
		SalePage salePageDetail = salePageRepo.findByPageId(pageId);
		model.addAttribute("salePageDetail", salePageDetail);
		
		List<PageContent> contentDescription = pageContentRepo.findByPageId(pageId);
		model.addAttribute("contentDescription", contentDescription);
		
		List<PageVideo> videoDescription = pageVideoRepo.findByPageId(pageId);
		model.addAttribute("videoDescription", videoDescription);
		
		List<DBFile> picture = dbFileRepository.findByPageId(pageId);
		model.addAttribute("picture", picture);
	
		return "/User/salePageDetail";
	}

}
