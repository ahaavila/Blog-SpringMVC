	package blog.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired DataSource dataSource; 
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
		  .usersByUsernameQuery(
		   "select username, password, enabled from Users where username=?")
		  .authoritiesByUsernameQuery(
		   "select username, role from Users where username=?");		
	}
	 
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.
			authorizeRequests()
				.antMatchers("/app/users/**").access("hasRole('ROLE_ADMIN')")
				.anyRequest().permitAll()				
				.and()
			.formLogin() 
				.loginPage("/login.jsp")
				.loginProcessingUrl("/autenticar")  //blog autenticar
				.defaultSuccessUrl("/app/users")
				.failureUrl("/login.jsp?error=true")
				.usernameParameter("username") //.usernameParameter("usuario")
				.passwordParameter("password")  //.passwordParameter("senha")
		
			.and()
				.logout()
				.logoutUrl("/logout")  //blog/logout
				.logoutSuccessUrl("/login.jsp?logout=true");			
	}	
} 
