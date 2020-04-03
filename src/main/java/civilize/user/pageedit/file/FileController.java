package civilize.user.pageedit.file;

import civilize.user.pageedit.file.DBFile;
import civilize.user.pageedit.file.UploadFileResponse;
import civilize.user.pageedit.file.DBFileStorageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

@Controller
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private DBFileStorageService dbFileStorageService;

    @PostMapping("/uploadFile")
    public String uploadFile(@RequestParam("file") MultipartFile file, HttpSession session, @RequestParam("pageId") Integer pageId) throws SQLException, IOException {
        DBFile dbFile = dbFileStorageService.storeFile(file,pageId);
        
        String name1 = StringUtils.cleanPath(file.getOriginalFilename());
        System.out.println(name1);
        
        byte[] bytes = file.getBytes();
		// Creating the directory to store file
		//String rootPath = System.getProperty("user.dir");
		//File dir = new File(rootPath +File.separator+ "tmpFiles");
		File dir = new File("src/main/webapp/pagepicture");
		if (!dir.exists())
			dir.mkdirs();

		// Create the file on server
		File serverFile = new File(dir.getAbsolutePath()+ File.separator + name1 +".jpg");
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
		stream.write(bytes);
		stream.close();

		return "redirect:/salePage/"+pageId;
    }

}