package spring.todo.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import spring.todo.repository.MemberDao;
import spring.todo.vo.Member;


@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberDao dao; 
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
		System.out.println("username:"+ username);
		Member  securityUser = new Member();
		Member member = dao.login(username); 
		
		if(member !=null){
			System.out.println(member.getId());
			System.out.println(member.getPwd());
			System.out.println(member.getAuth());
			
			securityUser.setId(member.getId());
			securityUser.setPwd(member.getPwd());

			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
			authorities.add(new SimpleGrantedAuthority(member.getAuth()));
			
			securityUser.setAuthorities(authorities);
			System.out.println(securityUser.toString());
		} 
		
		return securityUser;
	}

	
	
}
