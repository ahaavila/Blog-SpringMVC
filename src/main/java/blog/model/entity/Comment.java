package blog.model.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@NotEmpty
	private String texto;

	@NotNull
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date data;
	
	@NotNull
	private Long thumpsUp;
	
	@NotNull
	private Long thumpsDown;
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Post post; //Falo que cada comentario está associado a um post
	
}