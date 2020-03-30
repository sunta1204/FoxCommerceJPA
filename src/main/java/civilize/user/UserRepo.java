package civilize.user;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class UserRepo {

    @PersistenceContext
    private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล

    //@SuppressWarnings("unchecked")
	//public List<User> findAll() {
    //    Query query = entityManager.createQuery("from User");  // สร้าง Query ดึงข้อมูลทั้งหมดจากตาราง customer
    //   return query.getResultList();  // ดึงรายการผลลัพธ์จากการ Query ส่งกลับ
    //}

    public User findById(Integer uId) {
        return entityManager.find(User.class, uId);  // ค้นหา Customer ตาม id
    }
    
    public User findByUsernamePassword(String username , String password) {
    	return entityManager.find(User.class, username);
    }

    @Transactional
    public User save(User user) {
        entityManager.persist(user);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
        return user;
    }

    @Transactional
    public void delete(Integer uId) {
        User user = entityManager.find(User.class, uId);  // ค้นหาตาม id ที่ต้องการลบ
        entityManager.remove(user); // เริ่มลบจริง
    }
}