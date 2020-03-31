package civilize.user.pageedit;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import civilize.user.SalePage;

@Repository
public class PageContentRepo {
	
	 @PersistenceContext
	 private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล
	 
	 @SuppressWarnings("unchecked")
	public List<PageContent> findByPageId(Integer pageId) {
		Query query = entityManager.createQuery("from PageContent where pageId = :PAGEID");
		query.setParameter("PAGEID", pageId);
		return query.getResultList();
		}
	 
    public PageContent findById(Integer id) {
        return entityManager.find(PageContent.class, id);  // ค้นหา Customer ตาม id
    }

    @Transactional
    public PageContent save(PageContent pageContent) {
        entityManager.persist(pageContent);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
        return pageContent;
    }

    @Transactional
    public void delete(Integer id) {
    	PageContent pageContent = entityManager.find(PageContent.class, id);  // ค้นหาตาม id ที่ต้องการลบ
        entityManager.remove(pageContent); // เริ่มลบจริง
    }
}
