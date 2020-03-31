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
    
    @SuppressWarnings("unchecked")
	public List<User> findAll() {
        Query query = entityManager.createQuery("from User");  // สร้าง Query ดึงข้อมูลทั้งหมดจากตาราง customer
        return query.getResultList();  // ดึงรายการผลลัพธ์จากการ Query ส่งกลับ
    }
    
    @SuppressWarnings("rawtypes")
	public User findByUsername(String username) {
    	Query query = entityManager.createQuery("from User where username = :USERNAME");
    	query.setParameter("USERNAME", username);
    	List resultList = query.getResultList();
    	return resultList.isEmpty() ? null : (User) resultList.get(0);
    	}
    
    @SuppressWarnings("unchecked")
	public User findByUsernamePassword(String username , String password) {
    	Query query = entityManager.createQuery("from User where username = :USERNAME and password = :PASSWORD");
    	query.setParameter("USERNAME", username);
    	query.setParameter("PASSWORD", password);
    	List<User> resultList = query.getResultList();
    	
    	return resultList.isEmpty() ? null : (User) resultList.get(0);
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