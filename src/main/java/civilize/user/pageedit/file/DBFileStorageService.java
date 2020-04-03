package civilize.user.pageedit.file;

import civilize.user.pageedit.file.FileStorageException;
import civilize.user.pageedit.file.MyFileNotFoundException;
import civilize.user.pageedit.file.DBFile;
import civilize.user.pageedit.file.DBFileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@Service
public class DBFileStorageService {

    @Autowired
    private DBFileRepository dbFileRepository;

    public DBFile storeFile(MultipartFile file,Integer pageId) {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
        
        
            // Check if the file's name contains invalid characters
            if(fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            DBFile dbFile = new DBFile(fileName, file.getContentType(), pageId);

            return dbFileRepository.save(dbFile);
        
    }
}

