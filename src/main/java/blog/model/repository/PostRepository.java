package blog.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.Date;
import org.springframework.stereotype.Repository;

import blog.model.entity.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long> {

	@Query(value = "select * from Post p where p.autor_id=?1", nativeQuery = true)
	Iterable<Post> findByAutor (Long autor);
}
