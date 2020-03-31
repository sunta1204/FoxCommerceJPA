package civilize.user.pageedit;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PageVideoRepo {
	
	@PersistenceContext
	 private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล
	
	@SuppressWarnings("unchecked")
	public List<PageVideo> findByPageId(Integer pageId) {
		Query query = entityManager.createQuery("from PageVideo where pageId = :PAGEID");
		query.setParameter("PAGEID", pageId);
		return query.getResultList();
		}
	 
    public PageVideo findById(Integer videoId) {
        return entityManager.find(PageVideo.class, videoId);  // ค้นหา Customer ตาม id
    }

    @Transactional
    public PageVideo save(PageVideo pageVideo) {
        entityManager.persist(pageVideo);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
        return pageVideo;
    }

    @Transactional
    public void delete(Integer pictureId) {
    	PageVideo pageVideo = entityManager.find(PageVideo.class, pictureId);  // ค้นหาตาม id ที่ต้องการลบ
        entityManager.remove(pageVideo); // เริ่มลบจริง
    }

}
