
package blog.controller;


import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import blog.model.entity.*;
import blog.model.repository.*;

@Controller
@RequestMapping("/posts")

public class PostController {
	
	@Autowired private PostRepository postRepository;
	@Autowired private UsersRepository usersRepository;
	@Autowired private CommentRepository commentRepository;
	
	private long getAuthenticatedUser() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		return usersRepository.findByUsername(username);
	}

	@RequestMapping(value = {"", "/", "/index"}, method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("posts/index");	//referencia a view post/index
		Iterable<Post> posts = postRepository.findAll(); //pega todas as informações do banco de dados e coloca dois objetos nessa pagina
		mv.addObject("titulo", "Lista de Posts"); // coloca o titulo, uma string
		mv.addObject("posts", posts);	// e o posts e pega a variavel posts "Iterable<Post> posts" e coloca aqui dentro
		return mv;
	}
	
	@RequestMapping(value = {"/list"}, method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("posts/list");	//referencia a view post/list
		Iterable<Post> posts = postRepository.findAll(); //pega todas as informações do banco de dados e coloca dois objetos nessa pagina
		mv.addObject("titulo", "Posts"); // coloca o titulo, uma string
		mv.addObject("posts", posts);	// e o posts e pega a variavel posts "Iterable<Post> posts" e coloca aqui dentro
		return mv;
	}
	
	@RequestMapping(value = "/read/{id}", method=RequestMethod.GET)
	public ModelAndView read(@PathVariable String id) {		
		ModelAndView mv = new ModelAndView("posts/read");			
		long id_post = Long.parseLong(id);		
		Post post = postRepository.findOne(id_post);
		mv.addObject("titulo", "Dados do Post");
		mv.addObject("post", post);	
		Iterable<Comment> comments = commentRepository.findByPost(id_post);
		mv.addObject("comments", comments);
		return mv;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(Post post) {
		ModelAndView mv = new ModelAndView("posts/create");
		mv.addObject("titulo", "Cadastrar novo Post");
		return mv;
	}
			
	@RequestMapping(value = "/create", method=RequestMethod.POST)
	public ModelAndView create(@Valid Post post, BindingResult result, RedirectAttributes attributes) {
				
		//Pegar as informacoes do usuario e transmiti-las
		long id_user = getAuthenticatedUser();
		
		Users user = usersRepository.findOne(id_user);
		post.setAutor(user);
		
		if (result.hasErrors()) {
			return create(post);
		}
		
		postRepository.save(post);
		
		ModelAndView mv = new ModelAndView("redirect:/app/posts");
		return mv;
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView update(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("posts/update");		
		int id_user = Integer.parseInt(id);	
		Post data_post = postRepository.findOne((long) id_user);
		mv.addObject("titulo", "Alterar dados do Post");
		mv.addObject("post", data_post);			
		return mv;
	}
	
	@RequestMapping(value = "/update/{id}", method=RequestMethod.POST)
	public ModelAndView update(@Valid Post post, BindingResult result, RedirectAttributes attributes) {
		
		long id_user = getAuthenticatedUser();		
		Users user = usersRepository.findOne((long) id_user);			
		post.setAutor(user);
		
		if (result.hasErrors()) {
			return update(post.getId().toString());
		}
		
		postRepository.save(post);
		
		ModelAndView mv = new ModelAndView("redirect:/app/posts");		
		return mv;
	}	
	
	@RequestMapping(value = "/delete/{id}", method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("posts/delete");			
		int id_user = Integer.parseInt(id);	
		Post post = postRepository.findOne((long) id_user);
		mv.addObject("titulo", "Exluir Post");
		mv.addObject("post", post);			
		return mv;
	}
	
	@RequestMapping(value = "/delete_confirmed/{id}", method=RequestMethod.GET)
	public ModelAndView delete_confirmed(@PathVariable String id){			
		int post_id = Integer.parseInt(id);			
		postRepository.delete((long) post_id);			
		ModelAndView mv = new ModelAndView("redirect:/app/posts");		
		return mv;
	}

}