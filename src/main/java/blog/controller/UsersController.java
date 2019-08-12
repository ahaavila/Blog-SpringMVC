package blog.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import blog.model.entity.Users;
import blog.model.repository.UsersRepository;

@Controller
@RequestMapping("/users")

public class UsersController {
	
	@Autowired private UsersRepository usersRepository;

	@RequestMapping(value = {"", "/", "/index"}, method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("users/index");			
		Iterable<Users> users = usersRepository.findAll();
		mv.addObject("titulo", "Lista de Usuários");
		mv.addObject("users", users);			
		return mv;
	}
	
	@RequestMapping(value = "/read/{id}", method=RequestMethod.GET)
	public ModelAndView read(@PathVariable String id) {
		
		ModelAndView mv = new ModelAndView("users/read");			
		int id_user = Integer.parseInt(id);	
		Users user = usersRepository.findOne((long) id_user);
		mv.addObject("titulo", "Dados do Usuário");
		mv.addObject("user", user);			
		return mv;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(Users user) {
		ModelAndView mv = new ModelAndView("users/create");
		mv.addObject("titulo", "Cadastrar novo usuário");
		return mv;
	}
			
	@RequestMapping(value = "/create", method=RequestMethod.POST)
	public ModelAndView create(@Valid Users user, BindingResult result, RedirectAttributes attributes) {
				
		if (result.hasErrors()) {
			return create(user);
		}
			
		usersRepository.save(user);
		
		ModelAndView mv = new ModelAndView("redirect:/app/users");
		return mv;
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView update(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("users/update");		
		int id_user = Integer.parseInt(id);	
		Users data_user = usersRepository.findOne((long) id_user);
		mv.addObject("titulo", "Alterar dados do usuário");
		mv.addObject("user", data_user);			
		return mv;
	}
	
	@RequestMapping(value = "/update/{id}", method=RequestMethod.POST)
	public ModelAndView update(@Valid Users user, BindingResult result, RedirectAttributes attributes) {
		
		if (result.hasErrors()) {
			return update(user.getId().toString());
		}
		
		usersRepository. save(user);
		
		ModelAndView mv = new ModelAndView("redirect:/app/users");		
		return mv;
	}	
	
	@RequestMapping(value = "/delete/{id}", method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("users/delete");			
		int id_user = Integer.parseInt(id);	
		Users user = usersRepository.findOne((long) id_user);
		mv.addObject("titulo", "Exluir usuário");
		mv.addObject("user", user);			
		return mv;
	}
	
	@RequestMapping(value = "/delete_confirmed/{id}", method=RequestMethod.GET)
	public ModelAndView delete_confirmed(@PathVariable String id){			
		int user_id = Integer.parseInt(id);			
		usersRepository.delete((long) user_id);			
		ModelAndView mv = new ModelAndView("redirect:/app/users");		
		return mv;
	}

}
