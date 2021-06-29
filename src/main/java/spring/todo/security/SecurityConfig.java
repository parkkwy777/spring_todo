package spring.todo.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	public void configure(WebSecurity web) throws Exception {
		
		web.ignoring().antMatchers("/static/**");
		web.ignoring().antMatchers("/webjars/**");
		// TODO Auto-generated method stub
		//super.configure(web); // 아무런 작업을 하지 않음

        // 스프링 시큐리티의 필터 연결을 설정하기 위한 오버라이딩이다.
        // 예외가 웹접근 URL를 설정한다.
        // ACL(Access Control List - 접근 제어 목록)의 예외 URL을 설정
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		 // 인터셉터로 요청을 안전하게 보호하는 방법을 설정하기 위한 오버라이딩이다.
		http.authorizeRequests()
		.antMatchers("/todo/**").access("hasRole('MEMBER')")
		.and().formLogin() //로그인 폼 이용
		.loginPage("/todo/login")
		.loginProcessingUrl("/todo/login")
		.failureUrl("/todo/view?error")
		.usernameParameter("id")	//스프링 시큐리티에서는 username을 기본 아이디 매핑 값으로 사용하는데 이거 쓰면 변경
		.passwordParameter("pwd")	//이건 password를 변경
		.permitAll()
		
		
		.and()
		.logout()
		.logoutSuccessUrl("/todo/view")
		.invalidateHttpSession(true)
		.and().csrf().disable();
		
		
		
		//http.sessionManagement().maximumSessions(1).maxSessionsPreventsLogin(false).expiredUrl("todo/view")
	//	.sessionRegistry();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		 // 사용자 세부 서비스를 설정하기 위한 오버라이딩이다.
		//super.configure(auth);
	
		auth.inMemoryAuthentication().withUser("hjpark").password("1234").roles("MEMBER1");
	}
	
	
}
