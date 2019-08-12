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
	private Long thumbsUp;
	
	@NotNull
	private Long thumbsDown;
	
	@ManyToOne
	@OnDelete(action = OnDeleteAction.CASCADE)
	private Post post; //Falo que cada comentario está associado a um post

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Long getThumbsUp() {
		return thumbsUp;
	}

	public void setThumbsUp(Long thumpsUp) {
		this.thumbsUp = thumpsUp;
	}

	public Long getThumbsDown() {
		return thumbsDown;
	}

	public void setThumbsDown(Long thumpsDown) {
		this.thumbsDown = thumpsDown;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
}