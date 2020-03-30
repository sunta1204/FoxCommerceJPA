package civilize.user;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class SalePageRepo {

    @PersistenceContext
    private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล

    @SuppressWarnings("unchecked")
	public List<SalePage> findAll() {
       Query query = entityManager.createQuery("from SalePage");  // สร้าง Query ดึงข้อมูลทั้งหมดจากตาราง customer
       return query.getResultList();  // ดึงรายการผลลัพธ์จากการ Query ส่งกลับ
    }

    public SalePage findById(Integer pageId) {
        return entityManager.find(SalePage.class, pageId);  // ค้นหา Customer ตาม id
    }

    @Transactional
    public SalePage save(SalePage salePage) {
        entityManager.persist(salePage);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
        return salePage;
    }

    @Transactional
    public void delete(Integer pageId) {
        SalePage salePage = entityManager.find(SalePage.class, pageId);  // ค้นหาตาม id ที่ต้องการลบ
        entityManager.remove(salePage); // เริ่มลบจริง
    }
}