package civilize.user.pageedit.file;

import civilize.user.pageedit.PagePicture;
import civilize.user.pageedit.PageVideo;
import civilize.user.pageedit.file.DBFile;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class DBFileRepository {
	
	@PersistenceContext
	 private EntityManager entityManager;  // ใช้จัดการ object ต่างๆกับ ตารางในฐานข้อมูล
	
	@SuppressWarnings("unchecked")
	public List<DBFile> findByPageId(Integer pageId) {
		Query query = entityManager.createQuery("from DBFile where pageId = :PAGEID");
		query.setParameter("PAGEID", pageId);
		return query.getResultList();
		}
	 
   public DBFile findById(Integer pictureId) {
       return entityManager.find(DBFile.class, pictureId);  // ค้นหา Customer ตาม id
   }

   @Transactional
   public DBFile save(DBFile dbFile) {
       entityManager.persist(dbFile);  // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object 
       return dbFile;
   }

   @Transactional
   public void delete(Integer pictureId) {
	   DBFile dbFile = entityManager.find(DBFile.class, pictureId);  // ค้นหาตาม id ที่ต้องการลบ
       entityManager.remove(dbFile); // เริ่มลบจริง
   }
}
