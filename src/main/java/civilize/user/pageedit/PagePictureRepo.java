package civilize.user.pageedit;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class PagePictureRepo {
	
	@PersistenceContext
	 private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล
	
	@SuppressWarnings("unchecked")
	public List<PagePicture> findByPageId(Integer pageId) {
		Query query = entityManager.createQuery("from PagePicture where pageId = :PAGEID");
		query.setParameter("PAGEID", pageId);
		return query.getResultList();
		}
	 
    public PagePicture findById(Integer pictureId) {
        return entityManager.find(PagePicture.class, pictureId);  // ค้นหา Customer ตาม id
    }

    @Transactional
    public PagePicture save(PagePicture pagePicture) {
        entityManager.persist(pagePicture);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
        return pagePicture;
    }

    @Transactional
    public void delete(Integer pictureId) {
    	PagePicture pagePicture = entityManager.find(PagePicture.class, pictureId);  // ค้นหาตาม id ที่ต้องการลบ
        entityManager.remove(pagePicture); // เริ่มลบจริง
    }

}
