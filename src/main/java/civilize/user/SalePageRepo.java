package civilize.user;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

@Repository
public class SalePageRepo {
	
	 @PersistenceContext
	 private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล
	 
	public SalePage findByPageId(Integer pageId) {
        return entityManager.find(SalePage.class, pageId);  // ค้นหา Customer ตาม id
    }
	
	@SuppressWarnings("unchecked")
	public List<SalePage> findAll() {
        Query query = entityManager.createQuery("from SalePage");  // สร้าง Query ดึงข้อมูลทั้งหมดจากตาราง customer
        return query.getResultList();  // ดึงรายการผลลัพธ์จากการ Query ส่งกลับ
    }
	
	@SuppressWarnings("unchecked")
	public List<SalePage> findByuId(Integer uId) {
		Query query = entityManager.createQuery("from SalePage where uId = :UID");
		query.setParameter("UID", uId);
		return query.getResultList();
		}

	
}
