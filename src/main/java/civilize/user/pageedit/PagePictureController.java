package civilize.user.pageedit;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import civilize.user.UserRepo;

@Controller
public class PagePictureController {
	
	@Autowired
	private PagePictureRepo pagePictureRepo;
	
	
	//For User Login
	@PostMapping("/addPicture" )
	public String uploadPicture(@ModelAttribute PagePicture pagePicture,HttpSession session,@RequestParam("pictureName") MultipartFile pictureName
			,@RequestParam("pageId") Integer pageId, Model model)  {
		
		String user = (String)session.getAttribute("username");
		String userType = (String)session.getAttribute("type");
		
		if(user != null && userType.equals("D")) { //ถ้า user ไม่มีค่า และ userStatus มีค่าเท่ากับ U
		
			pagePictureRepo.save(pagePicture);
			
			String name1 = user;
			if (!pictureName.isEmpty()) {
				try {
					byte[] bytes = pictureName.getBytes();
					// Creating the directory to store file
					//String rootPath = System.getProperty("user.dir");
					//File dir = new File(rootPath +File.separator+ "tmpFiles");
					File dir = new File("src/main/resources/static/pagepicture");
					if (!dir.exists())
						dir.mkdirs();
	
					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()+ File.separator +name1+".jpg");
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();
	
					//logger.info("Server File Location="+ serverFile.getAbsolutePath());
					
					//System.out.println(serverFile.getAbsolutePath());
					model.addAttribute("uploadStatus", "You successfully uploaded file= " + name1 +"<br>"+serverFile.getAbsolutePath());
					//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " + name1 + " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name1 + " because the file was empty.");
		}
		
			return "redirect:/salePage/"+pageId;
	}
		else {
			return "redirect:/pleaseLogin";
		}	
	}

}
