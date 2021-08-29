package vn.codegym.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
<<<<<<< HEAD
=======
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
import vn.codegym.service.Impl.MyUserDetailServiceImpl;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
<<<<<<< HEAD
//    @Autowired
//    private MyUserDetailServiceImpl myUserDetailService;
=======
    @Autowired
    private MyUserDetailServiceImpl myUserDetailService;
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
<<<<<<< HEAD
        auth.inMemoryAuthentication()
                .withUser("user").password(passwordEncoder().encode("123")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("123")).roles("ADMIN");
//        auth.userDetailsService(myUserDetailService).passwordEncoder(passwordEncoder());
=======
        auth.userDetailsService(myUserDetailService).passwordEncoder(passwordEncoder());
>>>>>>> 3f69a13f21c83079eb8eef8d7b2b641baaf304c9
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .formLogin().loginPage("/login")
                .defaultSuccessUrl("/default").permitAll()
                .and()
                .authorizeRequests().antMatchers("/default").permitAll();
//                .anyRequest().authenticated();
        http.authorizeRequests().and().rememberMe().tokenRepository(this.persistentTokenRepository()).
                tokenValiditySeconds(60 * 60 * 10);
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        InMemoryTokenRepositoryImpl inMemoryTokenRepository = new InMemoryTokenRepositoryImpl();
        return inMemoryTokenRepository;
    }
}
