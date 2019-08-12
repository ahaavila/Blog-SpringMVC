package blog.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import blog.model.entity.Users;

@Repository
public interface UsersRepository extends CrudRepository<Users, Long> {
	
	@Query(value = "select u.id from Users u where u.username=?1", nativeQuery = true)
	Long findByUsername (String username);

}
