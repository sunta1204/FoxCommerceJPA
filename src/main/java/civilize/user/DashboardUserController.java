package civilize.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class DashboardUserController {
	@Autowired
	private UserRepo userRepo; // สร้าง object Repository สำหรับเรียกใช้ในคลาส

}
