package blog.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.Date;
import org.springframework.stereotype.Repository;

import blog.model.entity.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long> {

	@Query(value = "select * from Comment c where c.post_id=?1", nativeQuery = true) //recupera através desta query quais que são os comentarios associados aquele post id
	Iterable<Comment> findByPost (Long post); //recupera uma lista de comentarios no banco de dados
	
}